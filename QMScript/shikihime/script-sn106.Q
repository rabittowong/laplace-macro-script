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
MacroID=371404e1-68a9-44b9-aebb-d47b7ec15f4e
Description=後台五行(黑兔)
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
//選擇品種
ShikiType = 4

//開始位置
Offset = 59 * 1

/*=================================================
式姬之庭
後台五行(黑兔)程序

最後更新: 14/05/2016 17:20
測試瀏覽器: Firefox 45.0
=================================================*/

//主程序內容
Call back_initial
Call wait_click(28, 124, "A1A6AF")
For 5
	Call wait_click(542, 102, "009DE6")
Next
Do
	Call wait_until(52, 99, "FFFFFF")
	Select Case ShikiType
		Case 1
			Call wait_click(49 + Offset, 154, "C3E5FF")	
		Case 2
			Call wait_click(44 + Offset, 167, "C3DEFF")
		Case 3
			Call wait_click(49 + Offset, 154, "CFE8FF")
		Case 4
			Call wait_click(49 + Offset, 154, "C4DFFF")
		Case 5
			Call wait_click(167 + Offset, 154, "7B7F85")
		Case 6
			Call wait_click(49 + Offset, 154, "5B528E")
	End Select
	Call wait_click(511, 519, "603207")
	Call wait_click(463, 441, "171E8C")
	Call wait_click(278, 309, "823B09")
	Select Case ShikiType
		Case 1
			Call wait_click(73, 417, "C3E5FF")	
		Case 2
			Call wait_click(68, 430, "C3DEFF")
		Case 3
			Call wait_click(73, 417, "CFE8FF")
		Case 4
			Call wait_click(73, 417, "C4DFFF")
		Case 5
			Call wait_click(73, 417, "C3DEFF")
		Case 6
			Call wait_click(73, 417, "5B528E")
	End Select
	Call wait_click(682, 306, "181F8F")
	Call wait_click(318, 327, "07146A")
	Call wait_click(394, 436, "262C13")
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
