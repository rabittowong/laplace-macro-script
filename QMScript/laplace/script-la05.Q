[General]
SyntaxVersion=2
BeginHotkey=101
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=96
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=50aa046e-9dc8-4c55-80ed-b838a34d0806
Description=自動放生
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
風之國度 自動放生程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("laplace")
For 1
	//抓捕
	If Lib.Util.color_match(748, 648, "01BA62") Then 
		Call pet_catch
	End If
	//升星
	If Lib.Util.color_match(369, 346, "D2EAF7") Then 
		Call pet_raise
	End If
	//放生
	If Lib.Util.color_match(369, 346, "D2EAF7") Then 
		Call pet_release
	End If
Next

Sub pet_catch
	Do While 1
		//全選
		Call Lib.Util.wait_click(748, 648, "01BA62")
		//位置11
		If Lib.Util.color_match(572, 268, "6ADAFF") Then 
			Call Lib.Util.click(654, 261)
		End If
		//位置12
		If Lib.Util.color_match(723, 268, "6ADAFF") Then 
			Call Lib.Util.click(804, 261)
		End If
		//位置13
		If Lib.Util.color_match(873, 268, "68DAFF") Then 
			Call Lib.Util.click(954, 261)
		End If
		//位置14
		If Lib.Util.color_match(1024, 268, "6ADAFF") Then 
			Call Lib.Util.click(1105, 261)
		End If
		//位置21
		If Lib.Util.color_match(572, 409, "6FDDFF") Then 
			Call Lib.Util.click(654, 402)
		End If
		//位置22
		If Lib.Util.color_match(723, 409, "71DDFF") Then 
			Call Lib.Util.click(804, 402)
		End If
		//位置23
		If Lib.Util.color_match(873, 409, "6EDDFF") Then 
			Call Lib.Util.click(954, 402)
		End If
		//位置24
		If Lib.Util.color_match(1024, 409, "6FDDFF") Then 
			Call Lib.Util.click(1105, 402)
		End If
		//簽訂契約
		Call Lib.Util.wait_click(881, 648, "059AF4")
		//選擇10次
		Call Lib.Util.wait_until(821, 650, "129EF5")
		Call Lib.Util.click_if(762, 535, "8CB5D3")
		//委託捕捉
		Call Lib.Util.wait_click(821, 650, "129EF5")
	Loop
End Sub

Sub pet_raise
	Do While 1
		//選擇守護
		Call Lib.Util.wait_click(369, 346, "D2EAF7")
		//加號
		Call Lib.Util.wait_click(870, 661, "D3F3FD")
		//一鍵升級
		Call Lib.Util.wait_click(909, 448, "23D2B8")
		//關閉
		Call Lib.Util.wait_click(895, 659, "099BF5")
		//升星
		Call Lib.Util.wait_click(895, 659, "099BF5")
		//選擇守護1
		Call Lib.Util.wait_click(242, 213, "587691")
		//選擇守護2
		Call Lib.Util.wait_click(364, 213, "587691")
		//升星
		Call Lib.Util.wait_click(927, 653, "069AF5")
		//關閉
		Call Lib.Util.wait_click(927, 653, "B5D7E7")
		//厲害了
		Call Lib.Util.wait_click(637, 468, "FEFFFF")
	Loop
End Sub

Sub pet_release
	Do While 1
		//查看寵物
		Select Case Lib.Util.color_at(227, 250)
			//傘蓋菇
			Case "7E9CCC"
				Call release(1, "blue")
			//王小狸
			Case "2D5D96"
				Call release(1, "blue")
			//花精靈
			Case "352669"
				Call release(1, "blue")
			//寶箱怪
			Case "437CB1"
				Call release(1, "blue")
			//雪怪
			Case "9F9476"
				Call release(1, "blue")
			//啾可
			Case "4499C5"
				Call release(1, "blue")
			//胖啾可
			Case "20919A"
				Call release(2, "blue")
			//貓法師
			Case "679EBA"
				Call release(2, "blue")
			//狼人戰士
			Case "D0B65F"
				Call release(2, "blue")
			//晶熊獸
			Case "8D634C"
				Call release(2, "blue")
			//古樹妖
			Case "1E2B3C"
				Call release(2, "blue")
			//魔法刺蝟
			Case "B9B5B2"
				Call release(2, "blue")
			//銀雪企鵝
			Case "462325"
				Call release(2, "purple")
			//叢林地精
			Case "26497E"
				Call release(2, "purple")
			//幻影狐
			Case ""
				Call release(2, "purple")
			//蔓德拉
			Case "26497E"
				Call release(2, "purple")
			//火靈豬
			Case "4556BE"
				Call release(2, "purple")
			//楓葉梟獸
			Case "2B6DB7"
				Call release(2, "purple")
			//啾比
			Case "96B5CF"
				Call release(2, "purple")
			//火晶魔
			Case "262B8C"
				Call release(2, "purple")
			//草靈兄弟
			Case "367DC4"
				Call release(2, "purple")
			//旅行松鼠
			Case "7A9CC5"
				Call release(2, "purple")
			//貝薩
			Case "26497E"
				Call release(2, "purple")
			//楓葉熊
			Case ""
				Call release(2, "purple")
		End Select
	Loop
End Sub

Sub release(intSta, strC)
	//如果是三星以上
	If Lib.Util.color_match(192, 252, "6DDDFF") Then 
		//停止
		EndScript
	Else
		//放生
		Call Lib.Util.wait_click(407, 195, "CFE7FF")
		//確認
		Call Lib.Util.wait_click(749, 499, "069AF5")
	End If
End Sub
