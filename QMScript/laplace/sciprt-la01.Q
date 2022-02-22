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
//	Call setup_time(12, 35)
	Call setup_position
	
	Call travel("dungeon")
	Call raid_dungeon("100", 5, "")
	Call raid_dungeon("952", 3, "")
	Call raid_dungeon("902", 3, "")
	Call raid_dungeon("802", 3, "")
	Call raid_dungeon("702", 3, "")
	Call raid_dungeon("602", 3, "")
	Call raid_dungeon("502", 3, "")
	Call raid_dungeon("402", 3, "")
	Call raid_dungeon("302", 3, "")
	Call raid_dungeon("202", 3, "")
	Call raid_dungeon("102", 3, "")
	
	Call travel("card")
	Call raid_card("104", 3, "")
	
	Call travel("dragon")
	Call raid_dragon("101", 2, "")
	
	Call travel("escort")
	Call raid_escort("101", 5, "")
//	Call raid_escort("102", 5, "aid")
Next

Sub setup_time(set_hour, set_minute)
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

Sub setup_position
	//如果不是家園
	If Not(Lib.Util.color_match(1160, 319, "144A9B")) Then 
		//選項
		Call Lib.Util.wait_click(1246, 232, "80D1FF")
	End If
	//家園
	Call Lib.Util.wait_click(1160, 319, "144A9B")
	//加載
	Call Lib.Util.wait_until(305, 661, "01BE71")
	//加載完畢
	Call Lib.Util.wait_until(557, 603, "A5D0E7")
	//開啟地圖
	Call Lib.Util.click(1200, 116)
	Call Lib.Util.wait_until_or(344, 109, "D7FFFF", "D7FEFF")
	//離開家園
	Call Lib.Util.wait_click(270, 309, "EAD64F")
	//離開傳送門
	Call Lib.Util.click_until(636, 415, "A5C8DC")
	//確定
	Call Lib.Util.wait_click(749, 498, "059AF4")
	//加載
	Call Lib.Util.wait_until(305, 661, "01BE71")
	//加載完畢
	Call Lib.Util.wait_until(665, 599, "B0E0F2")
End Sub

Sub travel(strId)
	//開啟地圖
	Call Lib.Util.click(1200, 116)
	Call Lib.Util.wait_until_or(344, 109, "D7FFFF", "D7FEFF")
	//如果是拉普拉斯城
	If Lib.Util.color_match(271, 245, "2188DC") Then 
		//選擇目的地
		Call select_raid(strId, "")
	Else 
		//世界地圖
		Call Lib.Util.wait_click(344, 109, "D7FFFF")
		//拉普拉斯城
		Call Lib.Util.wait_click(495, 221, "A1BAC4")
		//選擇目的地
		Call select_raid(strId, "map")
	End If
	
	//開啟地圖
	Call Lib.Util.click(1200, 116)
	Call Lib.Util.wait_until_or(344, 109, "D7FFFF", "D7FEFF")
	//選擇目的地
	Call select_raid(strId, "")
End Sub

Sub select_raid(strId, strMap)
	Select Case strId
		//裝備秘境
		Case "dungeon"
			Call Lib.Util.wait_click(271, 434, "1894D2")
			If strMap = "map" Then 
				//加載
				Call Lib.Util.wait_until(305, 661, "01BE71")
				//加載完畢
				Call Lib.Util.wait_until(665, 599, "B0E0F2")
			End If
			Call Lib.Util.wait_static(941, 701)
		//魂卡秘境
		Case "card"
			Call Lib.Util.wait_click(271, 245, "2188DC")
			If strMap = "map" Then 
				//加載
				Call Lib.Util.wait_until(305, 661, "01BE71")
				//加載完畢
				Call Lib.Util.wait_until(665, 599, "B0E0F2")
			End If
			Call Lib.Util.wait_static(29, 417)
		//龍之秘寶
		Case "dragon"
			Call Lib.Util.wait_click(271, 564, "A5519D")
			If strMap = "map" Then 
				//加載
				Call Lib.Util.wait_until(305, 661, "01BE71")
				//加載完畢
				Call Lib.Util.wait_until(665, 599, "B0E0F2")
			End If
			Call Lib.Util.wait_static(962, 238)
		//護送
		Case "escort"
			Call Lib.Util.wait_click_or(271, 308, "D68D31", "D68D30")
			If strMap = "map" Then 
				//加載
				Call Lib.Util.wait_until(305, 661, "01BE71")
				//加載完畢
				Call Lib.Util.wait_until(665, 599, "B0E0F2")
			End If
			Call Lib.Util.wait_static(395, 293)
	End Select
