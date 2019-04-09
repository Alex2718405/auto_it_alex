; ----------------------------------------------------------------------------
;
; AutoIt Version: 3.1.0
; Author:       Bluebearr
; Website:      http://www.bluebearr.net
; Copyright 2007 Bluebearr.  Use of this code is governed under the
; Creative Commons Attribution 3.0 Unported license code (see http://creativecommons.org/licenses/by/3.0/)
; Any use of this script must note "Portions copyright BlueBearr." A link to http://www.bluebearr.net is appreciated.
;
; Script Function:
;   Add current user to the Administrators group, run a command as an Administrator,
;   then remove the account from the Administrators group
;   Inspired by Aaron Margosis http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx
;
; ----------------------------------------------------------------------------

; Script Start
#include <GUIConstants.au3>
#include <Constants.au3>
#include <Array.au3>
#Include <process.au3>
#include <File.au3>
#Include <string.au3>

; Dimension global variables
Global $Key, $ScriptNameCore, $AdminDefVal, $WinTitle, $AdminUsersA, $AdminDef, $LocalAdminGroup
Global $AdminAcct, $AdminPass, $CurrentUser, $CurrentPass, $AdminAcctDomain, $CurrentUserDomain

; Main

_Init()     ; Initialize
_CheckAdmin()   ; Check if we are already an Admin. If so, just call _RunAsAdmin
_GetAcct()  ; Prompt user for the Admin account and logon credentials
_MakeAdmin()    ; Add the current account to the local Administrators
_RunAsAdmin()   ; Run the commands under the current account, which is now an Admin account
_DelAdmin()     ; Remove current account from the local Administrators

; =======================
; Functions
; =======================

Func _Init()
    ; Show splash screen, and initialize variables
    Local $TempDir
    ; Show Splash
    $TempDir = _TempFile()
    DirCreate($TempDir)
    FileInstall("C:\Program Files\RunAsAdmin\RunAsAdminSplash.jpg", $TempDir & "\splash.jpg", 1)
    SplashImageOn("", $TempDir & "\splash.jpg", 240, 101, -1, -1, 1)
    ; Initialize variables
    $WinTitle = "RunAsAdmin"    ; Title for program windows
    $Key = 'HKCU\Software\Scripts\' & $WinTitle     ; Key where the default account is kept
    $ScriptNameCore = StringLeft(@ScriptName, StringInStr(@ScriptName, ".", 0, -1) - 1)     ; "Core" name of this script,
    ; so we can find files of the same name but different extension
    $AdminDefVal = $ScriptNameCore & "_AdminDef"    ; Value in registry where the default account is kept
    $AdminSID = "S-1-5-32-544"
    ; Get Administrator accounts and default admin account
    $LocalAdminGroupA = _GetMemberNameFromSID($AdminSID, @ComputerName)     ; Name of the local Administrators group
    If $LocalAdminGroupA[1] = "None"  Then
        MsgBox(0, $WinTitle, "ERROR: Could not find Administrators Group!")
        Exit
    EndIf
    $LocalAdminGroup = $LocalAdminGroupA[0]
    $AdminDef = RegRead($Key, $AdminDefVal)     ; default admin account to use
    $CurrentUser = @UserName
    $CurrentUserDomain = EnvGet("USERDOMAIN")
    SplashOff()
    DirRemove($TempDir, 1)
EndFunc   ;==>_Init

Func _CheckAdmin()
    ; Check if we are already an Administrator. If so, just run the command(s).
    If IsAdmin() Then
        _RunAsAdmin()
        SplashTextOn($WinTitle, "Account " & @UserName & " is already an Administrator.", 300, 50, -1, -1, 2, "Tahoma", 10)
        Sleep(3000)
        SplashOff()
        Exit
    EndIf
EndFunc   ;==>_CheckAdmin

Func _GetAcct()
    ; Show the interface where the user can choose the account, and then enter the passwords.
    ; == GUI generated with Koda ==
    $MMADialog = GUICreate($WinTitle, 316, 260, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, _
        $WS_GROUP, $WS_BORDER, $WS_CLIPSIBLINGS))
    GUICtrlCreateLabel("Adiminstrator account user name:", 16, 8, 161, 17, $WS_GROUP)
    ; Admin accounts
    $AdminAcctEdit = GUICtrlCreateInput($AdminDef, 48, 32, 217, 21)
    GUICtrlRead($AdminAcctEdit)
    $AdminDefaultChk = GUICtrlCreateCheckbox("&Make this account the default.", 48, 64, 177, 17, _
            BitOR($BS_CHECKBOX, $BS_AUTOCHECKBOX, $WS_GROUP))
    ; Admin account password
    GUICtrlCreateLabel("Admin account password:", 16, 88, 200, 17, $WS_GROUP)
    $AdminPassEdit = GUICtrlCreateInput("", 48, 112, 217, 21, BitOR($WS_EX_CLIENTEDGE, $ES_PASSWORD))
    If $AdminDef <> "" Then
        GUICtrlSetState(-1, $GUI_FOCUS)
    EndIf
    ; Current account
    GUICtrlCreateLabel("Current account password:", 16, 152, 200, 17)
    GUICtrlCreateLabel("[" & $CurrentUserDomain & "\" & $CurrentUser & "]", 20, 170, 196, 17)
    ;GUICtrlSetFont (-1, 8.5, 400, 2)
    ; Current account password
    $CurrentPassEdit = GUICtrlCreateInput("", 48, 187, 217, 21, BitOR($WS_EX_CLIENTEDGE, $ES_PASSWORD))
    ; Buttons
    $OKBtn = GUICtrlCreateButton("&OK", 200, 220, 73, 25, $BS_DEFPUSHBUTTON)
    $CancelBtn = GUICtrlCreateButton("&Cancel", 32, 220, 73, 25)
    ;$SettingsBtn = GUICtrlCreateButton("&Settings", 112, 256, 89, 25, 0)
    GUISetState(@SW_SHOW)
    While 1
        $msg = GUIGetMsg()
        Select
            Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
            Case $msg = $OKBtn
                ; Verify that the passwords have been entered
                If GUICtrlRead($AdminPassEdit) = "" Or GUICtrlRead($CurrentPassEdit) = "" Then
                    MsgBox(48, $WinTitle, "Please enter the password for both accounts.")
                Else
                    ; Get the selected Admin account
                    $AdminAcct = GUICtrlRead($AdminAcctEdit)
                    $AdminPass = GUICtrlRead($AdminPassEdit)
                    ; Get the current account password
                    $CurrentPass = GUICtrlRead($CurrentPassEdit)
                    ; Save the default account to the registry
                    If BitAND(GUICtrlRead($AdminDefaultChk), $GUI_CHECKED) Then
                        RegWrite($Key, $AdminDefVal, "REG_SZ", $AdminAcct)
                    EndIf
                    ExitLoop
                EndIf
            Case $msg = $CancelBtn
                ExitLoop
            Case Else
                ;;;;;;;
        EndSelect
    WEnd
    GUIDelete()
    If $AdminAcct = "" Then Exit
