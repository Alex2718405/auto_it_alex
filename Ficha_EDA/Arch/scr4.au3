GUICreate("EDA Ease Work v.0.1", 400, 180)
$enterButton = GUICtrlCreateButton("Добавить", 160, 150, 80, 20)
$exitButton = GUICtrlCreateButton("Выход", 310, 140, 80, 30)
Opt("SendKeyDelay",100)
$starteda = GUICtrlCreateButton("Старт ЄДАРП", 10, 10, 85, 30)
$changrnButton = GUICtrlCreateButton("Сменить район", 110, 10, 90, 30)
$Input1 = GUICtrlCreateInput("", 205, 15, 30, 20) ; строка щетчика
$Input = GUICtrlCreateInput("", 10, 150, 130, 20) ; строка
$changButton = GUICtrlCreateButton("С район", 10, 60, 90, 30)
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
	  WinWaitActive("Перелiк ресурсiв")
	  send ("{down "& $Input1 &"}")
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
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




   Case $msg = $starteda ;кнопка старта єдарпа
	  Run('I:\edarp\run.exe')
	  WinWaitActive("Реєстрація користувача")
	  GUISetState(@SW_MINIMIZE)
	  send ("ZAG") ;log юзера
	  send ("{TAB}")
	  send ("123") ;pass
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
	  send ("{ENTER}")
	  GUISetState(@SW_RESTORE)

   Case $msg = $enterButton ;кнопка добавления
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($input))
	  sleep(250)
	  send ("{ENTER}")

   Case $msg = $exitButton ;кнопка вихода
	  exit

   EndSelect
   WEnd