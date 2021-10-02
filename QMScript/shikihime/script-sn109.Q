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
MacroID=c20685a0-ead8-4e7d-bb39-16c56dc8b889
Description=後台五行(飯綱)
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
//選擇行動
Sub action_setting
//	Call get_shiro(16)				//換取白兔
//	Call exp_shiro(1000, 2, 50)		//對白兔使用經驗筆
//	Call get_red_bean(11)			//刷洗豆妖
//	Call int_izuna(8)				//合成飯綱
//	Call int_izuna_plus				//補合飯綱
//	Call exp_izuna(3000, 2, 8)		//對飯綱使用經驗筆
//	
//	Call sub_izuna(8)				//討伐廢村獲取經驗
//	Call level_up(8)				//合成經驗卡升等
	Call itm_kayano(300)			//使用五行素
End Sub

//循環回數
repeatTime = 1

/*=================================================
式姬之庭
後台五行(飯綱)程序

最後更新: 04/05/2016 17:20
測試瀏覽器: Firefox 45.0
=================================================*/

//主程序內容
Call back_initial
For repeatTime
	Call action_setting
Next
MsgBox "EndScript: 後台五行程序結束"
//主程序結束

//定義情況子程序
Sub exp_shiro(value, num, time)
	//對白兔使用經驗筆
	Call wait_click(28, 124, "A1A6AF")
	Call wait_until(52, 99, "FFFFFF")
	If color_match(473, 99, "FFFFFF") Then
		Call click_point(542, 102)
	End If
	For time
		Call wait_click(49, 154, "C4DFFF")
		Call wait_click(425, 520, "080679")
		Call wait_click(290, 370, "723108")
		Select Case value
			Case 1000
				Call wait_click(235, 104, "FFFFFF")
			Case 3000
				Call wait_click(237, 132, "FFFFFF")
			Case 5000
				Call wait_click(234, 164, "FFFFFF")
		End Select
		For num - 1
			Call click_point(320, 394)
		Next
		Call wait_click(415, 408, "161B8B")
		Call wait_click(320, 327, "071572")
		Call wait_click(394, 436, "262C13")
		Call wait_click(446, 85, "6868FC")
	Next
	Call wait_click(544, 72, "6868FC")
End Sub

Sub exp_izuna(value, num, time)
	//對飯綱使用經驗筆
	For time
		Call wait_click(42, 149, "CBE6FF")
		Call wait_click(425, 520, "080679")
		Call wait_click(290, 370, "723108")
		Select Case value
			Case 1000
				Call wait_click(235, 104, "FFFFFF")
			Case 3000
				Call wait_click(237, 132, "FFFFFF")
			Case 5000
				Call wait_click(234, 164, "FFFFFF")
		End Select
		For num - 1
			Call click_point(320, 394)
		Next
		Call wait_click(415, 408, "161B8B")
		Call wait_click(320, 327, "071572")
		Call wait_click(394, 436, "262C13")
		Call wait_click(446, 85, "6868FC")
	Next
	Call wait_click(544, 72, "6868FC")
End Sub

Sub get_shiro(num)
	//換取白兔
	Call wait_click(204, 527, "B5D7EE")
	Call wait_until(116, 85, "FFFFFF")
	Call if_click(643, 126, "555555")
	Call wait_click(684, 251, "002FA5")
	For num - 1
		Call click_point(533, 336)
	Next
	Call wait_click(376, 404, "002CA4")
	Call wait_click(513, 498, "262C13")
	Call wait_click(732, 87, "6868FC")
End Sub

