#include <array.au3>
GUICreate("EDA Base Work v.0.3", 400, 180, 200, 200)
$exitButton = GUICtrlCreateButton("�����", 310, 140, 80, 30)
$eksppButton = GUICtrlCreateButton("Eksp +", 10, 100, 85, 30)
$ekspmButton = GUICtrlCreateButton("Eksp -", 10, 70, 85, 30)
$var = 15
$Input = GUICtrlCreateInput("" &$var& "", 200, 50, 100, 20) ; ������
$Inputrn = GUICtrlCreateInput("", 200, 10, 100, 20) ; ������

GUISetState(@SW_SHOW)



While 1
   $msg = GUIGetMsg()
   Select

   Case $msg = $eksppButton
	  $var = $var + 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")

   Case $msg = $ekspmButton
	  $var = $var - 1
	  ControlSetText("EDA Base Work v.0.3", "", 6, ""& $var&"")


   Case $msg = $exitButton ;������ ������
	  exit
   EndSelect

   WEnd