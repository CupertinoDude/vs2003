' Copyright
' Microsoft Corporation
' All rights reserved

' Strings.vb

Imports System
Imports System.Text
Imports Microsoft.VisualBasic
Imports System.Runtime.InteropServices

'typedef struct _MYSTRSTRUCT
'{
'	wchar_t* buffer;
'	UINT size; 
'} MYSTRSTRUCT;

< StructLayout( LayoutKind.Sequential, CharSet:=CharSet.Unicode )> _
Public Structure MyStrStruct

	Public buffer As String
	Public size As Integer
	
End Structure 'MyStrStruct

'typedef struct _MYSTRSTRUCT2
'{
'	char* buffer;
'	UINT size; 
'} MYSTRSTRUCT2;

< StructLayout( LayoutKind.Sequential, CharSet:=CharSet.Ansi )> _
Public Structure MyStrStruct2

	Public buffer As String
	Public size As Integer
	
End Structure 'MyStrStruct2

Public Class LibWrap
   
   'char* TestStringAsResult()
   
   Declare Function TestStringAsResult Lib "..\LIB\PinvokeLib.dll" () As String
   
   'void TestStringInStruct(MYSTRSTRUCT* pStruct)
   
   Declare Sub TestStringInStruct Lib "..\LIB\PinvokeLib.dll" ( ByRef mss As MyStrStruct )
   
   'void TestStringInStructAnsi(MYSTRSTRUCT2* pStruct)
   
   Declare Sub TestStringInStructAnsi Lib "..\LIB\PinvokeLib.dll" ( ByRef mss As MyStrStruct2 )
   
End Class 'LibWrap

Public Class App
	Public Shared Sub Main()
   
		' ************** string as result ********************************
		Dim strng As String = LibWrap.TestStringAsResult()
		Console.WriteLine( ControlChars.CrLf + "String returned: {0}", strng )
		
		' ************* pass Unicode string ***********
		
		' initialize buffer and append something to the end so whole
		' buffer is passed to unmanaged side
				
		Dim buffer As New StringBuilder( "content", 100 )
		buffer.Append( ChrW(0) )
		buffer.Append( "*"c, buffer.Capacity - 8)
		
		Dim mss As MyStrStruct
		mss.buffer = buffer.ToString()
		mss.size = mss.buffer.Length
		
		LibWrap.TestStringInStruct( mss )
		
		Console.WriteLine( ControlChars.CrLf + "Buffer after Unicode function call: {0}", mss.buffer )
		
		' ************* pass Ansi string *********************
		Dim buffer2 As New StringBuilder( "content", 100 )
		buffer2.Append( ChrW(0) )
		buffer2.Append( "*"c, buffer2.Capacity - 8 )
		
		Dim mss2 As MyStrStruct2
		mss2.buffer = buffer2.ToString()
		mss2.size = mss2.buffer.Length 
		
		LibWrap.TestStringInStructAnsi( mss2 )
		
		Console.WriteLine( ControlChars.CrLf + "Buffer after Ansi function call: {0}", mss2.buffer )
	
	End Sub 'Main
End Class 'App