Sub get_red_bean(num)
	//刷洗豆妖
	Call check_card
	Do
		//檢查卡數/文數/AP
		If color_match(295, 546, "0021FF") Then
			Call check_coin
			Call check_ap(0.2)
			Call wait_click(295, 546, "0021FF")
		End If
		Delay 300

		//選擇地圖
		If color_match(593, 493, "424ED8") Then
			Delay 300
			Call click_point(265, 541)
			Call wait_click(691, 255, "B66B59")
			Call click_point(650, 354)
			Call wait_click(509, 363, "3699F9")
		End If
		Delay 300
		
		//戰鬥/返回
		Call click_point(334, 296)
		
		//獲取討伐獎勵
		If color_match(524, 468, "262C13") Then
			//減少戰鬥回數
			For i = 354 To 636 Step 94
				For j = 255 To 437 Step 182
					If color_match(i, j, "473E86") Then
						redBeanNum = redBeanNum + 1
					End If
				Next
			Next
			Call click_point(524, 468)
			//已獲得足夠數量
			If redBeanNum >= num Then 
				Exit Do
			End If
			If color_match(194, 107, "177CDA") Then
				//下一層
				Call click_point(194, 107)
			Else 
				//再挑戰
				Call wait_click(469, 261, "1E96E4")
				Delay 1500
				If color_match(390, 342, "333333") Then
					//再挑戰所需AP不足
					Call click_point(390, 342)
					Call wait_click(283, 256, "4EB4F5")
				End If
			End If
		End If
		Delay 300
	Loop
	Call wait_click(543, 86, "4EB4F5")
	redBeanNum = 0
End Sub

Sub int_izuna(time)
	//合成飯綱
	Call wait_click(28, 124, "A1A6AF")
	Call wait_until(52, 99, "FFFFFF")
	If color_match(473, 99, "FFFFFF") Then
		Call click_point(542, 102)
	End If
	basX = 226
	basY = 154
	For time
		Call wait_until(52, 99, "FFFFFF")
		If color_match(basX, basY, "C4DFFF") Then
		Else 
			basX = basX + 59
			If basX > 550 Then 
				basX = 49
				basY = basY + 103
			End If
		End If
		Call click_point(basX, basY)
		Call wait_click(511, 519, "603207")
		Call wait_click(679, 441, "171D89")
		Call wait_click(274, 309, "823B09")
		Call wait_click(73, 417, "C4DFFF")
		Call wait_click(403, 309, "823B09")
		Call wait_click(67, 422, "4B658E")
		Call wait_click(703, 313, "171D89")
		Call wait_click(318, 327, "07146A")
		Call wait_click(394, 436, "262C13")
	Next
End Sub

Sub int_izuna_plus
	//補合飯綱
	Do
		Call wait_until(42, 149, "CBE6FF")
		izunaNum = 8
		For i = 42 To 455 Step 59
			If color_match(i, 149, "CBE6FF") Then 
				izunaNum = izunaNum - 1
			End If
		Next
		If izunaNum <= 0 Then 
			Exit Do
		End If
		Call wait_click(544, 72, "6868FC")
		Call get_shiro(izunaNum)
		Call wait_click(28, 124, "A1A6AF")
		Call wait_until(52, 99, "FFFFFF")
		For 5
			Call wait_click(542, 102, "009DE6")
		Next
		basX = 49 + 59 * izunaNum
		basY = 154
		For izunaNum
			Call wait_click(basX, basY, "C4DFFF")
			Call wait_click(425, 520, "080679")
			Call wait_click(290, 370, "723108")
			Call wait_click(235, 104, "FFFFFF")
			Call wait_click(320, 394, "E9F4F8")
			Call wait_click(415, 408, "161B8B")
			Call wait_click(320, 327, "071572")
			Call wait_click(394, 436, "262C13")
			Call wait_click(446, 85, "6868FC")
			basX = basX + 59
			If basX > 550 Then 
				basX = 49
				basY = basY + 103
			End If
		Next
		For izunaNum
			Call wait_click(49, 154, "C4DFFF")
			Call wait_click(511, 519, "603207")
			Call wait_until(21, 80, "3D401F")
			If color_match(679, 441, "171D89") Then 
				Call click_point(679, 441)
			Else 
				Call wait_click(728, 85, "6868FC")
				Call wait_click(544, 72, "6868FC")
				Call get_red_bean(1)
				Call wait_click(28, 124, "A1A6AF")
				Call wait_click(49, 154, "C4DFFF")
				Call wait_click(511, 519, "603207")
				Call wait_click(679, 441, "171D89")
			End If
			Call wait_click(274, 309, "823B09")
			Call wait_click(73, 417, "C4DFFF")
			Call wait_click(403, 309, "823B09")
			Call wait_click(67, 422, "4B658E")
			Call wait_click(703, 313, "171D89")
			Call wait_click(318, 327, "07146A")
			Call wait_click(394, 436, "262C13")
			Call wait_until(52, 99, "FFFFFF")
		Next
		For 5
			Call wait_click(415, 102, "009DE6")
		Next
	Loop
