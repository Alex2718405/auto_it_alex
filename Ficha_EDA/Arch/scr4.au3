GUICreate("EDA Ease Work v.0.1", 400, 180)
$enterButton = GUICtrlCreateButton("��������", 160, 150, 80, 20)
$exitButton = GUICtrlCreateButton("�����", 310, 140, 80, 30)
Opt("SendKeyDelay",100)
$starteda = GUICtrlCreateButton("����� �����", 10, 10, 85, 30)
$changrnButton = GUICtrlCreateButton("������� �����", 110, 10, 90, 30)
$Input1 = GUICtrlCreateInput("", 205, 15, 30, 20) ; ������ �������
$Input = GUICtrlCreateInput("", 10, 150, 130, 20) ; ������
$changButton = GUICtrlCreateButton("� �����", 10, 60, 90, 30)
GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select

   Case $msg = $changrnButton
	  GUISetState(@SW_MINIMIZE)
	  send ("{ALT}")
	  send ("{RIGHT}")
	  send ("{ENTER}")
	  send ("{ENTER}")
	  WinWaitActive("�����i� ������i�")
	  send ("{down "& $Input1 &"}")
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  send ("{ENTER}")

   Case $msg = $changButton
	  GUICtrlRead($input1)
   If StringInStr($Input1, ",") <> 0 Then
    $Input1 = StringReplace($Input1, ",", ".")
    $Input1 = StringRegExpReplace($Input1, "[^.0-9]", "")
   Else
    $Input1 = StringRegExpReplace($Input1, "[^0-9]", "")
   EndIf

	  GUISetState(@SW_MINIMIZE)
	  send ("{down "& $Input1 &"}")




   Case $msg = $starteda ;������ ������ ������
	  Run('I:\edarp\run.exe')
	  WinWaitActive("��������� �����������")
	  GUISetState(@SW_MINIMIZE)
	  send ("ZAG") ;log �����
	  send ("{TAB}")
	  send ("123") ;pass
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  send ("{ENTER}")
	  GUISetState(@SW_RESTORE)

   Case $msg = $enterButton ;������ ����������
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($input))
	  sleep(250)
	  send ("{ENTER}")

   Case $msg = $exitButton ;������ ������
	  exit

   EndSelect
   WEnd