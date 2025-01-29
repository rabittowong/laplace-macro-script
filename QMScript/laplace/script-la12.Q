[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=c0ce5948-b971-44d0-aaae-74b9571f803d
Description=¦Û°Ê©@°ØÆU
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
­·¤§°ê«× ¦Û°Ê©@°ØÆUµ{§Ç

ª©¥»: 1.0
§@ªÌ: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
Do While 1
	//µ¥«Ý«öÁä
	keyS = WaitKey
	//ªÅ®æÁä
	Select Case keyS
		Case 32
			//Á¡»æ1
			Call instant_click(418, 455)
			Call instant_click(418, 455)
			//Á¡»æ2
			Call instant_click(396, 532)
			//Á¡»æ3
			Call instant_click(557, 451)
			//Á¡»æ4
			Call instant_click(553, 534)
			//©@°Ø1
			Call instant_click(232, 518)
			//©@°Ø2
			Call instant_click(260, 459)
			//©@°Ø3
			Call instant_click(285, 398)
			//¦×®Û¨÷1
			Call instant_click(1000, 394)
			//¦×®Û¨÷2
			Call instant_click(1083, 410)
			//¦×®Û¨÷3
			Call instant_click(1030, 440)
			//¯NÄl1
			Call instant_click(727, 456)
			//¯NÄl2
			Call instant_click(744, 515)
			//¯NÄl3
			Call instant_click(835, 455)
			//¯NÄl4
			Call instant_click(858, 515)
			//ÄÑ½k1
			Call instant_click(824, 629)
			//ÄÑ½k2
			Call instant_click(824, 629)
			//ÄÑ½k3
			Call instant_click(824, 629)
			//ÄÑ½k4
			Call instant_click(824, 629)
		Case 82
			//°h¥X
			Call Lib.Util.click(1225, 53)
			//½T©w
			Call Lib.Util.click(749, 500)
			//¶}©l¸gÀç
			Call Lib.Util.click(964, 638)
			//½T©w
			Call Lib.Util.click(749, 500)
		Case 97
			//¯ó²ùÂæ
			Call instant_click(311, 630)
		Case 98
			//¯ó²ùÂæ
			Call instant_click(311, 630)
			Call instant_click(311, 630)
			//°íªG
			Call instant_click(422, 624)
		Case 100
			//ÂÅ²ùÂæ
			Call instant_click(532, 624)
		Case 101
			//ÂÅ²ùÂæ
			Call instant_click(532, 624)
			Call instant_click(532, 624)
			//ÂÅ²ù
			Call instant_click(644, 625)
	End Select
Loop

//¥ªÁäÂIÀ»(µLµ¥«Ý®É¶¡)
Sub instant_click(intX, intY)
	MoveTo intX + ancX, intY + ancY
	LeftClick 1
End Sub
