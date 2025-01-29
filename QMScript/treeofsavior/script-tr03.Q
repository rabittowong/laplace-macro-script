[General]
SyntaxVersion=2
BeginHotkey=99
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=e1990be1-2d64-4860-98e0-f3f0797d0f93
Description=自動呱呱蹦跳
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
原神 自動呱呱蹦跳程序

版本: 1.0
作者: Rabitto
================================
*/

//主程序內容
Call Lib.Util.program_init("treeofsavior")

For 1
	//倒數1
	Call Lib.Util.wait_until(619, 279, "3A85CF")
	Delay 1200
	//跳躍
	Call Lib.Util.move_to(1113, 636)
	//當前台階0
	Call jump(480 + 60, 1170)
	
	//當前台階1
	Call jump(570 + 420, 1170)
//	Call jump(330, 1170)
	Call jump(390, 1170)
	Call jump(510, 1170)
	Call jump(690, 1170)
	
	//當前台階6
	Call jump(360, 1170)
	Call jump(480, 1170)
	Call jump(240 + 570, 1170)
//	Call jump(390, 1170)
	Call jump(270 + 570, 1170)
	
	//當前台階11
//	Call jump(390, 1170)
	Call jump(420, 1170)
	Call jump(240 + 630, 1170)
//	Call jump(420, 1170)
	Call jump(600, 1170)
	
	//當前台階16
	Call jump(390, 1170)
	Call jump(210 + 510, 1170)
//	Call jump(270, 1170)
	Call jump(420, 1170)
	Call jump(360, 1170)
	
	//當前台階21
	Call jump(270 + 720, 1170)
//	Call jump(540, 1170)
	Call jump(510 + 60, 1170)
	Call jump(360, 1170)
	Call jump(270 + 660, 1170)
	
	//當前台階26
//	Call jump(420, 1170)
	Call jump(360, 1170)
	Call jump(240 + 720, 1170)
//	Call jump(510, 1170)
	Call jump(510 + 60, 1170)
	
	//當前台階31
	Call jump(360, 1170)
	Call jump(390, 1170)
	Call jump(540, 1170)
	Call jump(480, 1170)
	Call jump(180, 1170)
	
	//當前台階36
	Call jump(300, 1170)
	Call jump(600, 1170)
	Call jump(300, 1170)
	Call jump(210 + 660, 1170)
//	Call jump(420, 1170)
	
	//當前台階41
	Call jump(240, 1170)
	Call jump(210, 1170)
	Call jump(150 + 570, 1170)
//	Call jump(390, 1170)
	Call jump(180, 1170)
	
	//當前台階46
	Call jump(120, 1170)
	Call jump(210 + 630, 1170)
//	Call jump(450, 1170)
	Call jump(150 + 600, 1170)
//	Call jump(360, 1170)
	
	//當前台階51
	Call jump(390 + 330, 1170)
//	Call jump(150, 1170)
	Call jump(150, 1170)
	Call jump(180, 1170)
	Call jump(540 + 330, 1170)
	
	//當前台階56
//	Call jump(150, 1170)
	Call jump(180, 1170)
	Call jump(330 + 510, 1170)
//	Call jump(270, 1170)
	Call jump(150, 1170)
	
	//當前台階61
	Call jump(150 + 570, 1170)
//	Call jump(330, 1170)
	Call jump(240, 1170)
	Call jump(270 + 360, 1170)
//	Call jump(120, 1170)
	
	//當前台階66
	Call jump(120 + 510, 1170)
//	Call jump(210, 1170)
	Call jump(510 + 510, 1170)
//	Call jump(270, 1170)
	Call jump(300 + 600, 1170)
	
	//當前台階71
//	Call jump(360, 1170)
	Call jump(480, 1170)
Next

//跳躍
Sub jump(intX, intY)
	//按下
	LeftDown 1
	Delay intX
	//彈起
	LeftUp 1
	Delay intY
End Sub
