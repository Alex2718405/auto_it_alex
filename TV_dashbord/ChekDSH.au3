Opt("SendKeyDelay",50)
$tv_Url = 'https://jd.eleks.com/secure/Dashboard.jspa?selectPageId=18809'
$m_Url = 'https://jd.eleks.com/secure/Dashboard.jspa'

sleep(3000)

If WinExists("System Dashboard - ELEKS JIRA") Then
	_KoK()
	_EnterCR()
Else
	If WinExists("Dashboard - ELEKS JIRA") Then
		_OpenUrlmain($m_Url)
		_KoK()
		_EnterCR()
	Else
		If WinExists("Log in - ELEKS JIRA") Then
			_OpenUrlmain($m_Url)
			_KoK()
			_EnterCR()
		Else
			If WinExists("Confirm logout") Then
				_OpenUrlmain($m_Url)
				_KoK()
				_EnterCR()
			Else
				If WinExists("Logout - ELEKS JIRA") Then
					_OpenUrlmain($m_Url)
					_KoK()
					_EnterCR()
				Else
					sleep(1000)
				EndIf
			EndIf
		EndIf
	EndIf
EndIf

Func _OpenUrl($tv_Url)
    Local $i_Pid = Run('rundll32.exe url.dll,FileProtocolHandler ' & $tv_Url)
EndFunc

Func _OpenUrlmain($m_Url)
    Local $i_Pid = Run('rundll32.exe url.dll,FileProtocolHandler ' & $m_Url)
EndFunc

Func _KoK()
    sleep(3000)
	Send("!{TAB}")
	Send("!{TAB}")
	sleep(1000)
EndFunc

Func _EnterCR()
    send ("Tech.L1")
	send ("{TAB}")
	send ("UnY58UbXxp", 0x1)
	send ("{TAB}")
	send ("{SPACE}")
	send ("{ENTER}")	
	sleep(5000)
	_OpenUrl($tv_Url)
EndFunc
