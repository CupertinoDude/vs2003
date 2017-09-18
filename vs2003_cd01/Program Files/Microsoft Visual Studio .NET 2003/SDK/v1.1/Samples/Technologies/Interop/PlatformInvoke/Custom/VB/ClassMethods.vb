' Copyright
' Microsoft Corporation
' All rights reserved

' ClassMethods.vb

Imports System
Imports System.Text
Imports Microsoft.VisualBasic
Imports System.Runtime.InteropServices

Public Class LibWrap
	
	' class PINVOKELIB_API CTestClass 
	' {
	' public:
	'	CTestClass( void );
	'	int DoSomething( int i );
	' private:
	'	int m_member;
	' };	
	 
	< DllImport( "..\\LIB\\PinvokeLib.dll", _ 
	EntryPoint:="?DoSomething@CTestClass@@QAEHH@Z", _
	CallingConvention:=CallingConvention.ThisCall )> _
	Shared Function TestThisCalling ( _
		ByVal ths As IntPtr, ByVal i As Integer ) As Integer
	End Function	
	
	' CTestClass* CreateTestClass();
	
	Declare Function CreateTestClass Lib "..\LIB\PinvokeLib.dll" () As IntPtr	
	
	' void DeleteTestClass( CTestClass* instance )
	
	Declare Sub DeleteTestClass Lib "..\LIB\PinvokeLib.dll" ( ByVal instance As IntPtr )
	
End Class 'LibWrap

Public Class App
	Public Shared Sub Main()
	
		Dim instancePtr As IntPtr = LibWrap.CreateTestClass()
		
		Dim res As Integer = LibWrap.TestThisCalling( instancePtr, 9 )
		Console.WriteLine( ControlChars.CrLf + "Result: {0}", res )
		
		LibWrap.DeleteTestClass( instancePtr )
		
	End Sub 'Main
End Class 'App


