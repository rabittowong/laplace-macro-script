[General]
SyntaxVersion=2
BeginHotkey=97
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=46dd8292-49d4-492d-8413-205ad678b981
Description=自動討伐
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
//程序設定
//地圖(可設定0-5內整數/0為黃泉)
map = 3

//討伐地
Sub set_dungeon
//	Call click_point(354, 261)	//大湖
//	Call click_point(691, 255)	//荒廢小鎮(山彥)
//	Call click_point(564, 146)	//通過山頂的石道(野鎚)
//	Call click_point(581, 74)	//山頂的切石場(夜行)
//	Call click_point(147, 250)	//有神木的森林(蛟)
//	Call click_point(339, 124)	//充滿妖氣的神社(禍斗)
//	Call click_point(74, 105)	//祭祀龍的神社(三眼僧)
//
//	Call click_point(518, 94)	//墓場之森(夜刀神)
//	Call click_point(497, 240)	//班目平原的縱穴
//	Call click_point(380, 496)	//腐蝕的銀礦
//	Call click_point(642, 278)	//響負盛名的堅城
//
//	Call click_point(173, 288)	//寂靜的廢村(貔貅)
	Call click_point(173, 413)	//黑煙瀰漫的神社
//	Call click_point(353, 233)	//封印火龍的神社(火食鳥)
//	Call click_point(488, 468)	//斧之城
//	Call click_point(468, 108)	//地獄的湯場(雷神)
//
//	Call click_point(148, 508)	//颳大風的山頂(風神)
//	Call click_point(608, 463)	//迷惑人的神社(化生之前)
//	Call click_point(691, 153)	//直衝雲霄的閣樓(望天吼)
//	Call click_point(608, 143)	//龍居住的街
//
//	Call click_point(268, 193)	//旋風的街道(麒麟)
//	Call click_point(308, 128)	//冰雪洶湧的神社
End Sub

//黃泉地圖(可設定1-20內整數)
acheron = 6

//地圖難度(可設定1-3內整數/1銅/2銀/3金)
diff = 3

//每討伐5次賣卡(可設定任何整數/0為不賣卡)
turn = 7

//當AP少於10%時使用行動藥(可設定0-0.6以內小數)
ap = 0.3

//經驗筆數量(可設定任何正整數/0為不刷筆)
expPen = 0

//活動物品換領(可設定1-11以內整數/0為不換領)
item = 0

/*=================================================
式姬之庭
自動討伐程序(ASP) v3.20

最後更新: 11/08/2016 05:00
測試瀏覽器: Firefox 47.0
=================================================*/

//主程序內容
Call initial
Call check_value
Do
	Rem eventStart
	
	//檢查卡數/文數/AP
	If color_match(295, 546, "0021FF") Then
		Call check_coin
		Call check_card(turn)
		Call check_ap(ap)
		Call barter_item(item)
		//討伐
		Call wait_click(295, 546, "0021FF")
	End If
	Delay 300
	
	//選擇地圖
	If color_match(593, 493, "424ED8") Then
		//選擇討伐地
		If map = 0 Then
			Call click_point(593, 493)
			Call set_acheron(acheron)
		Else
			Call click_point(216 + 36 * map, 533)
			Call set_dungeon
		End If
		//選擇難度
		Call click_point(650, 87 + 89 * diff)
		//檢查HP
		Call check_hp
		//前往討伐
		Call wait_click(509, 363, "3699F9")
		Delay 1500
		Call if_click(320, 327, "071572")
	End If
	Delay 300
	
	//戰鬥/返回/登入獎勵
	Call click_point(334, 296)
	Call if_click(544, 72, "6868FC")
	
	//獲取討伐獎勵
	If color_match(524, 468, "262C13") Then 
		Call check_pen(expPen)
		Call click_point(524, 468)
		If color_match(194, 107, "177CDA") Then
			//下一層
			Call click_point(194, 107)
		Else 
			currentTurn = currentTurn + 1
			refreshTime = 0
			//再挑戰
			If turn = 0 Then 
			ElseIf currentTurn >= turn Then
				//返回庭園賣卡
				Call wait_click(283, 256, "4EB4F5")
				Goto eventStart
			End If
			Call wait_click(469, 261, "1E96E4")
			Delay 1500
			If color_match(390, 342, "333333") Then
				If color_match(303, 255, "000000") Then
					MsgBox "Warning: 討伐地回數已達上限"
					EndScript
				End If
				//再挑戰所需AP不足
				Call click_point(390, 342)
				Call wait_click(283, 256, "4EB4F5")
			End If
		End If
	End If
	Delay 300
	
	//防卡檢查
	If stopTime > 180000 Then
		Call check_stop
	ElseIf refreshTime > 600000 Then
		Call game_refresh
	Else
		stopTime = stopTime + 1500
		refreshTime = refreshTime + 1500
	End If
	Delay 300
Loop
//主程序結束

