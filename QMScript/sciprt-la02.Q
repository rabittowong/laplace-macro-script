[General]
SyntaxVersion=2
BeginHotkey=98
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=2d234a01-7841-426a-b4b9-a7139180beec
Description=笆备
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
ぇ瓣 笆备祘

セ: r1.0
: Rabitto
程э丁: 2021/01/10 16:31
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//备
	Call Lib.Util.click_if(837, 484, "059AF4")
Loop
