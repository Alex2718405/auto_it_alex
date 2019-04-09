GUICreate("EDA Base Work v.0.35", 350, 180)

Opt("SendKeyDelay",50)

GUICtrlCreateLabel("�����", 10, 10, 40, 20)
GUICtrlCreateLabel("������", 10, 30, 40, 20)
GUICtrlCreateLabel("�������", 13, 63, 50, 20)

$Inputlog = GUICtrlCreateInput("ZAG", 80, 10, 120, 20) ; ������ ������
$Inputpass = GUICtrlCreateInput("123", 80, 30, 120, 20) ; ������ ������
$starteda = GUICtrlCreateButton("Start EDA", 200, 10, 60, 40)

GUICtrlCreateLabel("13", 270, 14, 20, 20)
$var = 1 ;���������� ���� ������
$Inputvar = GUICtrlCreateInput("" &$var& "", 285, 10, 20, 20) ; ������ ���������
$eksppButton = GUICtrlCreateButton("+", 310, 5, 25, 15) ;������ + ���������
$ekspmButton = GUICtrlCreateButton("-", 310, 20, 25, 15) ;������ - ���������

$Input = GUICtrlCreateInput("!!!�������!!!", 80, 60, 180, 20) ; ������ �������
$enterButton = GUICtrlCreateButton("KeyIn", 10, 85, 60, 30)
$searchButton = GUICtrlCreateButton("����� � �����", 70, 85, 95, 30)
$changrnsiclButton = GUICtrlCreateButton("����� � ������", 165, 85, 95, 30)

$changrnButton = GUICtrlCreateButton("������� �����", 270, 40, 80, 20)
$exedaButton = GUICtrlCreateButton("����� � ���", 270, 60, 80, 20)
$exitButton = GUICtrlCreateButton("�����", 265, 85, 80, 30)

;_____________________________________________________

$Input1 = GUICtrlCreateInput("", 10, 120, 180, 20) ; ������ eksp1
$Button1 = GUICtrlCreateButton("EKSP1", 200, 120, 80, 20) ; ������ eksp1

$Input2 = GUICtrlCreateInput("", 10, 150, 180, 20) ; ������ eksp2
$Button2 = GUICtrlCreateButton("EKSP2", 200, 150, 80, 20) ; ������ eksp2

GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   ;----------------------------------------------------

   Case $msg = $Button1 ; test1
	  $file = FileOpen("filesch.txt", 0)
	  $przv = FileRead ("filesch.txt")
		 If $file = -1 Then
			MsgBox(0, "Error", "Unable to open file.")
		 EndIf

		 If $file = 1 Then
			$int = FileReadLine ( "test.txt")
			ControlSetText("EDA Base Work v.0.35", "", 20, ""& $przv &"")

		 EndIf

;~    Case $msg = $Button2 ; test2
;~ 	  $inzip = ControlGetText ("", "")
;~ 	  ControlSetText("EDA Base Work v.0.35", "", 22, ""& $inzip &"")





   ;---------------------------------------------------

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
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")
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
	  WinWaitActive("����  �������  ���   ������  ������  �  �����  ���������")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
	  sleep(50)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")

   Case $msg = $starteda ;������ ������ ������
	  Run('I:\edarp\run.exe')
	  WinWaitActive("��������� �����������")
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($inputlog)) ;log �����
	  send ("{TAB}")
	  send(GUICtrlRead($inputpass)) ;pass
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  send ("{ENTER}")
	  GUISetState(@SW_RESTORE)

   Case $msg = $enterButton ;������ ���������� (KeyIn)
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
	  Exit

   Case $msg = $exitButton ;������ ������
	  exit

   Case $msg = $eksppButton ;������ + ���������
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")

   Case $msg = $ekspmButton ;������ - ���������
	  $var = $var - 1
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")

   Case $msg = $changrnsiclButton ;������ ������ �� ������
	  For $varA = $var To 35 Step 1
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
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")
	  $var = $var + 1
	  ; -----------------------------  ���� 2 ������
	  send ("{ENTER}")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send("{ESC}")
	  WinWaitActive("�����         �������� ����� ����������� ����� ���� ����")
	  send ("{ALT}")
	  send ("{ENTER}")
	  WinWaitActive("����  �������  ���   ������  ������  �  �����  ���������")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
	  sleep(100)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")
	  WinWaitActive("�������� ���������� ��������������")
	  Next
		 GUISetState(@SW_RESTORE)
		 MsgBox(4096, "ʳ���� �����", "����� ��ʲ�����!")


EndSelect
WEnd