#include <GUIConstants.au3>

GUICreate ("Calculator", 260, 230)
; Digit's buttons
$CTRL_btn0 = GUICtrlCreateButton("0", 54, 171, 36, 29)
$CTRL_btn1 = GUICtrlCreateButton("1", 54, 138, 36, 29)
$CTRL_btn2 = GUICtrlCreateButton("2", 93, 138, 36, 29)
$CTRL_btn3 = GUICtrlCreateButton("3", 132, 138, 36, 29)
$CTRL_btn4 = GUICtrlCreateButton("4", 54, 106, 36, 29)
$CTRL_btn5 = GUICtrlCreateButton("5", 93, 106, 36, 29)
$CTRL_btn6 = GUICtrlCreateButton("6", 132, 106, 36, 29)
$CTRL_btn7 = GUICtrlCreateButton("7", 54, 73, 36, 29)
$CTRL_btn8 = GUICtrlCreateButton("8", 93, 73, 36, 29)
$CTRL_btn9 = GUICtrlCreateButton("9", 132, 73, 36, 29)
$CTRL_btnPeriod = GUICtrlCreateButton(".", 132, 171, 36, 29)

; Memory's buttons
$CTRL_btnMClear = GUICtrlCreateButton("MC", 8, 73, 36, 29)
$CTRL_btnMRestore = GUICtrlCreateButton("MR", 8, 106, 36, 29)
$CTRL_btnMStore = GUICtrlCreateButton("MS", 8, 138, 36, 29)
$CTRL_btnMAdd = GUICtrlCreateButton("M+", 8, 171, 36, 29)

; Operators
$CTRL_btnChangeSign = GUICtrlCreateButton("+/-", 93, 171, 36, 29)
$CTRL_btnDivision = GUICtrlCreateButton("/", 171, 73, 36, 29)
$CTRL_btnMultiplication = GUICtrlCreateButton("*", 171, 106, 36, 29)
$CTRL_btnSubtract = GUICtrlCreateButton("-", 171, 138, 36, 29)
$CTRL_btnAdd = GUICtrlCreateButton("+", 171, 171, 36, 29)
$CTRL_btnAnswer = GUICtrlCreateButton("=", 210, 171, 36, 29)
$CTRL_btnInverse = GUICtrlCreateButton("1/x", 210, 138, 36, 29)
$CTRL_btnSqrt = GUICtrlCreateButton("sqrt", 210, 73, 36, 29)
$CTRL_btnPercentage = GUICtrlCreateButton("%", 210, 106, 36, 29)
$CTRL_btnBackspace = GUICtrlCreateButton("Backspace", 54, 37, 63, 29)
$CTRL_btnClearE = GUICtrlCreateButton("CE", 120, 37, 62, 29)
$CTRL_btnClear = GUICtrlCreateButton("C", 185, 37, 62, 29)

; Label
$CTRL_LblMemory = GUICtrlCreateLabel("", 12, 39, 27, 26)

; Edit
$CTRL_EdtScreen = GUICtrlCreateEdit (" 0.", 8, 2, 239, 23, BitOR($ES_READONLY, $ES_RIGHT), $WS_EX_STATICEDGE)
$CTRL_LblMemory = GUICtrlCreateLabel ("", 12, 39, 27, 26, $SS_SUNKEN)

GUISetState()

Do
  $msg = GUIGetMsg()

Until $msg = $GUI_EVENT_CLOSE