End Sub

Sub itm_kayano(num)
	//使用五行素
	Call wait_click(28, 124, "A1A6AF")
	Call wait_until(52, 99, "FFFFFF")
	If color_match(473, 99, "FFFFFF") Then
		Call click_point(542, 102)
	End If
	For num
//		Call wait_click(49, 154, "DBF6FC")	//草野
		Call wait_click(49, 154, "B0C9E4")	//特龍神
//		Call wait_click(49, 154, "C7E1FF")	//特死神
		Call wait_click(425, 520, "080679")
		Call wait_click(290, 370, "723108")
		Call wait_until(668, 441, "FFFFFF")
		Call press_point(668, 441, 1200)
		Call wait_click(73, 440, "FFFFFF")
		Call wait_click(415, 408, "161B8B")
		Call wait_click(320, 327, "071572")
		Call wait_click(391, 436, "262C13")
	Next
End Sub

Sub level_up(num)
	//合成經驗卡升等
	Call wait_click(28, 124, "A1A6AF")
	Call wait_until(52, 99, "FFFFFF")
	If color_match(473, 99, "FFFFFF") Then
		Call click_point(542, 102)
	End If
	For num
		Call wait_click(219, 149, "CBE6FF")
		Call wait_click(271, 520, "0F1271")
		Call wait_until(35, 86, "FFFFFF")
		Call click_point(71, 426)
		Call wait_until(478, 262, "313131")
		Call wait_click(687, 318, "161A8D")
		Call wait_click(320, 327, "071572")
		Call wait_click(394, 436, "262C13")
		Call wait_click(729, 85, "6868FC")
	Next
	Call wait_click(544, 72, "6868FC")
End Sub

Sub sub_izuna(num)
	//選擇隊伍
	Call wait_click(28, 340, "F4F5F6")
	Call wait_until(37, 83, "FFFFFF")
	If color_match(62, 170, "B5CBF7") Then
		Call click_point(62, 170) 
		Call click_point(62, 170)
		Call wait_click(230, 417, "D4EEFF")
		Call wait_click(283, 419, "C8E4FE")
		Call wait_click(719, 368, "009DE6")
	Else 
		For num
			Call click_point(200, 170)
		Next
	End If
	Call wait_until(228, 413, "CBE6FF")
	For num
		Call click_point(228, 413)
	Next
	Call wait_click(729, 85, "6868FC")
	//討伐
	Call check_coin
	For 3
		Call check_ap(0.45)
	Next
	Call wait_click(295, 546, "0021FF")
	Call wait_click(324, 533, "305E7D")
	Call wait_click(173, 288, "B66B59")
	Call wait_click(650, 354, "005F90")
	Call wait_click(509, 363, "3699F9")
	Do
		Call if_click(30, 55, "3D8020")
		If color_match(334, 296, "53723C") Then
			//更換隊伍
			If color_match(426, 331, "2831D7") Then
			Else
				Call click_point(386, 398)
				changeParty = 1
			End If
			Delay 100
			If color_match(557, 331, "2731D8") Then
			Else
				Call click_point(517, 398)
				changeParty = 1
			End If
			Delay 100
			If color_match(688, 331, "2731D8") Then
			Else
				Call click_point(648, 398)
				changeParty = 1
			End If
			Delay 100
			If changeParty = 1 Then
				Call wait_click(464, 289, "D4823D")
				changeParty = 0
			Else
				Call click_point(334, 296)
			End If
		End If
		Delay 300
		If color_match(524, 468, "262C13") Then
			Call click_point(524, 468)
			If lastSub = 0 Then
				//再挑戰
				Call wait_click(469, 261, "1E96E4")
				lastSub = 1
			Else
				//返回
				Call wait_click(283, 256, "4EB4F5")
				lastSub = 0
				Exit Do
			End If
		End If
		Delay 300
	Loop
