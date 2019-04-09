#include <File.au3>
_FileCreate("conf.ini")
sleep(200)
$six = 6
$hFile = FileOpen("conf.ini", 1)
; chek if file open
If $hFile = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf
$1line = "1line"
$2line = @ProgramFilesDir
$3line = "3line"
$4line = @DesktopCommonDir
$5line = $six
$6line = @ScriptFullPath

FileWrite($hFile, $1line & @CRLF)
FileWrite($hFile, $2line & @CRLF)
FileWrite($hFile, $3line & @CRLF)
FileWrite($hFile, $4line & @CRLF)
FileWrite($hFile, $5line & @CRLF)
FileWrite($hFile, $6line & @CRLF)

FileClose($hFile)

MsgBox(4096, "End", "Done", 5)
run(@ScriptDir & '\conf_read.exe')