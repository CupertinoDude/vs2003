' Copyright
' Microsoft Corporation
' All rights reserved

' MsgBox.vb

Imports System
Imports System.Runtime.InteropServices

Public Class LibWrap

	' int MessageBox(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType)
	
	Declare Auto Function MsgBox Lib "User32.dll" Alias "MessageBox" ( _
		ByVal hWnd As Integer, ByVal txt As String, ByVal caption As String, ByVal typ As Integer ) _
	As Integer
	
	' this will cause incorrect output in message window
	
	Declare Ansi Function MsgBox2 Lib "User32.dll" Alias "MessageBoxW" ( _
		ByVal hWnd As Integer, ByVal txt As String, ByVal caption As String, ByVal type As Integer ) _
	As Integer 
	
	' this will cause an exception
	' ExactSpelling := True by default in VB.NET when Ansi or Unicode is used
	
	Declare Ansi Function MsgBox3 Lib "User32.dll" Alias "MessageBox" ( _
		ByVal hWnd As Integer, ByVal txt As String, ByVal caption As String, ByVal typ As Integer ) _
	As Integer

End Class 'LibWrap


Public Class MsgBoxSample
	Public Shared Sub Main()
	
		LibWrap.MsgBox( 0, "Correct text", "MsgBox Sample", 0 )
		LibWrap.MsgBox2( 0, "Incorrect text", "MsgBox Sample", 0 )
		
		Try
			LibWrap.MsgBox3( 0, "No such function", "MsgBox Sample", 0 )
		Catch e As EntryPointNotFoundException
			Console.WriteLine( "EntryPointNotFoundException thrown as expected!" )
		End Try
	
	End Sub 'Main
End Class 'MsgBoxSample
