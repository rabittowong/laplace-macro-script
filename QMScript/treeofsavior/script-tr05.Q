[General]
SyntaxVersion=2
BeginHotkey=101
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=285ee002-c7b0-4588-ba10-382cc04a5ce6
Description=自動分享雨果
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
原神 自動分享雨果程序

版本: 1.0
作者: Rabitto
================================
*/

//調整大小
uwc = Plugin.Window.Find("UnityWndClass", "救世者之樹：新世界")
Call Plugin.Window.Show(uwc)
Call Plugin.Window.Move(uwc, 312, 163)
Call Plugin.Window.Size(uwc, 1296, 759)

//主程序內容
Call Lib.Util.program_init("treeofsavior")

Do While 1
	//世界
	Call Lib.Util.wait_click(835, 620, "6D8DC4")
	//等待10分鐘
	Delay 5 * 60 * 1000
Loop
