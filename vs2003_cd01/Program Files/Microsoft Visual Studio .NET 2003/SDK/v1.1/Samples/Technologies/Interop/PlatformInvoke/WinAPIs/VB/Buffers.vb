' Copyright
' Microsoft Corporation
' All rights reserved

'Buffers.vb

Imports System
Imports System.Text
Imports System.Runtime.InteropServices

Public Class LibWrap

	' UINT GetSystemDirectory(LPTSTR lpBuffer, UINT uSize)
	
	Declare Auto Sub GetSystemDirectory Lib "Kernel32.dll" _
		( ByVal sysDirBuffer As StringBuilder, ByVal buffSize As Integer )
	
	' BOOL GetUserName(LPTSTR lpBuffer,LPDWORD nSize)
	
	Declare Auto Sub GetUserName Lib "Advapi32.dll" _
		( ByVal userNameBuffer As StringBuilder, ByRef buffSize As Integer )
		
	' When marshaling strings as return types, the platform invoke marshaler assumes
	' it must free the memory the original LPTSTR pointed to.  This isn't
	' quite valid when a function like this returns a pointer into the 
	' process's environment or similar kernel data structure.
	
	' LPTSTR GetCommandLine();
	
	Declare Auto Function GetCommandLine _
		Lib "Kernel32.dll" () As IntPtr		
	
End Class

Public Class App
	Public Shared Sub Main()
	
		' call GetSystemDirectory
		Dim sysDirBuffer As New StringBuilder( 256 )
		LibWrap.GetSystemDirectory( sysDirBuffer, sysDirBuffer.Capacity )
		Console.WriteLine( "SysDir: {0}", sysDirBuffer )
		
		' call GetUserName
		Dim userNameBuffer As New StringBuilder( 128 )
		Dim buffSize As Integer
		buffSize = userNameBuffer.Capacity
		LibWrap.GetUserName( userNameBuffer, buffSize )
		Console.WriteLine( "UserName: {0}", userNameBuffer )
		
		' call GetCommandLine
		Dim cmdLineStr As IntPtr = LibWrap.GetCommandLine()
		Dim commandLine As String = Marshal.PtrToStringAuto( cmdLineStr )
		Console.WriteLine( "CommandLine: {0}", commandLine )		
		
	End Sub
End Class


