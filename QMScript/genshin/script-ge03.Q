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
MacroID=175edbd0-7076-4b2b-9530-0788eb3ada80
Description=自動演奏
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
原神 自動演奏程序

版本: 1.0
作者: Rabitto
================================
*/

For 1
//	Call dream_wedding
	Call aquarius
Next

Sub press(k1, c1, dur)
	If Not(k1 = "0") Then 
		KeyDown parse_key(k1, c1), 1
		KeyUp parse_key(k1, c1), 1
	End If
	Delay 60 / npm * 1000 * dur
End Sub

Sub press_double(k1, c1, k2, c2, dur)
	If Not(k1 = "0") And Not(k2 = "0") Then 
		KeyDown parse_key(k1, c1), 1
		KeyDown parse_key(k2, c2), 1
		KeyUp parse_key(k1, c1), 1
		KeyUp parse_key(k2, c2), 1
	End If
	Delay 60 / npm * 1000 * dur
End Sub

Function parse_key(k1, c1)
	Select Case c1
		Case "+"
			Select Case k1
				Case "1"
					parse_key = "Q"
				Case "2"
					parse_key = "W"
				Case "3"
					parse_key = "E"
				Case "4"
					parse_key = "R"
				Case "5"
					parse_key = "T"
				Case "6"
					parse_key = "Y"
				Case "7"
					parse_key = "U"
			End Select
		Case ""
			Select Case k1
				Case "1"
					parse_key = "A"
				Case "2"
					parse_key = "S"
				Case "3"
					parse_key = "D"
				Case "4"
					parse_key = "F"
				Case "5"
					parse_key = "G"
				Case "6"
					parse_key = "H"
				Case "7"
					parse_key = "J"
			End Select
		Case "-"
			Select Case k1
				Case "1"
					parse_key = "Z"
				Case "2"
					parse_key = "X"
				Case "3"
					parse_key = "C"
				Case "4"
					parse_key = "V"
				Case "5"
					parse_key = "B"
				Case "6"
					parse_key = "N"
				Case "7"
					parse_key = "M"
			End Select
	End Select
End Function

