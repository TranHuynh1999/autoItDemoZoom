#include<File.au3>
#region

		#region
		Func _Au3Setup()
		Opt('WinWaitDelay',100)
		Opt('WinDetectHiddenText',1)
		Opt('MouseCoordMode',0)
		Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
		If $aResult[1] <> '00000409' Then
		  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000409->' & $aResult[1] & ')')
		EndIf

		EndFunc

		Func _WinWaitActivate($title,$text,$timeout=0)
			WinWait($title,$text,$timeout)
			If Not WinActive($title,$text) Then WinActivate($title,$text)
			WinWaitActive($title,$text,$timeout)
		EndFunc

_AU3Setup()
#endregion
$fileTestPath = @WorkingDir & "\Input.txt" ;đường dẫn file test
$fileOutPutPath = @WorkingDir & "\Output.csv" ; đường dẫn file output

$fileTest = FileOpen($fileTestPath) ; mở file test
$fileOutPut = FileOpen($fileOutPutPath, 2) ; mở file output với chế độ ghi đè
FileWriteLine($fileOutPut, "UserName,Password,Passed") ; header cho file output
For $i= 1 To 10
		$line=FileReadLine($fileTest,$i);
		$itemInTest=StringSplit($line," ");
		Run('C:\Users\Dell\Downloads\ZoomInstaller.exe');
		_WinWaitActivate("Zoom Cloud Meetings","");
		Sleep(2000);
		MouseClick("left",269,244,1);
		Send($itemInTest[1]);
		Sleep(2000);
		MouseClick("left",181,200,1);
		Send($itemInTest[2]);
		Sleep(2000);
		MouseClick("left",278,268,1);
		Sleep(7000);
		$searchPixel=PixelSearch(783,365,1070,600, 0xe02828)
		if (@error=1) Then
			FileWriteLine($fileOutPut,$itemInTest[1] & "," & $itemInTest[2] & "," & "True")
		Else
			FileWriteLine($fileOutPut,$itemInTest[1] & "," & $itemInTest[2] & "," & "False")
		EndIf
		Sleep(2000)
		WinClose("Zoom Cloud Meetings");
		Sleep(2000);
Next
FileClose($fileTest)
#endregion --- Au3Recorder generated code End ---
