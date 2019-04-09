#include <GUIConstants.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$mainwindow = GUICreate("Ficha to ASOPD", 400, 200)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
GUICtrlCreateLabel("Hello world! How are you?", 30, 10)
GUICtrlCreateInput("", 30, 60, 300)
$vvod = GUICtrlCreateInput
$findbutton = GUICtrlCreateButton("Find", 150, 150, 60)
GUICtrlSetOnEvent($findbutton, "FindButton")
GUISetState(@SW_SHOW)

While 1
  Sleep(1000)  ; Idle around
WEnd

Func FindButton()
   MsgBox(0, "GUI Event", "You pressed Find Button!")
   send(vvod)
EndFunc

Func CLOSEClicked()
  ;Note: at this point @GUI_CTRLID would equal $GUI_EVENT_CLOSE,
  ;and @GUI_WINHANDLE would equal $mainwindow
  MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting...")
  Exit
EndFunc

