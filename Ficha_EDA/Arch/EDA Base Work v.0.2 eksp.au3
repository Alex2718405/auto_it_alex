GUICreate("EDA Base Work v.0.3", 290, 130)
Opt("SendKeyDelay",50)
$var = 1 ;���������� ���� ������
$enterButton = GUICtrlCreateButton("����", 150, 90, 40, 20)
$exitButton = GUICtrlCreateButton("�����", 210, 100, 80, 30)
$Inputvar = GUICtrlCreateLabel("13", 225, 14, 20, 20)
$Inputvar = GUICtrlCreateInput("" &$var& "", 240, 10, 20, 20) ; ������ ���������
$eksppButton = GUICtrlCreateButton("Eksp +", 240, 30, 40, 30) ;������ + ���������
$ekspmButton = GUICtrlCreateButton("Eksp -", 260, 30, 40, 30) ;������ - ���������

$starteda = GUICtrlCreateButton("����� �����", 10, 10, 85, 30)
$changrnButton = GUICtrlCreateButton("������� �����", 105, 10, 90, 30)
$Input = GUICtrlCreateInput("", 10, 90, 120, 20) ; ������ �������
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
	  GUISetState(@SW_RESTORE)

   Case $msg = $searchButton ; ������ ������
	  GUISetState(@SW_MINIMIZE)
	  send ("{ENTER}")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send("{ESC}")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send ("{ALT}")
	  send ("{ENTER}")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
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

   EndSelect
   WEnd