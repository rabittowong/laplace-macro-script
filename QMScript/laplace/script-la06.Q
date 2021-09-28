[General]
SyntaxVersion=2
BeginHotkey=102
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=09a5d4f8-1cdb-428e-bb96-440eec8456f2
Description=自動升星
Enable=1
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
風之國度 自動升星程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//戰紋
	LeftClick 1
	//升星
	Call Lib.Util.wait_until(1029, 160, "0297F4")
	//保存滑鼠坐標
	GetCursorPos intX, intY
	//開啟升星
	Call Lib.Util.click(1029, 160)
	//跳過動畫
	Call Lib.Util.click_if(319, 551, "97BDD7")
	//升星
	For 5
		Call Lib.Util.wait_click(364, 649, "E19D6E")
	Next
	//關閉升星
	Call Lib.Util.wait_click(1234, 51, "A8CEF1")
	//回復滑鼠坐標
	MoveTo intX, intY
Loop
