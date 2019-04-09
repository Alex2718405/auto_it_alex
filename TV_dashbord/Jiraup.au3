#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
;
Opt("SendKeyDelay",50)
Global $timer, $Secs, $Mins, $Hour, $Time, $bK = 0
$hGui = GUICreate("InfoTime", 200, 50, -1, -1)
;
Global $CTRL_EdtScreen = GUICtrlCreateEdit("00:00", 10, 2, 180, 45, BitOR($ES_READONLY, $ES_CENTER), $WS_EX_STATICEDGE)
GUICtrlSetFont(-1, 20)
GUICtrlSetColor(-1, 0xFF0000)
GUISetState()
;
$timer = TimerInit()
AdlibRegister("Timer", 200)
;
$s_Url = 'https://jd.eleks.com/secure/Dashboard.jspa?selectPageId=18809'
;$d_Url = 'http://172.25.0.88/zabbix/screens.php?ddreset=1' old link
$d_Url = 'http://172.25.0.198/zabbix/slides.php?elementid=1'
;
ConsoleWrite( _OpenUrl($s_Url) & @LF)
_ink()
ConsoleWrite( _OpenUrlB($d_Url) & @LF)
_ink()
;
While 1
    $iMsg = GUIGetMsg()
    Switch $iMsg
        Case $timer = TimerInit()
			$bK = 0
        Case $GUI_EVENT_CLOSE
            ExitLoop
    EndSwitch
WEnd
;
Func _OpenUrl($s_Url)
    Local $i_Pid = Run('rundll32.exe url.dll,FileProtocolHandler ' & $s_Url)
    Return ($i_Pid <> 0)
EndFunc   ;==>Brouser Open TVDashbord
;
Func _OpenUrlB($d_Url)
    Local $i_Pid = Run('rundll32.exe url.dll,FileProtocolHandler ' & $d_Url)
    Return ($i_Pid <> 0)
EndFunc   ;==>Brouser Open "Enother Site"
;
Func Timer()
    ;Local $s = 9000 - Int(TimerDiff($timer)) ; test string
	Local $s = 180000 - Int(TimerDiff($timer))
	_TicksToTime($s, $Hour, $Mins, $Secs)
    Local $sTime = $Time
    $Time = StringFormat("%02i:%02i", $Mins, $Secs)
    If $sTime > $Time Then GUICtrlSetData($CTRL_EdtScreen, $Time)
    If $s < 0 And $bK <> 1 Then
        _Run()
		$timer = TimerInit()
		$bK = 0
    EndIf
EndFunc   ;==>Timer
;
Func _ink()
	Sleep(5000)
	Send("!{TAB}")
	Send("!{TAB}")
	Sleep(3000)
	Send ("{DOWN}")
EndFunc
;
Func _Run()
	send ("^{TAB}")
	sleep(1000)
	send ("{F5}")
EndFunc   ;==>send F5