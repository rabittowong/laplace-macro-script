[General]
SyntaxVersion=2
BeginHotkey=100
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=d398c50b-19f6-4b25-b17f-4a86008fc8f4
Description=自動賣卡
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
/*=================================================
式姬之庭
自動賣卡程序

最後更新: 04/05/2016 17:20
測試瀏覽器: Firefox 45.0
=================================================*/

//主程序內容
Call initial
For selY = 211 To 417 Step 103
	For selX = 53 To 525 Step 59
		Call click_point(selX, selY)
	Next
Next
Do
	For 3
		Call click_point(551, 495)
	Next
	For selY = 285 To 491 Step 103
		For selX = 53 To 525 Step 59
			Call click_point(selX, selY)
		Next
	Next
Loop
//主程序結束

//程序初始化
Sub initial
	//獲得遊戲視窗左上角的座標
	corX = 154
	corY = 148
	Delay 300
End Sub

//定義滑鼠子程序
Sub click_point(intX, intY)
	//左鍵
	MoveTo intX + corX, intY + corY
	LeftClick 1
	Delay 100
End Sub
