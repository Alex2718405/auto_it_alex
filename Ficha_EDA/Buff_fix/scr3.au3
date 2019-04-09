GUICreate("GUICtrlRead", 200, 100)
$Button = GUICtrlCreateButton("OK", 10, 10, 180, 30)
$Input = GUICtrlCreateInput("", 10, 50, 180, 30)
Opt("GUIOnEventMode", 1)
GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   Case $msg = $Button
	  send("!{TAB}")
	  send(GUICtrlRead($input))
	  ;MsgBox(0, "", GUICtrlRead($input))
   EndSelect
   WEnd

Func CLOSEClicked()
  MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting..."); ендит окна
  Exit
EndFunc