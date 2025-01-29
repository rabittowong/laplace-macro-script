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
MacroID=2fda1a90-c62d-46a0-9f87-25ef84277360
Description=自動每日委託
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
原神 自動每日委託程序

版本: 1.0
作者: Rabitto
================================
*/

Call Lib.Util.program_init("genshin")
For 1
	//蒙德
	Call Lib.Util.click(109, 155)
	//班尼特
	Call Lib.Util.click(874, 299) //白鐵塊
	//領取
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//繼續
	Call Lib.Util.click(793, 644)
	//選擇角色
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//第一位
	Call Lib.Util.click(156, 165)
	Delay 300
	//菲謝爾
	Call Lib.Util.click(466, 361) //摩拉
//	Call Lib.Util.click(929, 399) //獸肉
	//領取
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//繼續
	Call Lib.Util.click(793, 644)
	//選擇角色
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//第二位
	Call Lib.Util.click(156, 269)
	Delay 300
	
	//璃月
	Call Lib.Util.click(109, 215)
	//刻晴
	Call Lib.Util.click(671, 491) //摩拉
//	Call Lib.Util.click(602, 297) //馬尾
	//領取
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//繼續
	Call Lib.Util.click(793, 644)
	//選擇角色
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//第一位
	Call Lib.Util.click(156, 165)
	Delay 300
	//重雲
	Call Lib.Util.click(464, 495) //摩拉
//	Call Lib.Util.click(974, 537) //白蘿蔔
	//領取
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//繼續
	Call Lib.Util.click(793, 644)
	//選擇角色
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//第二位
	Call Lib.Util.click(156, 269)
	Delay 300
	
	//稻妻
	Call Lib.Util.click(109, 274)
	//九條裟羅
	Call Lib.Util.click(912, 250) //摩拉
//	Call Lib.Util.click(952, 388) //甜甜花
	//領取
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//繼續
	Call Lib.Util.click(793, 644)
	//選擇角色
	Call Lib.Util.wait_click(1446, 870, "D8E5EC")
	//第一位
	Call Lib.Util.click(156, 165)
Next
