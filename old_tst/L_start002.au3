#include <GUIConstants.au3>

GUICreate("Hello World!" ,200, 100)
GUICtrlCreateLabel ("Hello World!, need asist", 30, 10)
GUICtrlCreateButton("OK",70,50,60)
GUISetState(@SW_Show)
sleep(2000)