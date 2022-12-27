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
Description=¦Û°Ê©@°Ø
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
­·¤§°ê«× ¦Û°Ê©@°Øµ{§Ç

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
			Call Lib.Util.click_instant(418, 455)
			Call Lib.Util.click_instant(418, 455)
			//Á¡»æ2
			Call Lib.Util.click_instant(396, 532)
			//Á¡»æ3
			Call Lib.Util.click_instant(557, 451)
			//Á¡»æ4
			Call Lib.Util.click_instant(553, 534)
			//©@°Ø1
			Call Lib.Util.click_instant(232, 518)
			//©@°Ø2
			Call Lib.Util.click_instant(260, 459)
			//©@°Ø3
			Call Lib.Util.click_instant(285, 398)
			//¦×®Û¨÷1
			Call Lib.Util.click_instant(1000, 394)
			//¦×®Û¨÷2
			Call Lib.Util.click_instant(1083, 410)
			//¦×®Û¨÷3
			Call Lib.Util.click_instant(1030, 440)
			//¯NÄl1
			Call Lib.Util.click_instant(727, 456)
			//¯NÄl2
			Call Lib.Util.click_instant(744, 515)
			//¯NÄl3
			Call Lib.Util.click_instant(835, 455)
			//¯NÄl4
			Call Lib.Util.click_instant(858, 515)
			//ÄÑ½k1
			Call Lib.Util.click_instant(824, 629)
			//ÄÑ½k2
			Call Lib.Util.click_instant(824, 629)
			//ÄÑ½k3
			Call Lib.Util.click_instant(824, 629)
			//ÄÑ½k4
			Call Lib.Util.click_instant(824, 629)
		Case 97
			//¯ó²ùÂæ
			Call Lib.Util.click_instant(311, 630)
		Case 98
			//¯ó²ùÂæ
			Call Lib.Util.click_instant(311, 630)
			Call Lib.Util.click_instant(311, 630)
			//°íªG
			Call Lib.Util.click_instant(422, 624)
		Case 100
			//ÂÅ²ùÂæ
			Call Lib.Util.click_instant(532, 624)
		Case 101
			//ÂÅ²ùÂæ
			Call Lib.Util.click_instant(532, 624)
			Call Lib.Util.click_instant(532, 624)
			//ÂÅ²ù
			Call Lib.Util.click_instant(644, 625)
	End Select
Loop
