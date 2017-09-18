' Copyright
' Microsoft Corporation
' All rights reserved

' ActiveDir.vb

Imports System
Imports System.Text
Imports System.Runtime.InteropServices
Imports System.Threading

'typedef struct 
'{
'	DWORD           cbStruct;
'	HWND            hwndOwner;
'	LPCWSTR         pszCaption;
'	LPCWSTR         pszTitle;
'	LPCWSTR         pszRoot; 
'	LPWStr          pszPath;
'	ULONG           cchPath;
'	DWORD           dwFlags;
'	BFFCALLBACK     pfnCallback;
'	LPARAM          lParam;
'	DWORD           dwReturnFormat;
'	LPCWSTR         pUserName;
'	LPCWSTR         pPassword;
'	LPWStr          pszObjectClass;
'	ULONG           cchObjectClass;
'} DSBROWSEINFOW, *PDSBROWSEINFOW;

' all strings in structure will be marshaled as LPWStr
< StructLayout( LayoutKind.Sequential, CharSet := CharSet.Unicode )> _
Public Structure DSBrowseInfo

	Public structSize As Integer
	Public dlgOwner As IntPtr
	
	Public dlgCaption As String
	Public treeViewTitle As String
	Public rootPath As String
	
	' in/out string must be declared as String in struct/class, 
	' not as StringBuilder
	Public path As String
	Public pathSize As Integer 
	
	Public flags As Integer 
	Public callback As IntPtr
	Public lParam As IntPtr
	Public returnFormat As Integer 
	
	Public userName As String
	Public password As String
	
	Public objectClass As String
	Public objectClassSize As Integer
	
End Structure 'DSBrowseInfo

Public Class LibWrap
   
	'int DsBrowseForContainer(PDSBROWSEINFO pInfo)
	
	Declare Unicode Function DsBrowseForContainerW Lib "dsuiext.dll" ( _
		ByRef info As DSBrowseInfo ) As Integer
   
	Public Shared DSBI_ENTIREDIRECTORY As Integer = &H90000
   
End Class 'LibWrap

Class App

	Public Shared MAX_PATH As Integer = 256
	
	' DsBrowseForContainerW should be called from STA, but STA is default in VB.NET
	' so we don't need to specify it explicitly like in C#
	Public Shared Sub Main()
	
		' initialize all members
		Dim dsbi As New DSBrowseInfo()
		
		dsbi.structSize = Marshal.SizeOf( dsbi )
		dsbi.dlgCaption = "The container picker"
		dsbi.treeViewTitle = "Pick a container for this example."
		
		dsbi.path = New String( New Char( MAX_PATH ) {}) 
		dsbi.pathSize = dsbi.path.Length 
		dsbi.flags = LibWrap.DSBI_ENTIREDIRECTORY
		
		dsbi.objectClass = New String( New Char( MAX_PATH ) {})
		dsbi.objectClassSize = dsbi.objectClass.Length 
		
		Console.WriteLine( "Call DSBrowseForContainer..." )
		
		Dim status As Integer = LibWrap.DsBrowseForContainerW( dsbi )
		
		Console.WriteLine( "The status is " & status )
		
		If status = 1 Then
			Console.WriteLine( "The path is " + dsbi.path )
		Else
			Console.WriteLine( "Call failed!" )
		End If
		
	End Sub 'Main
	
End Class 'App
