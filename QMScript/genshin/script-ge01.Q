[General]
SyntaxVersion=2
BeginHotkey=32
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c6e0fb4a-34f7-4a6f-a516-3d9b534d6751
Description=自動鎖定聖遺物
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
原神 自動鎖定聖遺物程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("genshin")
For 1
	//保存滑鼠坐標
	GetCursorPos intX, intY
	//鎖定
	Call Lib.Util.click(1540, 179)
	//回復滑鼠坐標
	MoveTo intX, intY
Next