Sub dream_wedding
	//夢中的婚禮
	npm = 56
	
	Call press("0", "", 0.75)
	Call press("6", "", 0.25)
	
	Call press("6", "", 0.25)
	Call press("7", "", 0.25)
	Call press("7", "", 0.25)
	Call press("1", "+", 0.25)
	Call press("1", "+", 0.25)
	Call press("7", "", 0.25)
	Call press("7", "", 0.25)
	Call press("6", "", 0.25)
	Call press("6", "", 0.25)
	Call press("3", "", 0.25)
	Call press("3", "", 0.25)
	Call press("1", "", 0.25)
	Call press("1", "", 0.25)
	Call press("6", "-", 0.25)
	Call press("6", "-", 0.25)
	Call press("5", "", 0.25)
	
	Call press("5", "", 0.25)
	Call press("4", "", 0.25)
	Call press("4", "", 0.25)
	Call press("3", "", 0.25)
	Call press("4", "", 0.25)
	Call press("5", "", 0.25)
	Call press("4", "", 1.25)
	
	Call press("0", "", 0.25)
	Call press("4", "", 0.25)
	Call press("4", "", 0.25)
	Call press("5", "", 0.25)
	Call press("5", "", 0.25)
	Call press("6", "", 0.25)
	Call press("6", "", 0.25)
	Call press("7", "", 0.25)
	Call press("7", "", 0.25)
	Call press("5", "", 0.25)
	Call press("5", "", 0.25)
	Call press("2", "", 0.25)
	Call press("2", "", 0.25)
	Call press("4", "", 0.25)
	
	Call press("4", "", 0.25)
	Call press("3", "", 0.25)
	Call press("3", "", 0.25)
	Call press("2", "", 0.25)
	Call press("3", "", 0.25)
	Call press("4", "", 0.25)
	
	Call press("3", "", 1)
	Call press_double("3", "", "3", "+", 1.5)
	
	Call press("3", "", 0.5)
	Call press("6", "-", 0.25)
	Call press("1", "", 0.25)
	Call press("3", "", 0.25)
	Call press("2", "", 0.25)
	Call press("3", "", 0.5)
	Call press("6", "-", 0.25)
	Call press("1", "", 0.25)
	Call press("3", "", 0.25)
	Call press("2", "", 0.25)
	Call press("3", "", 0.5)
	Call press("6", "-", 0.25)
	Call press("1", "", 0.25)
	Call press("4", "", 0.25)
	Call press("3", "", 0.25)
	
	Call press("4", "", 0.5)
	Call press("6", "-", 0.25)
	Call press("1", "", 0.25)
	Call press("4", "", 0.25)
	Call press("3", "", 0.25)
	Call press("4", "", 0.5)
	Call press("4", "", 0.25)
	Call press("3", "", 0.25)
	Call press("4", "", 0.25)
	Call press("4", "", 0.25)
	
	Call press("5", "", 0.5)
	Call press("5", "", 0.25)
	Call press("6", "", 0.25)
	Call press("5", "", 0.25)
	Call press("6", "", 0.25)
	Call press("3", "", 1.5)
	
	Call press("3", "+", 0.5)
	Call press("6", "", 0.25)
	Call press("1", "+", 0.25)
	Call press("3", "+", 0.25)
	Call press("2", "+", 0.25)
	Call press("3", "+", 0.5)
	Call press("6", "", 0.25)
	Call press("1", "+", 0.25)
	Call press("3", "+", 0.25)
	Call press("2", "+", 0.25)
	Call press("3", "+", 0.5)
	Call press("6", "", 0.25)
	Call press("1", "+", 0.25)
	Call press("4", "+", 0.25)
	Call press("3", "+", 0.25)
	
	Call press("4", "+", 0.5)
	Call press("6", "", 0.25)
	Call press("1", "+", 0.25)
	Call press("4", "+", 0.25)
	Call press("3", "+", 0.25)
	Call press("4", "+", 0.5)
	Call press("4", "+", 0.25)
	Call press("3", "+", 0.25)
	Call press("4", "+", 0.25)
	Call press("4", "+", 0.25)
	
	Call press("5", "+", 0.5)
	Call press("5", "+", 0.25)
	Call press("6", "+", 0.25)
	Call press("5", "+", 0.25)
	Call press("6", "+", 0.25)
	Call press("3", "+", 1.5)
	
	Call press("1", "+", 0.75)
	Call press("3", "", 0.25)
	Call press("3", "", 0.25)
	Call press("4", "", 0.25)
	Call press("4", "", 0.5)
	Call press("2", "", 0.25)
	Call press("2", "", 0.25)
	Call press("7", "", 0.25)
	Call press("6", "", 0.25)
	
	Call press("7", "", 0.75)
	Call press("2", "", 0.25)
	Call press("2", "", 0.25)
	Call press("3", "", 0.25)
	Call press("3", "", 0.5)
	Call press("1", "", 0.25)
	Call press("1", "", 0.25)
	Call press("6", "", 0.25)
	Call press("5", "", 0.25)
	
	Call press("6", "", 0.75)
	Call press("1", "", 0.25)
	Call press("1", "", 0.25)
	Call press("2", "", 0.25)
	Call press("2", "", 0.5)
	Call press("7", "-", 0.25)
	Call press("7", "-", 0.25)
	Call press("3", "", 0.25)
	Call press("2", "", 0.25)
	Call press("3", "", 1.5)
	
	Call press("1", "+", 0.5)
	Call press("1", "+", 0.25)
	Call press("1", "+", 0.25)
	Call press("1", "+", 0.25)
	Call press("2", "+", 0.25)
	Call press("2", "+", 0.75)
	Call press("1", "+", 0.25)
	Call press("7", "", 0.25)
	Call press("6", "", 0.25)
	
	Call press("5", "", 0.75)
	Call press("5", "", 0.25)
	Call press("6", "", 0.25)
	Call press("5", "", 0.25)
	Call press("3", "", 1.5)
	
	Call press("1", "+", 0.5)
	Call press("1", "+", 0.25)
	Call press("1", "+", 0.25)
	Call press("1", "+", 0.25)
	Call press("2", "+", 0.25)
	Call press("2", "+", 0.75)
	Call press("1", "+", 0.25)
	Call press("7", "", 0.25)
	Call press("6", "", 0.25)
	
	Call press("5", "", 0.75)
	Call press("5", "", 0.25)
	Call press("6", "", 0.25)
	Call press("5", "", 0.25)
	Call press("6", "", 1.5)
	
	Call press_double("1", "", "1", "+", 0.5)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("2", "", "2", "+", 0.25)
	Call press_double("2", "", "2", "+", 0.75)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("7", "-", "7", "", 0.25)
	Call press_double("6", "-", "6", "", 0.25)
	
	Call press_double("5", "-", "5", "", 0.75)
	Call press_double("5", "-", "5", "", 0.25)
	Call press_double("6", "-", "6", "", 0.25)
	Call press_double("5", "-", "5", "", 0.25)
	Call press_double("3", "-", "3", "", 1.5)
	
	Call press_double("1", "", "1", "+", 0.5)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("2", "", "2", "+", 0.25)
	Call press_double("2", "", "2", "+", 0.75)
	Call press_double("1", "", "1", "+", 0.25)
	Call press_double("7", "-", "7", "", 0.25)
	Call press_double("6", "-", "6", "", 0.25)
	
	Call press_double("5", "-", "5", "", 0.75)
	Call press_double("5", "-", "5", "", 0.25)
	Call press_double("6", "-", "6", "", 0.25)
	Call press_double("5", "-", "5", "", 0.25)
	Call press_double("6", "-", "6", "", 3)
