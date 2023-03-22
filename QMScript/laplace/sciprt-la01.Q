[General]
SyntaxVersion=2
BeginHotkey=97
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=ac88e6f0-2767-4061-8bed-5728fc2247cc
Description=自動一條
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
風之國度 自動一條程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
For 1
//	Call init_time(5, 20)
	Call init_position
	
	Call Lib.LineBot.send_message_start()
	
	Call character_move_to("dungeon")
	Call raid_dungeon("100", 3, "")
	Call raid_dungeon("952", 3, "")
	Call raid_dungeon("902", 3, "")
//	Call raid_dungeon("802", 3, "")
//	Call raid_dungeon("702", 3, "")
//	Call raid_dungeon("602", 3, "")
	Call raid_dungeon("502", 3, "")
	Call raid_dungeon("402", 3, "")
	Call raid_dungeon("302", 3, "")
	Call raid_dungeon("202", 3, "")
	Call raid_dungeon("102", 3, "")
	
	Call character_move_to("card")
	Call raid_card("104", 3, "")
	
	Call character_move_to("dragon")
	Call raid_dragon("101", 2, "")
	
	Call character_move_to("escort")
	Call raid_escort("101", 5, "")
//	Call raid_escort("102", 5, "aid")
	
	Call Lib.LineBot.send_message_end()
Next

Sub init_time(set_hour, set_minute)
	//等待至指定時間
	Do Until hour(time) * 100 + minute(time) >= set_hour * 100 + set_minute
		Delay 1000 * 30
	Loop
	//清除視窗
	Do Until Lib.Util.color_match(665, 599, "B0E0F2")
		//領地委託
		If Lib.Util.color_match(638, 236, "1045BD") Then 
			Call Lib.Util.click(638, 236)
		End If
		//王國事件
		If Lib.Util.color_match(1193, 454, "D2E9F6") Then 
			Call Lib.Util.click(1193, 454)
		End If
		//王國獎勵
		If Lib.Util.color_match(633, 578, "0297F4") Then 
			Call Lib.Util.click(633, 578)
		End If
		//王國感謝函
		If Lib.Util.color_match(933, 141, "AED0EC") Then 
			Call Lib.Util.click(933, 141)
		End If
		Delay 1000 * 0.3
	Loop
End Sub

Sub init_position
	//開啟地圖
	Call open_map()
	//離開家園
	Call wait_click(270, 309, "EAD64F")
	//離開傳送門
	Call click_until(636, 415, "A5C8DC")
	//確定
	Call wait_click(749, 498, "059AF4")
	//加載
	Call wait_until(305, 661, "01BE71")
	//加載完畢
	Call wait_until(665, 599, "B0E0F2")
End Sub

Sub open_map()
	//開啟地圖
	Call Lib.Util.click(1200, 116)
	Call wait_until_or(344, 109, "D7FFFF", "D7FEFF")
End Sub

Sub character_move_to(strId)
	//開啟地圖
	Call open_map()
	//選擇目的地
	Select Case strId
		//裝備秘境
		Case "dungeon"
			Call wait_click(271, 434, "1894D2")
			Call Lib.Util.wait_until_color_unchange(941, 701)
		//魂卡秘境
		Case "card"
			Call wait_click(271, 245, "2188DC")
			Call Lib.Util.wait_until_color_unchange(29, 417)
		//龍之秘寶
		Case "dragon"
			Call wait_click(271, 564, "A5519D")
			Call Lib.Util.wait_until_color_unchange(962, 238)
		//護送
		Case "escort"
			Call wait_click_or(271, 308, "D68D31", "D68D30")
			Call Lib.Util.wait_until_color_unchange(395, 293)
	End Select
End Sub

Sub raid_dungeon(strId, intT, strAid)
	For t = 1 To intT
		If t = 1 Or strId = "102" Or strId = "202" Or strId = "302" Or strId = "402" Or strId = "502" Then 
			//全員在線
			Call wait_until(213, 400, "F7FFFF")
			//副本傳送門
			Call click_until(681, 190, "9EB5D0")
			//選擇副本
			Call select_dungeon(strId)
			//惡夢(雪之章以上)
			Call Lib.Util.click_if(825, 402, "97B9D1")
			//惡夢(光之章以下)
			Call Lib.Util.click_if(981, 402, "97B9D1")
			//挑戰
			Call wait_click(986, 654, "0297F4")
			//難度較大
			Delay 1000 * 0.3
			Call Lib.Util.click_if(749, 499, "059AF4")
			//助戰
			If strAid = "aid" Then 
				Call wait_click(863, 207, "232B35")
			End If
			//強制進入
			Call wait_click(867, 581, "059AF4")
		End If
		//加載
		Call wait_until(305, 661, "01BE71")
		//加載完畢
		Call wait_until_or(665, 599, "B0E0F2", "FFFFFF")
		//自動戰鬥
		Call Lib.Util.click_if(665, 599, "B0E0F2")
		//加載
		Call wait_until(305, 661, "01BE71")
		//加載完畢
		Call wait_until_or(665, 599, "B0E0F2", "FFFFFF")
	Next
End Sub

Sub select_dungeon(strId)
	Select Case strId
		Case "100"
			Call Lib.Util.click(331, 633)
		Case "952"
			Call Lib.Util.click(331, 513)
		Case "902"
			Call Lib.Util.click(331, 393)
		Case "802"
			Call Lib.Util.click(331, 273)
		Case "702"
			Call Lib.Util.click(331, 153)
		Case "602"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 308)
		Case "502"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 188)
		Case "402"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 308)
		Case "302"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 188)
		Case "202"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 308)
		Case "102"
			Call Lib.Util.click(331, 153)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 188)
			Call Lib.Util.click(331, 188)
	End Select
