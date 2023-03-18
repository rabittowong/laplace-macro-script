[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=56d64bfb-8035-45be-8a85-abef8d8f8c42
Description=自動強化
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
原神 自動強化程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("genshin")
Do While 1
	//等待強化完成
	Call Lib.Util.wait_until(1004, 130, "FFFFFF")
	//快捷放入
	Call Lib.Util.click(1461, 660)
	//強化
	Call Lib.Util.click(1440, 872)
	//詳情
	Call Lib.Util.click(102, 146)
	//強化
	Call Lib.Util.click(102, 206)
Loop
