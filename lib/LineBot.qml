[General]
SyntaxVersion=2
MacroID=f30b66c1-6716-40fa-aab0-b6265f77a7e3
[Comment]

[Script]
//請在下面寫上您的副程式或函數
//寫完保存後，在任一命令庫上點擊右鍵並選擇“刷新”即可

//以LineBot身份發送訊息
Sub send_message_start()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "主人 我現在開始跑一條啦"
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

//以LineBot身份發送訊息
Sub send_message_end()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "主人 一條跑完啦"
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

//以LineBot身份發送訊息
Sub send_message_help()
	VBSBegin
    	Dim request, message, url, uid, token, json
    	
    	message = "噓 不要被主人發現我在偷懶"
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