End Sub

Sub raid_card(strId, intT, strAid)
	//全員在線
	Call wait_until(213, 400, "F7FFFF")
	//副本傳送門
	Call click_until(564, 357, "75B0E3")
	//選擇副本
	Call select_card(strId)
	//多人挑戰
	Call wait_click(692, 659, "0297F4")
	//助戰
	If strAid = "aid" Then 
		Call wait_click(863, 207, "232B35")
	End If
	//強制進入
	Call wait_click(867, 581, "059AF4")
	For t = 1 To intT
		//加載
		Call wait_until(305, 661, "01BE71")
		//自動戰鬥
		Call wait_click(665, 599, "B0E0F2")
		//加載
		Call wait_until(305, 661, "01BE71")
		//加載完畢
		If t = intT Then 
			Call wait_until(564, 357, "75B0E3")
		Else 
			Call wait_until(863, 207, "232B35")
		End If
	Next
	//關閉副本傳送門
	Call wait_click(1240, 50, "B5E1FD")
End Sub

Sub select_card(strId)
	Select Case strId
		Case "106"
			Call Lib.Util.click(450, 584)
		Case "105"
			Call Lib.Util.click(450, 463)
		Case "104"
			Call Lib.Util.click(310, 463)
		Case "103"
			Call Lib.Util.click(310, 584)
		Case "102"
			Call Lib.Util.click(170, 584)
		Case "101"
			Call Lib.Util.click(170, 463)
	End Select
End Sub

Sub raid_dragon(strId, intT, strAid)
	//全員在線
	Call wait_until(213, 400, "F7FFFF")
	For t = 1 To intT
		//副本傳送門
		Call click_until(720, 312, "8F562C")
		//挑戰
		Call wait_click(820, 626, "059AF4")
		//助戰
		If strAid = "aid" Then 
			Call wait_click(863, 207, "232B35")
		End If
		//強制進入
		If t = 2 Then 
			Call wait_click(867, 581, "059AF4")
		End If
		//加載
		Call wait_until(305, 661, "01BE71")
		//加載完畢
		Call wait_until_or(665, 599, "B0E0F2", "FFFFFF")
		//自動戰鬥
		Call Lib.Util.click_if(665, 599, "B0E0F2")
		//加載
		Call wait_until(305, 661, "01BE71")
		//加載完畢
		Call wait_until_or(665, 599, "B0E0F2", "FFFFFF")
	Next
End Sub

Sub raid_escort(strId, intT, strAid)
	//副本傳送門
	Call click_until(581, 269, "D6E7EF")
	//接受任務
	Call wait_click(905, 640, "E49D70")
	For intT
		//完成
		Call wait_until(437, 310, "167AF2")
		//完成完畢
		Call wait_until(665, 599, "B0E0F2")
		If strAid = "aid" Then
			//開啟地圖
			Call open_map()
			//查看地圖
			Select Case Lib.Util.color_at(649, 413)
				//神木
				Case "BDEFF9"
					//副本傳送門
					Call click_until(577, 287, "CDDDE6")
					//接受任務
					Call wait_click(905, 641, "E19D6E")
				//銀雪
				Case "D6E396"
					//副本傳送門
					Call click_until(618, 274, "D5E5EE")
					//接受任務
					Call wait_click(905, 641, "E19D6E")
				//百花
				Case "D8CFE8"
					//副本傳送門
					Call click_until(698, 372, "C8DEDA")
					//接受任務
					Call wait_click(905, 641, "E19D6E")
				//日陽
				Case "7BBAFF"
					//副本傳送門
					
					//接受任務
					Call wait_click(905, 641, "E19D6E")
			End Select
			//關閉副本傳送門
			Call Lib.Util.click_if(1240, 50, "B5DFF6")
		End If
	Next
End Sub

//左鍵點擊至顏色相同
Sub click_until(intX, intY, strC)
	intL = 0
	Do Until Lib.Util.color_match(intX, intY, strC)
		Call Lib.Util.click(intX, intY)
		intL = intL + 1
		If intL > 100 Then 
			Call Lib.LineBot.send_message_help()
			EndScript
		End If
	Loop
End Sub

//等待至顏色相同
Sub wait_until(intX, intY, strC)
	intL = 0
	Do Until Lib.Util.color_match(intX, intY, strC)
		Delay 1000 * 0.3
		intL = intL + 1
		If intL > 100 Then 
			Call Lib.LineBot.send_message_help()
			EndScript
		End If
	Loop
End Sub

//等待至顏色相同(2種顏色)
Sub wait_until_or(intX, intY, strC1, strC2)
	intL = 0
	Do Until Lib.Util.color_match(intX, intY, strC1) Or Lib.Util.color_match(intX, intY, strC2)
		Delay 1000 * 0.3
		intL = intL + 1
		If intL > 100 Then 
			Call Lib.LineBot.send_message_help()
			EndScript
		End If
	Loop
End Sub

//等待至顏色相同時左鍵點擊
Sub wait_click(intX, intY, strC)
	Call wait_until(intX, intY, strC)
	Call Lib.Util.click(intX, intY)
End Sub

//等待至顏色相同時左鍵點擊(2種顏色)
Sub wait_click_or(intX, intY, strC1, strC2)
	Call wait_until_or(intX, intY, strC1, strC2)
	Call Lib.Util.click(intX, intY)
End Sub
