GUICreate("EDA Base Work v.0.3", 300, 150)
Opt("SendKeyDelay",50)
$var = 1 ;переменная кода района
$enterButton = GUICtrlCreateButton("ВКИД", 150, 120, 40, 20)
$exitButton = GUICtrlCreateButton("Выход", 210, 110, 80, 30)
$Inputvar = GUICtrlCreateLabel("13", 225, 14, 20, 20)
$Inputvar = GUICtrlCreateInput("" &$var& "", 240, 10, 20, 20) ; строка лічильника
$eksppButton = GUICtrlCreateButton("Eksp +", 210, 40, 40, 20) ;кнопка + лічильника
$ekspmButton = GUICtrlCreateButton("Eksp -", 250, 40, 40, 20) ;кнопка - лічильника
$starteda = GUICtrlCreateButton("Старт ЄДАРП", 10, 10, 85, 30)
$changrnsiclButton = GUICtrlCreateButton("Пошук по області", 10, 90, 185, 20)

$changrnButton = GUICtrlCreateButton("Сменить район", 105, 10, 90, 30)
$Input = GUICtrlCreateInput("", 10, 120, 120, 20) ; строка прізвища
$searchButton = GUICtrlCreateButton("Пошук", 10, 50, 85, 30)
$exedaButton = GUICtrlCreateButton("Вихід з ЄДА", 105, 50, 90, 30)

GUISetState(@SW_SHOW)
While 1
   $msg = GUIGetMsg()
   Select
   Case $msg = $changrnButton ; кнопка авто-зміни району
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
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")
	  GUISetState(@SW_RESTORE)

   Case $msg = $searchButton ; кнопка пошуку
	  GUISetState(@SW_MINIMIZE)
	  ControlClick("Оболонка середовища функціонування", "[CLASS:Edit; INSTANCE:1]")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send("{ESC}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send ("{ALT}")
	  send ("{ENTER}")
	  ControlClick("Вибір  критеріїв  для   пошуку  запису  в  реєстрі  пільговиків", "[CLASS:Button; INSTANCE:4]")
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

   Case $msg = $eksppButton ;кнопка + лічильника
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")

   Case $msg = $ekspmButton ;кнопка - лічильника
	  $var = $var - 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")

   Case $msg = $changrnsiclButton ;кнопка пошуку по області
	  For $varA = 1 To 35 Step 1  ; 2 переменная кода района
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
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")
	  ; -----------------------------  межа 2 модулів
	  ControlClick("Оболонка середовища функціонування", "[CLASS:Edit; INSTANCE:1]")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send ("{ALT}")
	  send ("{ENTER}")
	  ControlClick("Вибір  критеріїв  для   пошуку  запису  в  реєстрі  пільговиків", "[CLASS:Button; INSTANCE:4]")
	  sleep(100)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
	  Next
		 GUISetState(@SW_RESTORE)
		 MsgBox(4096, "Кінець циклу", "ПОШУК ЗАКІНЧЕНО!")


EndSelect
WEnd