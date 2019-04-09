GUICreate("EDA Base Work v.0.35", 350, 120)
Opt("SendKeyDelay",50)
GUICtrlCreateLabel("Логин", 10, 10, 40, 20)
GUICtrlCreateLabel("Пароль", 10, 30, 40, 20)
GUICtrlCreateLabel("Прізвище", 13, 63, 50, 20)

$Inputlog = GUICtrlCreateInput("ZAG", 80, 10, 120, 20) ; строка логина
$Inputpass = GUICtrlCreateInput("123", 80, 30, 120, 20) ; строка пароля
$starteda = GUICtrlCreateButton("Start EDA", 200, 10, 60, 40)

GUICtrlCreateLabel("13", 270, 14, 20, 20)
$var = 1 ;переменная кода района
$Inputvar = GUICtrlCreateInput("" &$var& "", 285, 10, 20, 20) ; строка лічильника
$eksppButton = GUICtrlCreateButton("+", 310, 5, 25, 15) ;кнопка + лічильника
$ekspmButton = GUICtrlCreateButton("-", 310, 20, 25, 15) ;кнопка - лічильника

$Input = GUICtrlCreateInput("", 80, 60, 180, 20) ; строка прізвища
$enterButton = GUICtrlCreateButton("KeyIn", 10, 85, 60, 30)
$searchButton = GUICtrlCreateButton("Пошук в районі", 70, 85, 95, 30)
$changrnsiclButton = GUICtrlCreateButton("Пошук в області", 165, 85, 95, 30)

$changrnButton = GUICtrlCreateButton("Сменить район", 270, 40, 80, 20)
$exedaButton = GUICtrlCreateButton("Вихід з ЄДА", 270, 60, 80, 20)
$exitButton = GUICtrlCreateButton("Выход", 265, 85, 80, 30)


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
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")
	  $var = $var + 1
	  GUISetState(@SW_RESTORE)

   Case $msg = $searchButton ; кнопка пошуку
	  GUISetState(@SW_MINIMIZE)
	  send ("{ENTER}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send("{ESC}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send ("{ALT}")
	  send ("{ENTER}")
	  WinWaitActive("Вибір  критеріїв  для   пошуку  запису  в  реєстрі  пільговиків")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
	  sleep(50)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")

   Case $msg = $starteda ;кнопка старта єдарпа
	  Run('I:\edarp\run.exe')
	  WinWaitActive("Реєстрація користувача")
	  GUISetState(@SW_MINIMIZE)
	  send(GUICtrlRead($inputlog)) ;log юзера
	  send ("{TAB}")
	  send(GUICtrlRead($inputpass)) ;pass
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
	  send ("{ENTER}")
	  GUISetState(@SW_RESTORE)

   Case $msg = $enterButton ;кнопка добавления (ВКИД)
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
	  Exit

   Case $msg = $exitButton ;кнопка вихода
	  exit

   Case $msg = $eksppButton ;кнопка + лічильника
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")

   Case $msg = $ekspmButton ;кнопка - лічильника
	  $var = $var - 1
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")

   Case $msg = $changrnsiclButton ;кнопка пошуку по області
	  For $varA = 1 To 35 Step 1
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
	  ControlSetText("EDA Base Work v.0.35", "", 10, ""& $var&"")
	  $var = $var + 1
	  ; -----------------------------  межа 2 модулів
	  send ("{ENTER}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send("{ESC}")
	  WinWaitActive("ЄДАРП         Перегляд даних отримувачів різних видів пільг")
	  send ("{ALT}")
	  send ("{ENTER}")
	  WinWaitActive("Вибір  критеріїв  для   пошуку  запису  в  реєстрі  пільговиків")
	  send ("{DOWN 4}")
	  send ("{ENTER}")
	  sleep(100)
	  send(GUICtrlRead($input))
	  send ("{ENTER}")
	  WinWaitActive("Оболонка середовища функціонування")
	  Next
		 GUISetState(@SW_RESTORE)
		 MsgBox(4096, "Кінець циклу", "ПОШУК ЗАКІНЧЕНО!")


EndSelect
WEnd