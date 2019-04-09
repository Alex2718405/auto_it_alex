
#include <GUIConstants.au3>

GUICreate("test", 300, 250)
GUISetFont(12)

$pass = InputBox ("enter password", "please enter your password","","!",150,80)


GUICtrlCreateLabel("one line input", 4, 4)
$put1 = GUICtrlCreateInput("", 4, 25, 200, 25)
GUICtrlCreateLabel("Multi line input", 4, 60)
$put2 = GUICtrlCreateEdit("", 4, 80, 150, 100)
$send = GUICtrlCreateButton("send all to file", 4, 215, 150, 25)

GUISetState()



While  1
    $msg = GUIGetMsg()
    If $pass <> "my-pass" Then
        MsgBox (1,"warning" , "incorrect password" & @CRLF & "tRY AGAIN ?")
    EndIf
    If $msg = $GUI_EVENT_CLOSE Then ExitLoop
    If $msg = $send Then SendMyData ()
WEnd



Func SendMyData()
    FileDelete('test.inf')
    $data = "[General]" & @CRLF & GUICtrlRead($put1) & @CRLF & @CRLF & GUICtrlRead($put2)
    FileWrite('\test.inf', $data)
    MsgBox(0,'Info','Data written to test.inf')
EndFunc