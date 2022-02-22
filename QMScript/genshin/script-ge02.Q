[General]
SyntaxVersion=2
BeginHotkey=98
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=2fda1a90-c62d-46a0-9f87-25ef84277360
Description=自動強化
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
原神 自動鎖定程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("genshin")
Do While 1
	//等待強化完成
	Call Lib.Util.wait_until(1002, 158, "FFA4E9")
	//快捷放入
	Call Lib.Util.click(1461, 660)
	//強化
	Call Lib.Util.click(1440, 872)
	//詳情
	Call Lib.Util.click(102, 146)
	//強化
	Call Lib.Util.click(102, 206)
Loop
