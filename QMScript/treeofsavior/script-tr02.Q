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
MacroID=b3d54b0e-5a8b-41a0-baef-40f5ae4eddcb
Description=自動光耀聯賽
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
原神 自動光耀聯賽程序

版本: 1.0
作者: Rabitto
================================
*/

//主程序內容
Call Lib.Util.program_init("treeofsavior")
Do While 1
	//匹配
	Call Lib.Util.click_if(800, 650, "9BCAEE")
	
	//開戰
	If Lib.Util.color_match(531, 360, "D5FFFF") Then
		Delay 1200
		//自動戰鬥
		Call Lib.Util.click_if(818, 602, "CFE3EE")
		//向右移動
		Call move("D", 2700)
		//幻果
		Call Lib.Util.click(1214, 333)
		//關閉介面
		Call Lib.Util.wait_until(854, 697, "6E8EC2")
		Delay 1200
		Call Lib.Util.click(854, 697)
		Delay 1200
	End If
Loop

//移動
Sub move(keyK, intX)
	//按下
	KeyDown keyK, 1
	Delay intX
	//彈起
	KeyUp keyK, 1
	Delay 300
End Sub
