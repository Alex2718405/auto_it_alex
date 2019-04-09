#include <GUIConstants.au3>

GUICreate("EDA Base Work v.0.2", 400, 180, 200, 200)
Opt("SendKeyDelay",50)
$enterButton = GUICtrlCreateButton("Добавить", 160, 150, 80, 20)
$exitButton = GUICtrlCreateButton("Выход", 310, 140, 80, 30)
$starteda = GUICtrlCreateButton("Старт ЄДАРП", 10, 10, 85, 30)
$changrnButton = GUICtrlCreateButton("Сменить район", 105, 10, 90, 30)
$Input = GUICtrlCreateInput("", 10, 150, 130, 20) ; строка
$searchButton = GUICtrlCreateButton("Пошук", 10, 50, 85, 30)
$exedaButton = GUICtrlCreateButton("Вихід з ЄДА", 105, 50, 85, 30)
$var = 1
$ekspButton = GUICtrlCreateButton("Eksp", 10, 100, 85, 30)
GUICtrlCreateCombo ("1300", 200,10)
$vas = GUICtrlSetData(-1, "1301|1302|1303|1304|1305|1306|1307|1308|1309|1310|1311|1312|1313|1314|1315|1316|1317|1318|1319|1320|1321|1322|1323|1324|1325|1326|1327|1328|1329|1330|1331|1332|1333|1334|1335","1301")
GUISetState(@SW_SHOW)

While 1
   $msg = GUIGetMsg()
   Select

   Case $msg = $ekspButton
	  GUISetState(@SW_MINIMIZE)
	  GUICtrlRead ($vas)
	  send ("{" & $vas & "}")



   Case $msg = $changrnButton ;зміна району
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

   Case $msg = $searchButton ;кнопка пошук
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