End Sub

//程序初始化
Sub back_initial
	PHwnd = Plugin.Window.Find("MozillaWindowClass", "S04 - 小竹《式姬之庭》登陸專頁 - Mozilla Firefox")
	CHwnd = Plugin.Window.FindEx(PHwnd, 0, "MozillaWindowClass", 0)
	CHwnd = Plugin.Window.FindEx(CHwnd, 0, "GeckoPluginWindow", 0)
	CHwnd = Plugin.Window.FindEx(CHwnd, 0, "GeckoFPSandboxChildWindow", 0)
	If PHwnd = 0 Or CHwnd = 0 Then 
		MsgBox "Error: 無法獲得遊戲視窗句柄"
		EndScript
	End If
	Delay 300
	
	//獲得遊戲視窗左上角的座標
	snWide = Plugin.Sys.GetScRX()
	snHeight = Plugin.Sys.GetScRY()
	FindColor 0, 0, snWide, snHeight, "3E7258", corX, corY
	Rect = Plugin.Window.GetClientRect(PHwnd)
	offsetArray = Split(Rect, "|")
	offsetX = clng(offsetArray(0))
	offsetY = clng(offsetArray(1))
	corX = corX - offsetX
	corY = corY - offsetY
	If corX < 0 And corY < 0 Then
		MsgBox "Error: 無法獲得遊戲視窗左上角的座標"
		EndScript
	End If
	Delay 300
End Sub

//定義滑鼠子程序
Sub click_point(intX, intY)
	//左鍵
	Call Plugin.Bkgnd.LeftClick(CHwnd, intX + offsetX + 2, intY + offsetY + 2)
	Delay 300
End Sub

Sub press_point(intX, intY, timT)
	//移動滑鼠
	Call Plugin.Bkgnd.LeftDown(CHwnd, intX + offsetX + 2, intY + offsetY + 2)
	Delay timT
	Call Plugin.Bkgnd.LeftUp(CHwnd, intX + offsetX + 2, intY + offsetY + 2)
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
		End If
		Delay 300
	Loop
	Delay 300
End Sub

Sub wait_click(intX, intY, clrC)
	//等待至顏色等於clrC時左鍵
	Do
		If color_match(intX, intY, clrC) Then
			Call click_point(intX, intY)
			Exit Do
		End If
		Delay 300
	Loop
	Delay 300
End Sub

Function color_match(intX, intY, clrC)
	bkgC = hex(Plugin.BkgndColor.GetPixelColor(PHwnd, intX + corX, intY + corY))
	bkgC = string(6 - len(bkgC), "0") & bkgC
	If clrC = bkgC Then
		color_match = 1
	Else
		color_match = 0
	End If
End Function

//定義事件子程序
Sub check_card
	//札牌
	Call wait_click(28, 124, "A1A6AF")
	Call wait_until(52, 99, "FFFFFF")
	If color_match(131, 524, "566F68") Then
		//賣卡
		Call click_point(131, 524)
		Call wait_click(320, 327, "071572")
		Call wait_click(389, 342, "343434")
	End If
	Call wait_click(544, 72, "6868FC")
End Sub

Sub check_coin
	//文數多於100萬
	If color_match(65, 45, "000000") Then
		//雜貨屋
		Call wait_click(626, 527, "82D4F9")
		Call wait_until(126, 83, "E5E5E8")
		Call if_click(184, 128, "40491F")
		//買基本種符紙
		Call press_point(728, 449, 6000)
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
		Call wait_until(295, 546, "0021FF")
	End If
End Sub
