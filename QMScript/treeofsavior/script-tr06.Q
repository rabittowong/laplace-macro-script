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
MacroID=9f44b5b5-52c9-4309-9726-ba55a3bc8b97
Description=自動購買戒指
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
原神 自動購買戒指程序

版本: 1.0
作者: Rabitto
================================
*/

//主程序內容
Call Lib.Util.program_init("treeofsavior")

Do While 1
	//外觀
	Call Lib.Util.wait_click(263, 507, "8CB3D8")
	//其他
	Call Lib.Util.wait_click(263, 586, "8FB5DA")
	Delay 600
	
	//如果有戒指
	If Lib.Util.color_match(945, 318, "C4C9D5") Then
		//戒指
		Call Lib.Util.wait_click(945, 318, "C4C9D5")
		//如果有詳情
		If Lib.Util.color_match(487, 310, "BFDCEE") = 0 Then 
			//詳情
			Call Lib.Util.click(487, 310)
			//購買
			Call Lib.Util.wait_click(869, 609, "9ECBEF")	
		End If
	End If
Loop