End Sub

Sub aquarius
	//可惜我是水瓶座
	npm = 100
	
	Call press("5", "-", 0.5)
	Call press("5", "-", 0.5)
	Call press("1", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 1)
	Call press("7", "-", 0.5)
	Call press("1", "", 0.5)
	Call press("2", "", 1)
	Call press("6", "-", 0.5)
	Call press("7", "-", 0.5)
	Call press("1", "", 2)
	
	Call press("1", "", 0.5)
	Call press("1", "", 0.5)
	Call press("4", "", 0.5)
	Call press("5", "", 0.5)
	Call press("6", "", 1)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("5", "", 1)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("3", "", 0.5)
	Call press("2", "", 1.5)
	
	Call press("5", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 1)
	Call press("5", "", 1)
	Call press("1", "", 1)
	
	Call press("1", "", 0.5)
	Call press("7", "-", 0.5)
	Call press("6", "-", 0.5)
	Call press("3", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("2", "", 1)
	
	Call press("5", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("5", "", 0.5)
	Call press("1", "", 1)
	
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("5", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 0.5)
	Call press("5", "", 2)
	
	Call press("5", "", 1.5)
	Call press("3", "", 0.5)
	Call press("2", "", 1)
	Call press("4", "", 1)
	Call press("1", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("1", "", 0.5)
	Call press("7", "-", 1)
	Call press("3", "", 1)
	
	Call press("6", "-", 0.5)
	Call press("7", "-", 0.5)
	Call press("1", "", 0.5)
	Call press("6", "", 0.5)
	Call press("5", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("4", "", 1)
	Call press("3", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 1)
	
	Call press("3", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("3", "", 0.25)
	Call press("3", "", 0.25)
	Call press("3", "", 0.5)
	Call press("5", "", 0.5)
	Call press("4", "", 1)
	
	Call press("3", "", 0.5)
	Call press("2", "", 0.5)
	Call press("2", "", 0.5)
	Call press("2", "", 0.25)
	Call press("2", "", 0.25)
	Call press("2", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 1)
	
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("6", "", 0.5)
	Call press("6", "", 0.5)
	Call press("5", "", 0.5)
	Call press("5", "", 3)
	
	Call press("5", "", 1.5)
	Call press("3", "", 0.5)
	Call press("2", "", 1)
	Call press("4", "", 1)
	Call press("1", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("1", "", 0.5)
	Call press("7", "-", 1)
	Call press("3", "", 1)
	
	Call press("6", "-", 0.5)
	Call press("7", "-", 0.5)
	Call press("1", "", 0.5)
	Call press("6", "", 0.5)
	Call press("5", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("4", "", 0.5)
	Call press("4", "", 1)
	Call press("4", "", 0.5)
	Call press("5", "", 0.5)
	Call press("3", "", 1)
	
	Call press("3", "", 0.5)
	Call press("2", "", 0.5)
	Call press("3", "", 0.5)
	Call press("3", "", 0.25)
	Call press("3", "", 0.25)
	Call press("3", "", 0.5)
	Call press("5", "", 0.5)
	Call press("4", "", 1)
	
	Call press("2", "", 0.5)
	Call press("1", "", 0.5)
	Call press("2", "", 0.5)
	Call press("2", "", 0.25)
	Call press("2", "", 0.25)
	Call press("2", "", 0.5)
	Call press("4", "", 0.5)
	Call press("3", "", 1)
	
	Call press("1", "", 0.5)
	Call press("7", "-", 0.5)
	Call press("6", "-", 1)
	Call press("1", "", 0.5)
	Call press("3", "", 0.5)
	Call press("2", "", 0.5)
	Call press("1", "", 0.5)
	Call press("7", "-", 0.5)
	Call press("2", "", 0.5)
	Call press("2", "", 0.5)
	Call press("1", "", 0.5)
	Call press("1", "", 2)
End Sub
