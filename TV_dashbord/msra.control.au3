while true;
	If WinWaitActive("Windows Remote Assistance - Being helped", "", 1) then
		sleep(200)
	Else
		If WinWaitActive("Windows Remote Assistance") then
		send("{LEFT}")
		send("{ENTER}")
		Else
		EndIf
	EndIf
WEnd
