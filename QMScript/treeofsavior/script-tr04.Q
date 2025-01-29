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
MacroID=f143dd81-f39d-4748-b648-e43368830d60
Description=自動擺攤
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
原神 自動擺攤程序

版本: 1.0
作者: Rabitto
================================
*/

//主程序內容
Call Lib.Util.program_init("treeofsavior")

Do While 1
	//如果沒有手藝
	If Lib.Util.color_match(1138, 342, "DBF4FD") = 0 Then
		//更多
		Call Lib.Util.wait_click(1224, 250, "D4EEF7")
	End If
	//手藝
	Call Lib.Util.wait_click(1138, 342, "DBF4FD")
	//開始擺攤
	Call Lib.Util.wait_click(71, 647, "86945F")
	//開始擺攤
	Call Lib.Util.click_if(630, 624, "9FCDEF")
	//關閉
	Call Lib.Util.wait_click(907, 103, "9ABBE7")
Loop