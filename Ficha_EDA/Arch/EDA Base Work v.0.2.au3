GUICreate("EDA Base Work v.0.2", 290, 130)
$enterButton = GUICtrlCreateButton("ВКИД", 150, 90, 40, 20)
$exitButton = GUICtrlCreateButton("Выход", 200, 10, 80, 100)
Opt("SendKeyDelay",50)
$starteda = GUICtrlCreateButton("Старт ЄДАРП", 10, 10, 85, 30)
$changrnButton = GUICtrlCreateButton("Сменить район", 105, 10, 90, 30)
$Input = GUICtrlCreateInput("", 10, 90, 120, 20) ; строка
$searchButton = GUICtrlCreateButton("Пошук", 10, 50, 85, 30)
$exedaButton = GUICtrlCreateButton("Вихід з ЄДА", 105, 50, 90, 30)
$var = 1
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
	  send ("{down "& $var &"}")
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
	  send ("{ENTER}")
	  $var = $var + 1
	  GUISetState(@SW_RESTORE)

   Case $msg = $searchButton
	  GUISetState(@SW_MINIMIZE)
	  send ("{ENTER}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send("{ESC}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send ("{ALT}")
	  send ("{ENTER}")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
	  sleep(50)
	  send(GUICtrlRead($input))
	  sleep(250)
	  send ("{ENTER}")



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

      Case $msg = $exedaButton ;кнопка вихода з ЕДА
	  GUISetState(@SW_MINIMIZE)
	  WinClose("Оболонка середовища функціонування")
	  sleep(50)
	  send("{TAB 3}")
	  send("{ENTER}")

   Case $msg = $exitButton ;кнопка вихода
	  exit

   EndSelect
   WEnd