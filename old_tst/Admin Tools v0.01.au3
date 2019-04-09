#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Oleksandr Bondar

 Script Function:
	Basic script with admins tools for Windows 10.
	
#ce ----------------------------------------------------------------------------

GUICreate("Admin Tools v0.01", 360, 140)
Opt("SendKeyDelay",50)
;NoTrayIcon
GUICtrlCreateLabel("Active Directory Credentials", 20, 10, 150, 20)
GUICtrlCreateLabel("Login", 10, 30, 40, 20)
GUICtrlCreateLabel("Password", 10, 50, 40, 20)


;$login = GUICtrlCreateInput("", 70, 30, 120, 20) ; AD login
;$pass = GUICtrlCreateInput("", 70, 50, 120, 20, 0x0020) ; AD passord


$login = "oleksandr.bondar-m" ; AD login
$pass = "38uubQUBVp" ; AD passord
;button make admin
$fixupdate = GUICtrlCreateButton("Fix WinUpdate 1709", 210, 10, 130, 20)
$a = GUICtrlCreateButton("Fix a", 210, 30, 130, 20)
$b = GUICtrlCreateButton("Fix b", 210, 50, 130, 20)
$c = GUICtrlCreateButton("Fix c", 210, 70, 130, 20)

$exitButton = GUICtrlCreateButton("Выход", 260, 100, 80, 30)

GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
	Case $msg = $fixupdate 
	  ;GUISetState(@SW_MINIMIZE)
	  RunAs ($login , @ComputerName , $pass, 0, "c:\Windows\system32\cmd.exe", "", @SW_SHOWMAXIMIZED)
	  sleep(250)
	  sleep(50)
	  ; Exit
	
	
	Case $msg = $a
	;Run (%windir%\system32\cmd.exe)
	Run (@ComSpec)
	
	Case $msg = $b
	Run ("c:\Windows\system32\cmd.exe")
	;Run (@ComSpec)
	
	Case $msg = $c
	;Local $iPID = RunAs($login, @ComputerName, $pass, 1, "c:\Windows\system32\cmd.exe", @SW_SHOWMAXIMIZED)
	;RunAs ("oleksandr.bondar-m" , @ComputerName , "38uubQUBVp", 0, "c:\Windows\system32\dsac.exe", "", @SW_MAXIMIZE)
	;Run ("c:\Windows\system32\dsac.exe")
	Local $strUserName = "oleksandr.bondar"
	Local $strPassword = "Alex!123321"
	Local $strDirectory = "C:\Windows\"
	Local $strFiletoRun = "notepad.exe"
	RunAsWait($strUserName, @ComputerName, $strPassword, 0, $strDirectory & $strFiletoRun)
;MsgBox($MB_SYSTEMMODAL, “Title”, “Message”, 5)
	
	Case $msg = $exitButton ;кнопка вихода
	  exit
EndSelect
WEnd