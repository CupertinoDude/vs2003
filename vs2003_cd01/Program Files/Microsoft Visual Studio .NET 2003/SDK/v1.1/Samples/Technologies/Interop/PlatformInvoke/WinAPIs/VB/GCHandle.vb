' Copyright
' Microsoft Corporation
' All rights reserved

' GCHandle.vb

Imports System
Imports System.IO
Imports System.Threading
Imports System.Windows.Forms
Imports System.Runtime.InteropServices

Public Delegate Function CallBack( ByVal handle As Integer, ByVal param As IntPtr ) As Boolean

Public Class LibWrap

	' passing managed object as LPARAM
	' BOOL EnumWindows(WNDENUMPROC lpEnumFunc, LPARAM lParam);
	
	Declare Function EnumWindows Lib "user32.dll" ( _
		ByVal cb As CallBack, ByVal param As IntPtr ) As Boolean

End Class 'LibWrap

Public Class App

	Public Shared Sub Main()
	
		Dim tw As TextWriter = System.Console.Out
		Dim gch As GCHandle = GCHandle.Alloc( tw )
		
		' platform invoke will prevent delegate to be garbage collected
		' before call ends	
		
		Dim cewp As CallBack
		cewp = AddressOf App.CaptureEnumWindowsProc
			
		LibWrap.EnumWindows( cewp, GCHandle.op_Explicit( gch ))
		
		gch.Free()
		
	End Sub 'Main
	
	Public Shared Function CaptureEnumWindowsProc( ByVal handle As Integer, ByVal param As IntPtr ) As Boolean
	
		Dim gch As GCHandle = GCHandle.op_Explicit( param )
		Dim tw As TextWriter = CType( gch.Target, TextWriter )
		tw.WriteLine( handle )
		return True
		
	End Function 'CaptureEnumWindowsProc
	
End Class 'App 