End Sub

Sub raid_dungeon(strId, intT, strAid)
	For intT
		//全員在線
		Call Lib.Util.wait_until(213, 400, "F7FFFF")
		//副本傳送門
		Call Lib.Util.click_until(681, 190, "9EB5D0")
		//選擇副本
		Call select_dungeon(strId)
		//惡夢(雪之章以上)
		Call Lib.Util.click_if(825, 402, "97B9D1")
		//惡夢(光之章以下)
		Call Lib.Util.click_if(981, 402, "97B9D1")
		//挑戰
		Call Lib.Util.wait_click(986, 654, "0297F4")
		//助戰
		If strAid = "aid" Then 
			Call Lib.Util.wait_click(856, 230, "232B35")
		End If
		//強制進入
		Call Lib.Util.wait_click(867, 581, "059AF4")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//自動戰鬥
		Call Lib.Util.wait_click(665, 599, "B0E0F2")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//加載完畢
		Call Lib.Util.wait_until(665, 599, "B0E0F2")
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
	Call Lib.Util.wait_until(213, 400, "F7FFFF")
	//副本傳送門
	Call Lib.Util.click_until(564, 357, "75B0E3")
	For intT
		//選擇副本
		Call select_card(strId)
		//多人挑戰
		Call Lib.Util.wait_click(692, 659, "0297F4")
		//助戰
		If strAid = "aid" Then 
			Call Lib.Util.wait_click(856, 230, "232B35")
		End If
		//強制進入
		Call Lib.Util.wait_click(867, 581, "059AF4")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//自動戰鬥
		Call Lib.Util.wait_click(665, 599, "B0E0F2")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//加載完畢
		Call Lib.Util.wait_until(564, 357, "75B0E3")
	Next
	//關閉副本傳送門
	Call Lib.Util.wait_click(1240, 50, "B5E1FD")
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
	Call Lib.Util.wait_until(213, 400, "F7FFFF")
	For intT
		//副本傳送門
		Call Lib.Util.click_until(670, 312, "382817")
		//挑戰
		Call Lib.Util.wait_click(820, 626, "059AF4")
		//助戰
		If strAid = "aid" Then 
			Call Lib.Util.wait_click(856, 230, "232B35")
		End If
		//強制進入
		Call Lib.Util.wait_click(867, 581, "059AF4")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//自動戰鬥
		Call Lib.Util.wait_click(665, 599, "B0E0F2")
		//加載
		Call Lib.Util.wait_until(305, 661, "01BE71")
		//加載完畢
		Call Lib.Util.wait_until(665, 599, "B0E0F2")
	Next
End Sub

Sub raid_escort(strId, intT, strAid)
	//副本傳送門
	Call Lib.Util.click_until(581, 269, "D6E7EF")
	//接受任務
	Call Lib.Util.wait_click(905, 640, "E39D6F")
	For intT
		//完成
		Call Lib.Util.wait_until(437, 310, "167AF2")
		//完成完畢
		Call Lib.Util.wait_until(665, 599, "B0E0F2")
		If strAid = "aid" Then
			//開啟地圖
			Call Lib.Util.click(1200, 116)
			Call Lib.Util.wait_until_or(344, 109, "D7FFFF", "D7FEFF")
			//查看地圖
			Select Case Lib.Util.color_at(649, 413)
				//神木
				Case "BDEFF9"
					//副本傳送門
					Call Lib.Util.click_until(577, 287, "CDDDE6")
					//接受任務
					Call Lib.Util.wait_click(905, 641, "E19D6E")
				//銀雪
				Case "D6E396"
					//副本傳送門
					Call Lib.Util.click_until(618, 274, "D5E5EE")
					//接受任務
					Call Lib.Util.wait_click(905, 641, "E19D6E")
				//百花
				Case "D8CFE8"
					//副本傳送門
					Call Lib.Util.click_until(698, 372, "C8DEDA")
					//接受任務
					Call Lib.Util.wait_click(905, 641, "E19D6E")
				//日陽
				Case "7BBAFF"
					//副本傳送門
					
					//接受任務
					Call Lib.Util.wait_click(905, 641, "E19D6E")
			End Select
			//關閉副本傳送門
			Call Lib.Util.click_if(1240, 50, "B5DFF6")
		End If
	Next
End Sub
