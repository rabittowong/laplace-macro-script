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
MacroID=d7e82c87-b51c-47b6-a14e-af17a34e0818
Description=後台刷書
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
//地圖難度(可設定1-3內整數/1銅/2銀/3金)
diff = 1

//當AP少於10%時使用行動藥(可設定0-0.6以內小數)
ap = 0.2

/*=================================================
式姬之庭
後台刷書程序

最後更新: 20/07/2016 12:20
測試瀏覽器: Firefox 45.0
=================================================*/

//主程序內容
Call back_initial
Call check_value
Do
	Rem eventStart
	
	//檢查卡數/文數/AP
	If color_match(295, 546, "0021FF") Then
		Call check_ap(ap)
		//討伐
		Call wait_click(295, 546, "0021FF")
	End If
	Delay 300
	
	//選擇地圖
	If color_match(593, 493, "424ED8") Then
		//選擇討伐地
		Call click_point(360, 533)
		Call click_point(373, 108)
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
	
	//獲取討伐獎勵
	If color_match(524, 468, "262C13") Then 
		Call click_point(524, 468)
		currentFloor = currentFloor + 1
		If color_match(194, 107, "177CDA") Then 
			If currentFloor >= 4 Then
				//返回
				Call click_point(544, 87)
				currentFloor = 0
			Else
				//下一層
				Call click_point(194, 107)
			End If
		End If
	End If
	Delay 300
Loop
//主程序結束

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
Sub check_value
	//程序設定整數化
	diff = int(diff)
	card = int(card)
	
	//檢查程序設定
	If diff < 1 Or diff > 3 Then
		MsgBox "Error: 地圖難度數值設定錯誤"
		EndScript
	ElseIf ap < 0 Or ap > 0.6 Then
		MsgBox "Error: AP數值設定錯誤"
		EndScript
	ElseIf card < 0 Then
		MsgBox "Error: 經驗筆數值設定錯誤"
		EndScript
	End If
	Delay 300
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
