[General]
SyntaxVersion=2
MacroID=325a9747-2f81-4e5c-b983-a03c08e17a73
[Comment]

[Script]
//請在下面寫上您的副程式或函數
//寫完保存後，在任一命令庫上點擊右鍵並選擇“刷新”即可

//全域坐標
Dim ancX, ancY, ancC

//啟動腳本
Sub program_init(strId)
	Select Case (strId)
		Case "laplace"
			ancX = 323
			ancY = 168
			ancC = "F0E0FF"
		Case "genshin"
			ancX = 163
			ancY = 80
			ancC = "D4DFE7"
		Case "treeofsavior"
			ancX = 329
			ancY = 167
			ancC = "F7E5BA"
	End Select
	
//	找色功能不支援負坐標
	FindColor 0, 0, 1920, 1080, ancC, ancX, ancY
	If Not(ancX = -1) And Not(ancY = -1) Then
//		MessageBox "腳本啟動成功: " & ancX & ", " & ancY
	Else
		MessageBox "腳本啟動失敗: " & ancX & ", " & ancY
		EndScript
	End If
End Sub

//獲取坐標顏色
Function color_at(intX, intY)
	color_at = GetPixelColor(intX + ancX, intY + ancY)
End Function

//判斷顏色相同
Function color_match(intX, intY, strC)
	IfColor intX + ancX, intY + ancY, strC, 0 Then
		color_match = 1
	Else 
		color_match = 0
	End If
End Function

//左鍵點擊
Sub click(intX, intY)
	MoveTo intX + ancX, intY + ancY
	LeftClick 1
	Delay 1000 * 0.3
End Sub

//移動鼠標
Sub move_to(intX, intY)
	MoveTo intX + ancX, intY + ancY
	Delay 1000 * 0.3
End Sub

//顏色相同時左鍵點擊
Sub click_if(intX, intY, strC)
	If color_match(intX, intY, strC) Then 
		Call click(intX, intY)
	End If
End Sub

//左鍵點擊至顏色相同
Sub click_until(intX, intY, strC)
	Do Until color_match(intX, intY, strC)
		Call click(intX, intY)
	Loop
End Sub

//等待至顏色相同
Sub wait_until(intX, intY, strC)
	Do Until color_match(intX, intY, strC)
		Delay 1000 * 0.3
	Loop
End Sub

//等待至顏色相同(2種顏色)
Sub wait_until_or(intX, intY, strC1, strC2)
	Do Until color_match(intX, intY, strC1) Or color_match(intX, intY, strC2)
		Delay 1000 * 0.3
	Loop
End Sub

//等待至顏色相同時左鍵點擊
Sub wait_click(intX, intY, strC)
	Call wait_until(intX, intY, strC)
	Call click(intX, intY)
End Sub

//等待至顏色相同時左鍵點擊(2種顏色)
Sub wait_click_or(intX, intY, strC1, strC2)
	Call wait_until_or(intX, intY, strC1, strC2)
	Call click(intX, intY)
End Sub

//等待至坐標顏色靜止
Sub wait_until_color_unchange(intX, intY)
	Dim strC1, strC2
	strC1 = color_at(intX, intY)
	Do While Not(strC1 = strC2)
		Delay 1000 * 0.6
		strC2 = strC1
		strC1 = color_at(intX, intY)
	Loop
End Sub