EndFunc   ;==>_GetAcct

Func _MakeAdmin()
    ; Make the Current user an Administrator, then the run the command under the elevated account
    ; and then remove the privileges
    ; Get the domain
    If StringInStr($AdminAcct, "\") Then
        $AdminAcctDomain = StringLeft($AdminAcct, StringInStr($AdminAcct, "\") - 1)
        $AdminAcct = StringRight($AdminAcct, StringLen($AdminAcct) - StringInStr($AdminAcct, "\"))
    Else
        $AdminAcctDomain = @ComputerName
    EndIf
    ; Make me an Administrator
    SplashTextOn($WinTitle, "Making account " & $CurrentUserDomain & '\' & $CurrentUser & " an Administrator.", _
        300, 50, -1, -1, 2, "Tahoma", 10)
    RunAsSet($AdminAcct, $AdminAcctDomain, $AdminPass)
    RunWait(@ComSpec & ' /c net localgroup ' & $LocalAdminGroup & ' "' & $CurrentUserDomain & '\' & $CurrentUser _
        & '" /ADD', @SystemDir, @SW_HIDE)
    ControlSetText($WinTitle, "Making account ", "Static1", "Launching app...")
    ; Change the RunAsSet here rather than in _RunAsAdmin so that _CheckAdmin can call _RunAsAdmin without any problem
    RunAsSet($CurrentUser, $CurrentUserDomain, $CurrentPass)
EndFunc   ;==>_MakeAdmin

Func _DelAdmin()
    ; Remove the current account from the Administrators group
    Sleep(1000)
    SplashOff()
    RunAsSet($AdminAcct, $AdminAcctDomain, $AdminPass)
    RunWait(@ComSpec & ' /c net localgroup ' & $LocalAdminGroup & ' "' & $CurrentUserDomain & '\' & $CurrentUser _
        & '" /DELETE', @SystemDir, @SW_HIDE)
EndFunc   ;==>_DelAdmin

Func _RunAsAdmin()
    ; Just run the command(s) that you want to run as an Administrator
    ; Look for one of several filenames in the current directory to run
    $AllCmdRuns = @ScriptDir & "\" & $ScriptNameCore & ".bat" & @LF _
             & @ScriptDir & "\" & $ScriptNameCore & ".cmd" & @LF _
             & @ScriptDir & "\A43.exe"
    $CmdRunA = StringSplit($AllCmdRuns, @LF)
    $CmdRun = "***None***"
    For $i = $CmdRunA[0] To 1 Step - 1
        If FileExists($CmdRunA[$i]) Then $CmdRun = $CmdRunA[$i]
    Next
    If $CmdRun = "***None***"  Then
        ; No external batch files to run, just open command prompt
        Run(@ComSpec & ' /k title *** ' & $CurrentUserDomain & '\' & $CurrentUser & ' as Admin *** & ver & color 4f')
        Return
    EndIf
    If StringRight($CmdRun, 7) = "A43.exe"  Then
        $CmdRun = $CmdRun & " C:\"
        Run($CmdRun, @ScriptDir)
        SplashTextOn($WinTitle, "Starting A43...", 300, 50, -1, -1, 2, "Tahoma", 10)
        WinWaitActive("A43 ->", "", 15)
        SplashOff()
    Else
        Run(@ComSpec & ' /c "' & $CmdRun & '"', @ScriptDir, @SW_MINIMIZE)
    EndIf
EndFunc   ;==>_RunAsAdmin

Func _GetMemberNameFromSID($strSID, $strDomain)
    ; Return the name of a user or group account based on the SID.
    ; Returns a 2 item array. Item 1 is the name, and item 2 is "User", "Group", or "None"
    ; Generated by AutoIt Scriptomatic
    $wbemFlagReturnImmediately = 0x10
    $wbemFlagForwardOnly = 0x20
    $colItems = ""
    $strComputer = $strDomain
    Dim $MemberNameA[2]

    ; Test the group names
    $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
    $colItems = $objWMIService.ExecQuery ("SELECT * FROM Win32_Group", "WQL", _
            $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

    If IsObj($colItems) Then
        For $objItem In $colItems
            $strItemSID = $objItem.SID
            If $strItemSID = $strSID Then
                ; Found a match. Return the name and that it is a group
                $MemberNameA[0] = $objItem.Name
                $MemberNameA[1] = "Group"
                Return $MemberNameA
            EndIf
        Next
    EndIf

    ; Test the User names
    $colItems = $objWMIService.ExecQuery ("SELECT * FROM Win32_UserAccount", "WQL", _
            $wbemFlagReturnImmediately + $wbemFlagForwardOnly)
    If IsObj($colItems) Then
        For $objItem In $colItems
            $strItemSID = $objItem.SID
            If $strItemSID = $strSID Then
                ; Found a match. Return the name and that it is a user
                $MemberNameA[0] = $objItem.Name
                $MemberNameA[1] = "User"
                Return $MemberNameA
            EndIf
        Next
    EndIf
    $MemberNameA[0] = "##ERROR_NOT_FOUND##"
    $MemberNameA[1] = "None"
    SetError(1)
    Return $MemberNameA
EndFunc   ;==>_GetMemberNameFromSID