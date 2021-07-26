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
風之國度 自動放生程序

版本: r1.0
作者: Rabitto
最後修改時間: 2021/01/16 21:04
================================
*/

Call Lib.Util.program_init("laplace")
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
