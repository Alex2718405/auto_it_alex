GUICreate("EDA Base Work v.0.3", 300, 150)
Opt("SendKeyDelay",50)
$var = 1 ;���������� ���� ������
$enterButton = GUICtrlCreateButton("����", 150, 120, 40, 20)
$exitButton = GUICtrlCreateButton("�����", 210, 110, 80, 30)
$Inputvar = GUICtrlCreateLabel("13", 225, 14, 20, 20)
$Inputvar = GUICtrlCreateInput("" &$var& "", 240, 10, 20, 20) ; ������ ���������
$eksppButton = GUICtrlCreateButton("Eksp +", 210, 40, 40, 20) ;������ + ���������
$ekspmButton = GUICtrlCreateButton("Eksp -", 250, 40, 40, 20) ;������ - ���������
$starteda = GUICtrlCreateButton("����� �����", 10, 10, 85, 30)
$changrnsiclButton = GUICtrlCreateButton("����� �� ������", 10, 90, 185, 20)

$changrnButton = GUICtrlCreateButton("������� �����", 105, 10, 90, 30)
$Input = GUICtrlCreateInput("", 10, 120, 120, 20) ; ������ �������
$searchButton = GUICtrlCreateButton("�����", 10, 50, 85, 30)
$exedaButton = GUICtrlCreateButton("����� � ���", 105, 50, 90, 30)

GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   Case $msg = $changrnButton ; ������ ����-���� ������
	  GUISetState(@SW_MINIMIZE)
	  send ("{ALT}")
	  send ("{RIGHT}")
	  send ("{ENTER}")
	  send ("{ENTER}")
	  WinWaitActive("�����i� ������i�")
	  send ("{down "& $var &"}")
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  send ("{ENTER}")
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")
	  GUISetState(@SW_RESTORE)

   Case $msg = $searchButton ; ������ ������
	  GUISetState(@SW_MINIMIZE)
	  ControlClick("�������� ���������� ��������������", "[CLASS:Edit; INSTANCE:1]")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send("{ESC}")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send ("{ALT}")
	  send ("{ENTER}")
	  ControlClick("����  �������  ���   ������  ������  �  �����  ���������", "[CLASS:Button; INSTANCE:4]")
	  sleep(50)
	  send(GUICtrlRead($input))
	  sleep(250)
	  send ("{ENTER}")



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

   Case $msg = $exedaButton ;������ ������ � ���
	  GUISetState(@SW_MINIMIZE)
	  WinClose("�������� ���������� ��������������")
	  sleep(50)
	  send("{TAB 3}")
	  send("{ENTER}")

   Case $msg = $exitButton ;������ ������
	  exit

   Case $msg = $eksppButton ;������ + ���������
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")

   Case $msg = $ekspmButton ;������ - ���������
	  $var = $var - 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")

   Case $msg = $changrnsiclButton ;������ ������ �� ������
	  For $varA = 1 To 35 Step 1  ; 2 ���������� ���� ������
	  GUISetState(@SW_MINIMIZE)
	  send ("{ALT}")
	  send ("{RIGHT}")
	  send ("{ENTER}")
	  send ("{ENTER}")
	  WinWaitActive("�����i� ������i�")
	  send ("{down "& $var &"}")
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  send ("{ENTER}")
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")
	  ; -----------------------------  ���� 2 ������
	  ControlClick("�������� ���������� ��������������", "[CLASS:Edit; INSTANCE:1]")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send ("{ALT}")
	  send ("{ENTER}")
	  ControlClick("����  �������  ���   ������  ������  �  �����  ���������", "[CLASS:Button; INSTANCE:4]")
	  sleep(100)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  Next
		 GUISetState(@SW_RESTORE)
		 MsgBox(4096, "ʳ���� �����", "����� ��ʲ�����!")


EndSelect
WEnd