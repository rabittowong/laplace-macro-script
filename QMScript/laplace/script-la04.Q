[General]
SyntaxVersion=2
BeginHotkey=100
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=d65f3723-a89e-48d8-ac12-bc2254c6dffd
Description=自動攻城
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
風之國度 自動攻城程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//技能1
	Call Lib.Util.click(1030, 674)
	//技能2
	Call Lib.Util.click(1030, 578)
	//技能3
	Call Lib.Util.click(1104, 512)
Loop
