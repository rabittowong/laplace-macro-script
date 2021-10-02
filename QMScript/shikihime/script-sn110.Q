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
MacroID=1d2be2e3-5e6d-4027-b1e1-5fdaddb1f40b
Description=開葛籠
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
//獲得遊戲視窗左上角的座標
snWide = Plugin.Sys.GetScRX()
snHeight = Plugin.Sys.GetScRY()
FindColor 0, 0, snWide, snHeight, "3E7258", corX, corY
If corX < 0 And corY < 0 Then
	MsgBox "Error: 程序初始化失敗"
	EndScript
End If
Delay 300

Do
	MoveTo 103 + corX, 525 + corY
	LeftDown 1
	Delay 200
	MoveTo 131 + corX, 472 + corY
	Delay 200
	MoveTo 159 + corX, 418 + corY
	LeftUp 1
	Delay 1200
	MoveTo 159 + corX, 418 + corY
	LeftClick 1
	Delay 3800
Loop
