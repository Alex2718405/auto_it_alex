GUICreate("Buffer Fix v.0.1", 200, 115)
$okButton = GUICtrlCreateButton("123", 10, 10, 80, 30)
$exitButton = GUICtrlCreateButton("Exit", 110, 10, 80, 30)
$Input_log = GUICtrlCreateInput("alex", 10, 50, 180, 20)
$Input_pass = GUICtrlCreateInput("qwe", 10,80, 180, 20, 0x0020)
GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   Case $msg = $okButton
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($input))
   Case $msg = $exitButton
	  exit
   EndSelect

   WEnd