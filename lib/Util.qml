[General]
SyntaxVersion=2
MacroID=325a9747-2f81-4e5c-b983-a03c08e17a73
[Comment]

[Script]
//請在下面寫上您的副程式或函數
//寫完保存後，在任一命令庫上點擊右鍵並選擇“刷新”即可

Dim ancX, ancY, ancC

//啟動腳本
Sub program_init(strId)
	Select Case (strId)
		Case "laplace"
			ancX = -1597
			ancY = 168
			ancC = "DB864D"
		Case "genshin"
			ancX = 163
			ancY = 80
			ancC = "D4DFE7"
	End Select
	
//	找色功能不支援負坐標
//	FindColor 0, 0, 1920, 1080, ancC, ancX, ancY
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

//左鍵速點
Sub click_instant(intX, intY)
	MoveTo intX + ancX, intY + ancY
	LeftClick 1
End Sub

//移動鼠標
Sub move_to(intX1, intY1)
	MoveTo intX1 + ancX, intY1 + ancY
	Delay 1000 * 0.3
End Sub

//左鍵按住移動
Sub move(intX1, intY1, intX2, intY2)
	MoveTo intX1 + ancX, intY1 + ancY
	LeftDown 1
	MoveTo intX2 + ancX, intY2 + ancY
	LeftUp 1
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

//等待至顏色相同時左鍵點擊
Sub wait_click(intX, intY, strC)
	Call wait_until(intX, intY, strC)
	Call click(intX, intY)
End Sub

Sub wait_click_or(intX, intY, strC, strD)
	Call wait_until_or(intX, intY, strC, strD)
	Call click(intX, intY)
End Sub

//等待至顏色相同
Sub wait_until(intX, intY, strC)
	Do Until color_match(intX, intY, strC)
		Delay 1000 * 0.3
	Loop
End Sub

Sub wait_until_or(intX, intY, strC, strD)
	Do Until color_match(intX, intY, strC) Or color_match(intX, intY, strD)
		Delay 1000 * 0.3
	Loop
End Sub

//等待至顏色靜止
Sub wait_static(intX, intY)
	Dim preC, curC
	preC = color_at(intX, intY)
	Do While 1
		Delay 1000 * 0.6
		curC = color_at(intX, intY)
		If preC = curC Then 
			Exit Do
		Else 
			preC = curC
		End If
	Loop
End Sub
