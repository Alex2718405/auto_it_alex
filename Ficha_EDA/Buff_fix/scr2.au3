#include <GUIConstants.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$mainwindow = GUICreate("Fix Bufer ASOPD", 370, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
GUICtrlCreateLabel("Прізвище особи для пошуку", 110, 10)
GUICtrlCreateInput("", 30, 30, 300)

$findbutton = GUICtrlCreateButton("Find", 150, 60, 60)
GUICtrlSetOnEvent($findbutton, "FindButton")
GUISetState(@SW_SHOW)

While 1
  Sleep(1000)  ; Idle around
WEnd

Func FindButton()
   send("!{TAB}")
   send("Гнисюк")

EndFunc

Func CLOSEClicked()
  MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting..."); ендит окна
  Exit
EndFunc