//程序初始化
Sub initial
	//獲得遊戲視窗左上角的座標
	corX = 154
	corY = 148
	Delay 300
	/*
	snWide = Plugin.Sys.GetScRX()
	snHeight = Plugin.Sys.GetScRY()
	FindColor 0, 0, snWide, snHeight, "3E7258", corX, corY
	If corX < 0 And corY < 0 Then
		MsgBox "Error: 程序初始化失敗"
		EndScript
	End If
	Delay 300
	*/
End Sub

//定義滑鼠子程序
Sub click_point(intX, intY)
	//左鍵
	MoveTo intX + corX, intY + corY
	LeftClick 1
	Delay 300
End Sub

Sub move_point(intX, intY, tarX, tarY)
	//移動滑鼠
	MoveTo intX + corX, intY + corY
	LeftDown 1
	Delay 300
	MoveTo tarX + corX, tarY + corY
	LeftUp 1
	Delay 300
End Sub

Sub if_click(intX, intY, clrC)
	//顏色等於clrC時左鍵
	If color_match(intX, intY, clrC) Then
		Call click_point(intX, intY)
	End If
	Delay 300
End Sub

Sub wait_until(intX, intY, clrC)
	//等待至顏色等於clrC
	Do
		If color_match(intX, intY, clrC) Then
			Exit Do
		ElseIf stopTime > 180000 Then
			Call check_stop
		ElseIf refreshTime > 600000 Then
			Call game_refresh
		End If
		Delay 300
		stopTime = stopTime + 300
		refreshTime = refreshTime + 300
	Loop
	stopTime = 0
	Delay 300
End Sub

Sub wait_click(intX, intY, clrC)
	//等待至顏色等於clrC時左鍵
	Do
		If color_match(intX, intY, clrC) Then
			Call click_point(intX, intY)
			Exit Do
		ElseIf stopTime > 180000 Then
			Call check_stop
		ElseIf refreshTime > 600000 Then
			Call game_refresh
		End If
		Delay 300
		stopTime = stopTime + 300
		refreshTime = refreshTime + 300
	Loop
	stopTime = 0
	Delay 300
End Sub

Function color_match(intX, intY, clrC)
	IfColor intX + corX, intY + corY, clrC, 0 Then
		color_match = 1
	Else 
		color_match = 0
	End If
End Function

//定義事件子程序
Sub check_value
	//程序設定整數化
	map = int(map)
	acheron = int(acheron)
	diff = int(diff)
	turn = int(turn)
	expPen = int(expPen)
	item = int(item)
	
	//檢查程序設定
	If map < 0 Or map > 5 Then
		MsgBox "Error: 地圖數值設定錯誤"
		EndScript
	ElseIf acheron < 1 Or acheron > 20 Then
		MsgBox "Error: 黃泉地圖數值設定錯誤"
		EndScript
	ElseIf diff < 1 Or diff > 3 Then
		MsgBox "Error: 地圖難度數值設定錯誤"
		EndScript
	ElseIf turn < 0 Then
		MsgBox "Error: 賣卡數值設定錯誤"
		EndScript
	ElseIf ap < 0 Or ap > 0.6 Then
		MsgBox "Error: AP數值設定錯誤"
		EndScript
	ElseIf expPen < 0 Then
		MsgBox "Error: 經驗筆數值設定錯誤"
		EndScript
	ElseIf item < 0 Or item > 11 Then
		MsgBox "Error: 活動物品換領數值設定錯誤"
		EndScript
	End If
	Delay 300
End Sub

Sub set_acheron(intX)
	//選擇黃泉討伐地
	Select Case intX
	Case 1
		Call wait_click(54, 125, "B66B59")
	Case 2
		Call wait_click(150, 153, "B66B59")
	Case 3
		Call wait_click(227, 150, "B66B59")
	Case 4
		Call wait_click(318, 178, "B66B59")
	Case 5
		Call wait_click(393, 198, "B66B59")
	Case 6
		Call wait_click(474, 238, "B66B59")
	Case 7
		Call wait_click(408, 255, "B66B59")
	Case 8
		Call wait_click(328, 274, "B66B59")
	Case 9
		Call wait_click(254, 268, "B66B59")
	Case 10
		Call wait_click(158, 278, "B66B59")
	Case 11
		Call wait_click(76, 301, "B66B59")
	Case 12
		Call wait_click(74, 364, "B66B59")
	Case 13
		Call wait_click(155, 377, "B66B59")
	Case 14
		Call wait_click(243, 376, "B66B59")
	Case 15
		Call wait_click(318, 388, "B66B59")
	Case 16
		Call wait_click(388, 408, "B66B59")
	Case 17
		Call wait_click(458, 398, "B66B59")
	Case 18
		Call wait_click(538, 418, "B66B59")
	Case 19
		Call wait_click(608, 428, "B66B59")
	Case 20
		Call wait_click(708, 438, "B66B59")
	End Select
End Sub

