[General]
SyntaxVersion=2
MacroID=f30b66c1-6716-40fa-aab0-b6265f77a7e3
[Comment]

[Script]
//�Цb�U���g�W�z���Ƶ{���Ψ��
//�g���O�s��A�b���@�R�O�w�W�I���k��ÿ�ܡ���s���Y�i

//�HLineBot�����o�e�T��
Sub send_message_start()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "�D�H �ڲ{�b�}�l�]�@����"
		url = "https://api.line.me/v2/bot/message/push"
		uid = "***"
		token = "***"
		json = "{""to"":""" & uid & """,""messages"":[{""type"":""text"",""text"":""" & message & """}]}"
		
		Set request = CreateObject("MSXML2.XMLHTTP")
		request.open "POST", url, False
		request.setRequestHeader "Authorization", "Bearer " & token
		request.setRequestHeader "Content-Type", "application/json"
		request.send json
	VBSEnd
End Sub

//�HLineBot�����o�e�T��
Sub send_message_end()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "�D�H �@���]����"
		url = "https://api.line.me/v2/bot/message/push"
		uid = "***"
		token = "***"
		json = "{""to"":""" & uid & """,""messages"":[{""type"":""text"",""text"":""" & message & """}]}"
		
		Set request = CreateObject("MSXML2.XMLHTTP")
		request.open "POST", url, False
		request.setRequestHeader "Authorization", "Bearer " & token
		request.setRequestHeader "Content-Type", "application/json"
		request.send json
	VBSEnd
End Sub

//�HLineBot�����o�e�T��
Sub send_message_help()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "�N ���n�Q�D�H�o�{�ڦb���i"
		url = "https://api.line.me/v2/bot/message/push"
		uid = "***"
		token = "***"
		json = "{""to"":""" & uid & """,""messages"":[{""type"":""text"",""text"":""" & message & """}]}"
		
		Set request = CreateObject("MSXML2.XMLHTTP")
		request.open "POST", url, False
		request.setRequestHeader "Authorization", "Bearer " & token
		request.setRequestHeader "Content-Type", "application/json"
		request.send json
	VBSEnd
End Sub
