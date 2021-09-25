[General]
SyntaxVersion=2
BeginHotkey=98
BeginHotkeyMod=2
PauseHotkey=98
PauseHotkeyMod=2
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=2d234a01-7841-426a-b4b9-a7139180beec
Description=自動挖掘
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
風之國度 自動挖掘程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//挖掘
	Call Lib.Util.click_if(837, 484, "059AF4")
Loop
