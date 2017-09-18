' Copyright
' Microsoft Corporation
' All rights reserved

' Unions.vb

Imports System
Imports System.Runtime.InteropServices

'union MYUNION
'{
'    int number;
'    double d;
'}

< StructLayout( LayoutKind.Explicit )> _
Public Structure MyUnion

	< FieldOffset( 0 )> Public i As Integer
	< FieldOffset( 0 )> Public d As Double
	
End Structure 'MyUnion

'union MYUNION2
'{
'    int i;
'    char str[128];
'};

< StructLayout( LayoutKind.Explicit, Size := 128 )> _
Public Structure MyUnion2_1

	< FieldOffset( 0 )> Public i As Integer
	
End Structure 'MyUnion2_1

< StructLayout( LayoutKind.Sequential )> _
Public Structure MyUnion2_2

	< MarshalAs( UnmanagedType.ByValTStr, SizeConst := 128 )> _
	Public str As String
	
End Structure 'MyUnion2_2

Public Class LibWrap
   
	' void TestUnion(MYUNION u, int type)
	
	Declare Sub TestUnion Lib "..\LIB\PinvokeLib.dll" ( ByVal u As MyUnion, ByVal type As Integer )
	
	' void TestUnion(MYUNION u, int type)
	
	Overloads Declare Sub TestUnion2 Lib "..\LIB\PinvokeLib.dll" ( _
		ByVal u As MyUnion2_1, ByVal type As Integer )
	
	' void TestUnion(MYUNION u, int type)
	
	Overloads Declare Sub TestUnion2 Lib "..\LIB\PinvokeLib.dll" ( _
		ByVal u As MyUnion2_2, ByVal type As Integer )

End Class 'LibWrap

Public Class App
	Public Shared Sub Main()
	
		Dim mu As New MyUnion()
		mu.i = 99
		LibWrap.TestUnion( mu, 1 )
		
		mu.d = 99.99
		LibWrap.TestUnion( mu, 2 )
		
		Dim mu2_1 As New MyUnion2_1()
		mu2_1.i = 99
		LibWrap.TestUnion2( mu2_1, 1 )
		
		Dim mu2_2 As New MyUnion2_2()
		mu2_2.str = "*** string ***"
		LibWrap.TestUnion2( mu2_2, 2 )
		
	End Sub 'Main
End Class 'App
