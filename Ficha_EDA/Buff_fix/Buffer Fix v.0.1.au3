GUICreate("Buffer Fix v.0.1", 200, 80)
$okButton = GUICtrlCreateButton("��������", 10, 10, 80, 30)
$exitButton = GUICtrlCreateButton("�����", 110, 10, 80, 30)
$Input = GUICtrlCreateInput("", 10, 50, 180, 20)  ; ������
GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   Case $msg = $okButton ;������ ����������
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($input))
   Case $msg = $exitButton ;������ ������
	  exit
   EndSelect

   WEnd