Sub check_card(intX)
	If intX = 0 Then 
	ElseIf currentTurn >= intX Then
		If turn >= 50 Then 
			MsgBox "Warning: 指定場數討伐完畢"
			EndScript
		End If
		//札牌
		Call wait_click(28, 124, "A1A6AF")
		Call wait_until(52, 99, "FFFFFF")
		If color_match(131, 524, "566F68") Then
			//賣怪物卡
			Call click_point(131, 524)
			Call wait_click(320, 327, "071572")
			Call wait_click(389, 342, "343434")
		End If
		Call wait_click(544, 72, "6868FC")
		currentTurn = 0
		Goto eventStart
	End If
End Sub

Sub check_coin
	//文數多於100萬
	If color_match(65, 45, "000000") Then
		//雜貨屋
		Call wait_click(626, 527, "82D4F9")
		Call wait_until(126, 83, "E5E5E8")
		Call if_click(184, 128, "40491F")
		//買基本種符紙
		Call move_point(730, 187, 730, 434)
		Call wait_click(645, 303, "566F68")
		Call wait_until(189, 153, "FFFFFF")
		If color_match(333, 339, "E9F4F8") Then
			Call click_point(302, 343)
			Call wait_click(376, 404, "002CA4")
			Call wait_click(320, 327, "071572")
			Call wait_click(389, 342, "343434")
		Else
			MsgBox "Warning: 基本種符紙已滿"
			EndScript
		End If
		Call wait_click(732, 87, "6868FC")
		Goto eventStart
	End If
End Sub

Sub check_ap(intX)
	apBar = int(231 + 110 * intX)
	If color_match(apBar, 18, "162622") Then
		//物品
		Call wait_click(31, 178, "B4B8BF")
		Call wait_until(37, 84, "FFFFFF")
		Call if_click(114, 118, "465022")
		If color_match(34, 188, "000000") Then
			//使用行動藥
			Call click_point(34, 188)
			Call wait_click(148, 460, "07056B")
			Call wait_click(320, 327, "071572")
			Call wait_click(389, 342, "343434")
		Else
			MsgBox "Warning: 行動藥數量不足"
			EndScript
		End If
		Call wait_click(655, 85, "6868FC")
		Goto eventStart
	End If
End Sub

Sub check_hp
	If color_match(72, 492, "2000C0") Then
		//返回庭園
		Call wait_click(661, 518, "656EF9")
		//物品
		Call wait_click(31, 178, "B4B8BF")
		Call wait_until(37, 84, "FFFFFF")
		Call if_click(114, 118, "465022")
		If color_match(34, 157, "FFFFFF") Then
			//使用神酒瓶
			Call click_point(34, 157)
			Call wait_click(148, 460, "07056B")
			Call wait_click(320, 327, "071572")
			Call wait_click(389, 342, "343434")
		Else
			MsgBox "Warning: 神酒瓶數量不足"
			EndScript
		End If
		Call wait_click(655, 85, "6868FC")
		Goto eventStart
	End If
End Sub

Sub check_pen(intX)
	//經驗筆事件判定
	If intX = 0 Then 
	Else
		If currentPen < intX Then 
			For i = 354 To 636 Step 94
				For j = 255 To 437 Step 182
					If color_match(i, j, "AADDF1") Then
						currentPen = currentPen + 1
					End If
				Next
			Next
		Else 
			MsgBox "EndScript: 經驗筆已達到指定數目"
			EndScript
		End If
	End If
End Sub

Sub barter_item(intX)
	If intX = 0 Then
	ElseIf intX > 0 Then
		//雜貨屋
		Call wait_click(203, 527, "A0B7C7")
		Call wait_until(102, 83, "3D461E")
		Call if_click(146, 126, "181D2F")
		Call if_click(255, 126, "181D2F")
		Call if_click(376, 126, "181D2F")
		Call if_click(510, 126, "555555")
		Call if_click(643, 126, "181D2F")
		Do While color_match(684, 143 + 27 * intX, "002FA5")
			//換領活動物品
			Call click_point(684, 143 + 27 * intX)
			Call wait_click(513, 498, "262C13")
			Call wait_until(102, 83, "3D461E")
		Loop
		Call wait_click(732, 87, "6868FC")
	End If
End Sub

Sub check_stop
	//是視窗
	If color_match(320, 327, "071572") Then
		Call click_point(320, 327)
		Call wait_click(389, 342, "343434")
	End If
	//關閉視窗
	Call if_click(389, 342, "343434")
	//札牌
	Call if_click(544, 72, "6868FC")
	//物品
	Call if_click(655, 85, "6868FC")
	//雜貨屋
	Call if_click(732, 87, "6868FC")
	//下一層
	Call if_click(194, 107, "177CDA")
	//返回
	Call if_click(283, 256, "4EB4F5")
	//離開地圖
	Call if_click(661, 518, "656EF9")
	stopTime = 0
	Goto eventStart
End Sub

Sub game_refresh
	//重整遊戲
	Call click_point(980, - 80 )
	Delay 12000
	Call click_point(1176, - 7 )
	refreshTime = 0
	Goto eventStart
End Sub
