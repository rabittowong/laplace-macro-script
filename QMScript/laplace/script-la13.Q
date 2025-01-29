[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=232f6ce8-94fc-4762-b1b5-280c302b54aa
Description=自動種植小麥
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
/*
================================
風之國度 自動種植小麥程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
For 1
	//家園管家
	Call click_until(741, 326, 1067, 454, "D2E9F6")
	//託管生產
	Call Lib.Util.wait_click(1067, 454, "D2E9F6")
	For i = 248 To 1019 Step 154
		//空位
		Call Lib.Util.wait_click(i, 237, "26BDF2")
		//小麥
		Call Lib.Util.wait_click(576, 275, "52E7FF")
		//開始製作
		Call Lib.Util.wait_click(853, 467, "059AF4")
		//愛心製作
		Call Lib.Util.click_if(445, 428, "059AF4")
	Next
	//關閉
	Call Lib.Util.wait_click(1130, 61, "B3D4EB")
	
	//種植小麥
	For 9
		//田地
		Call click_until(708, 487, 924, 437, "61D6FC")
		//加速
		Call Lib.Util.wait_click(924, 437, "61D6FC")
		//完成
		Call Lib.Util.wait_click(723, 497, "E19D6E")
	Next
	
	//家園管家
	Call click_until(741, 326, 1067, 454, "D2E9F6")
	//託管生產
	Call Lib.Util.wait_click(1067, 454, "D2E9F6")
	For i = 248 To 1019 Step 154
		//領取
		Call Lib.Util.wait_click(i, 307, "D68263")
	Next
	//關閉
	Call Lib.Util.wait_click(1130, 61, "B3D4EB")
Next

//左鍵點擊至顏色相同
Sub click_until(intX1, intY1, intX2, intY2, strC)
	Do Until Lib.Util.color_match(intX2, intY2, strC)
		Call Lib.Util.click(intX1, intY1)
	Loop
End Sub
