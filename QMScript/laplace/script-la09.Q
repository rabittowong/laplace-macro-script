[General]
SyntaxVersion=2
BeginHotkey=105
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=46fa4e1c-f150-48bf-ad5f-68b03225c618
Description=自動蛋糕
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
風之國度 自動翻牌程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//橫6格
	For i = 581 To 1001 Step 84
		//豎6格
		For j = 201 To 621 Step 84
			//放置薑餅人
			MoveTo i + ancX, j + ancY
			LeftClick 1
		Next
	Next
Loop
