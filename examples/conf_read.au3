#include <File.au3>
#include <Array.au3>

Local $arr[0]
$conffile = FileOpen(@ScriptDir & '\conf.ini', 0)
If $conffile = -1 Then ; chek if open
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf
While 1 ;read till end
    $sLine = FileReadLine($conffile)
    If @error = -1 Then ExitLoop
	If _ArrayAdd($arr, $sLine) = 20 Then ExitLoop
WEnd
_ArrayDisplay($arr, "$avArray ПОСЛЕ _ArrayAdd()")
FileClose($conffile)

MsgBox(4096, "LooK", $arr[1])
MsgBox(4096, "LooK", $arr[3])

