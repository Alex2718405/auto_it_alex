$file = FileOpen("test.txt", 0)

; Check if file opened for reading OK
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

If $file = 1 Then
   $int = FileReadLine ( "test.txt")
   MsgBox(0, "No Error :)", "" & $int & "")

   Exit
EndIf
FileClose($file)
