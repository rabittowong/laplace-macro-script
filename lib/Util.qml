[General]
SyntaxVersion=2
MacroID=325a9747-2f81-4e5c-b983-a03c08e17a73
[Comment]

[Script]
//�Цb�U���g�W�z���Ƶ{���Ψ��
//�g���O�s��A�b���@�R�O�w�W�I���k��ÿ�ܡ���s���Y�i

//���짤��
Dim ancX, ancY, ancC

//�Ұʸ}��
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
	
//	���\�ण�䴩�t����
	FindColor 0, 0, 1920, 1080, ancC, ancX, ancY
	If Not(ancX = -1) And Not(ancY = -1) Then
//		MessageBox "�}���Ұʦ��\: " & ancX & ", " & ancY
	Else
		MessageBox "�}���Ұʥ���: " & ancX & ", " & ancY
		EndScript
	End If
End Sub

//��������C��
Function color_at(intX, intY)
	color_at = GetPixelColor(intX + ancX, intY + ancY)
End Function

//�P�_�C��ۦP
Function color_match(intX, intY, strC)
	IfColor intX + ancX, intY + ancY, strC, 0 Then
		color_match = 1
	Else 
		color_match = 0
	End If
End Function

//�����I��
Sub click(intX, intY)
	MoveTo intX + ancX, intY + ancY
	LeftClick 1
	Delay 1000 * 0.3
End Sub

//���ʹ���
Sub move_to(intX, intY)
	MoveTo intX + ancX, intY + ancY
	Delay 1000 * 0.3
End Sub

//�C��ۦP�ɥ����I��
Sub click_if(intX, intY, strC)
	If color_match(intX, intY, strC) Then 
		Call click(intX, intY)
	End If
End Sub

//�����I�����C��ۦP
Sub click_until(intX, intY, strC)
	Do Until color_match(intX, intY, strC)
		Call click(intX, intY)
	Loop
End Sub

//���ݦ��C��ۦP
Sub wait_until(intX, intY, strC)
	Do Until color_match(intX, intY, strC)
		Delay 1000 * 0.3
	Loop
End Sub

//���ݦ��C��ۦP(2���C��)
Sub wait_until_or(intX, intY, strC1, strC2)
	Do Until color_match(intX, intY, strC1) Or color_match(intX, intY, strC2)
		Delay 1000 * 0.3
	Loop
End Sub

//���ݦ��C��ۦP�ɥ����I��
Sub wait_click(intX, intY, strC)
	Call wait_until(intX, intY, strC)
	Call click(intX, intY)
End Sub

//���ݦ��C��ۦP�ɥ����I��(2���C��)
Sub wait_click_or(intX, intY, strC1, strC2)
	Call wait_until_or(intX, intY, strC1, strC2)
	Call click(intX, intY)
End Sub

//���ݦܧ����C���R��
Sub wait_until_color_unchange(intX, intY)
	Dim strC1, strC2
	strC1 = color_at(intX, intY)
	Do While Not(strC1 = strC2)
		Delay 1000 * 0.6
		strC2 = strC1
		strC1 = color_at(intX, intY)
	Loop
End Sub
