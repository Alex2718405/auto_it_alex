
; Script Start - Add your code below here
#NoTrayIcon : Указывает, что при запуске сценария AutoIt требуется скрыть его индикатор.
$settings = "settings.ini" ; Ини файл с настройками
$WindowName = IniRead($settings, "Settings", "WindowName", "") ; Читаем имя окна
$ProcessName = IniRead($settings, "Settings", "ProcessName", "") ; Читаем имя процесса
$Login = IniRead($settings, "Account", "Login", "") ; Читаем логин
$Password = IniRead($settings, "Account", "Password", "") ; Читаем пароль

If ProcessExists($ProcessName) Then ; Проверяем на существование процесса
WinSetState ($WindowName, "", @SW_RESTORE) ; @SW_RESTORE = восстановить ранее свернутое окно
WinActivate ($WindowName, "") ; Делаем окно активным
Send($Login) ; Посылаем логин
Send("{TAB}") ; Посылаем Tab
Send($Password) ; Посылаем пароль
Send("{ENTER}") ; Посылаем ентер
Else ; Если процесс не запущен то выводим ошибку
MsgBox(0, "Ошибка", "Процесс "&$ProcessName&" с именем окна "&$WindowName&" не найден! Проверьте настройки в файле "&$settings)
Endif


settings.ini

[Settings]
WindowName = Perfect World
ProcessName = elementclient.exe

[Account]
Login = Login
Password = Password