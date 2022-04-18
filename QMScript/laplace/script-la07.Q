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
MacroID=7dc141a7-6cb3-46b8-bfb3-a019c8564caf
Description=自動連點
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
風之國度 自動連點程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//左鍵點擊
	LeftClick 1
Loop
