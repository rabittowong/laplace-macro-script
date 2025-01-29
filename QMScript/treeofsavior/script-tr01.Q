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
MacroID=2df76591-9cb7-4cbb-b427-f07685824d2e
Description=自動採集
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
原神 自動採集程序

版本: 1.0
作者: Rabitto
================================
*/

//採集地(1冬泉/2淚光/3海港)
map = 3

//資源(1礦石/2木材)
resource = 1

//主程序內容
Call Lib.Util.program_init("treeofsavior")
Do While 1
	//採集完畢
	If not_collecting Then 
		//採集
		Call move_and_collect
	End If
	
	//如果有手藝
	If Lib.Util.color_match(1138, 342, "DBF4FD") Then
		//更多
		Call Lib.Util.wait_click(1222, 250, "DBEFF7")
	End If
	
	//忽略組隊
	Call Lib.Util.click_if(1038, 261, "7292C5")
	
	//零耗/幸運(藍)
	Call Lib.Util.click_if(1019, 605, "F4DD94")
	//豐收強化(金)
	Call Lib.Util.click_if(1019, 605, "449DD5")
	
	//豐收(紫)
	Call Lib.Util.click_if(1085, 497, "DEBAD6") //pending
	//豐收強化(金)
	Call Lib.Util.click_if(1085, 497, "A0E7FC")
Loop

//採集完畢
Function not_collecting
	//沒有讀條
	If Lib.Util.color_match(476, 453, "0FABA2") Then
		not_collecting = 0
	Else 
		Delay 600
		//沒有讀條
		If Lib.Util.color_match(476, 453, "0FABA2") Then
			not_collecting = 0
		Else 
			Delay 600
			//沒有讀條
			If Lib.Util.color_match(476, 453, "0FABA2") Then
				not_collecting = 0
			Else 
				not_collecting = 1
			End If
		End If
	End If
End Function

//資源點已刷新
Function not_refresh
	//資源
	Select Case resource
		Case 1
			//挖礦
			If Lib.Util.color_match(742, 345, "C4EBFF") Then
				not_refresh = 0
			Else 
				not_refresh = 1
			End If
		Case 2
			//伐木
			If Lib.Util.color_match(735, 349, "C3EAFF") Then
				not_refresh = 0
			Else 
				not_refresh = 1
			End If
	End Select
End Function

//採集
Sub move_and_collect
	//聚焦
	Call Lib.Util.wait_click(25, 7, "3A90DB")
	//向下移動
	Call move("S", 900)
	//向右移動
	Call move("D", 900)
	//如果沒有手藝
	If Lib.Util.color_match(1138, 342, "DBF4FD") = 0 Then
		//忽略組隊
		Call Lib.Util.click_if(1038, 261, "7292C5")
		//更多
		Call Lib.Util.wait_click(1221, 252, "DDF0F7")
	End If
	//手藝
	Call Lib.Util.wait_click(1138, 342, "DBF4FD")
	//採集
	Call Lib.Util.wait_click(1185, 535, "94A684")
	//採集地
	Select Case map
		Case 1
			//冬泉嶺
			Call Lib.Util.wait_until(549, 169, "5B82B3")
			Call Lib.Util.click_until(549, 169, "CADFD8")
		Case 2
			//淚光林地
			Call Lib.Util.wait_until(718, 169, "5B83B4")
			Call Lib.Util.click_until(718, 169, "CADFD9")
		Case 3
			//姆特利海港
			Call Lib.Util.wait_until(884, 169, "5981B3")
			Call Lib.Util.click_until(884, 169, "C9DFD8")
	End Select
	//滾動
	Do While 1
		If Lib.Util.color_match(1045, 217, "7A9DD4") Then
			//滾動到最底
			Exit Do
		Else 
			//滾動
			Call Lib.Util.move_to(601, 556)
			LeftDown 1
			Delay 300
			For 100
				MoveR 0, -4
				Delay 10
			Next
			LeftUp 1
			Delay 1800
		End If
	Loop
	//前往資源
	Select Case resource
		Case 1
			//礦石
			Call Lib.Util.wait_click(1045, 217, "7A9DD4")
			//挖礦
			Call wait_until_color_equal(742, 345, "C4EBFF")
			Call Lib.Util.wait_click(742, 345, "C4EBFF")
		Case 2
			//木材
			Call Lib.Util.wait_click(1045, 344, "769AD3")
			//伐木
			Call wait_until_color_equal(735, 349, "C3EAFF")
			Call Lib.Util.wait_click(735, 349, "C3EAFF")
	End Select
	//等待讀條
	Call Lib.Util.wait_until(476, 453, "0FABA2")
End Sub

//移動
Sub move(keyK, intX)
	//按下
	KeyDown keyK, 1
	Delay intX
	//彈起
	KeyUp keyK, 1
	Delay 300
End Sub

//等待至顏色相同
Sub wait_until_color_equal(intX, intY, strC)
	Dim strC1, strC2
	strC1 = Lib.Util.color_at(intX, intY)
	Do While 1
		Delay 1200
		strC2 = strC1
		strC1 = Lib.Util.color_at(intX, intY)
		If strC1 = strC And StrC2 = strC Then 
			Exit Do
		End If
	Loop
End Sub
