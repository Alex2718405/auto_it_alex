#include <Timers.au3>

_Main()

Func _Main()
    HotKeySet("{ESC}", "_Quit")
    Local $starttime = _Timer_Init()
    While 1
		ToolTip('ESC, чтобы выйти' & @crlf & _Timer_Diff($starttime))
		
    WEnd
EndFunc   ;==>_Main

Func _Quit()
    Exit
EndFunc   ;==>_Quit