' Copyright
' Microsoft Corporation
' All rights reserved

' Arrays.vb

Imports System
Imports Microsoft.VisualBasic
Imports System.Runtime.InteropServices

'typedef struct _MYPOINT
'{
'	int x; 
'	int y; 
'} MYPOINT;

< StructLayout( LayoutKind.Sequential )> _
Public Structure MyPoint
	Public x As Integer
	Public y As Integer
	
	Public Sub New( x As Integer, y As Integer )
		Me.x = x
		Me.y = y
	End Sub 'New
End Structure 'MyPoint

'typedef struct _MYPERSON
'{
'	char* first; 
'	char* last; 
'} MYPERSON;

< StructLayout( LayoutKind.Sequential, CharSet:=CharSet.Ansi )> _
Public Structure MyPerson
	Public first As String
	Public last As String
	
	Public Sub New( first As String, last As String )
		Me.first = first
		Me.last = last
	End Sub 'New
End Structure 'MyPerson


Public Class LibWrap
   
	' this way array size can't be changed and array can be copied back
	'int TestArrayOfInts(int* pArray, int pSize)
		
	Declare Function TestArrayOfInts Lib "..\LIB\PinvokeLib.dll" ( _
		<[In], Out> ByVal myArray() As Integer, ByVal size As Integer ) As Integer
   
	'this way we could change array size, but array can't be copied back
	'since marshaler doesn't know resulting size, we must do this manually
	'int TestRefArrayOfInts(int** ppArray, int* pSize)
   	
	Declare Function TestRefArrayOfInts Lib "..\LIB\PinvokeLib.dll" ( _
		ByRef myArray As IntPtr, ByRef size As Integer ) As Integer
   
	'int TestMatrixOfInts(int pMatrix[][COL_DIM], int row)
	
	Declare Function TestMatrixOfInts Lib "..\LIB\PinvokeLib.dll" ( _
		<[In], Out> ByVal matrix(,) As Integer, ByVal row As Integer ) As Integer
   
	'int TestArrayOfStrings(char** ppStrArray, int size)
	
	Declare Function TestArrayOfStrings Lib "..\LIB\PinvokeLib.dll" ( _
		<[In], Out> ByVal strArray() As String, ByVal size As Integer ) As Integer
	
	'int TestArrayOfStructs(MYPOINT* pPointArray, int size)
	
	Declare Function TestArrayOfStructs Lib "..\LIB\PinvokeLib.dll" ( _
		<[In], Out> ByVal pointArray() As MyPoint, ByVal size As Integer ) As Integer
	
	'without [In, Out] strings will not be copied out
	'int TestArrayOfStructs2(MYPERSON* pPersonArray, int size)
	
	Declare Function TestArrayOfStructs2 Lib "..\LIB\PinvokeLib.dll" ( _
		<[In], Out> ByVal personArray() As MyPerson, ByVal size As Integer ) As Integer
		
End Class 'LibWrap


Public Class App
	Public Shared Sub Main()
	
		' *************** array ByVal ********************************
		Dim array1(9) As Integer
		
		Console.WriteLine( "Integer array passed ByVal before call:" )
		Dim i As Integer
		
		For i = 0 To array1.Length - 1
			array1(i) = i
			Console.Write( " " & array1(i) )
		Next i
		
		Dim sum1 As Integer = LibWrap.TestArrayOfInts( array1, array1.Length )
		Console.WriteLine( ControlChars.CrLf & "Sum of elements:" & sum1 )
		
		Console.WriteLine( ControlChars.CrLf & "Integer array passed ByVal after call:" )
		
		For Each i In  array1
			Console.Write( " " & i )
		Next i
      
		' *************** array ByRef ********************************
		Dim array2(9) As Integer
		Dim arraySize As Integer = array2.Length
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & _
			"Integer array passed ByRef before call:" )
			
		For i = 0 To array2.Length - 1
			array2(i) = i
			Console.Write( " " & array2(i) )
		Next i
		
		Dim buffer As IntPtr = Marshal.AllocCoTaskMem( Marshal.SizeOf( arraySize ) * array2.Length )
		Marshal.Copy( array2, 0, buffer, array2.Length )
		
		Dim sum2 As Integer = LibWrap.TestRefArrayOfInts( buffer, arraySize )
		Console.WriteLine( ControlChars.CrLf & "Sum of elements:" & sum2 )
		
		If arraySize > 0 Then
			Dim arrayRes( arraySize - 1 ) As Integer
			Marshal.Copy( buffer, arrayRes, 0, arraySize )
			Marshal.FreeCoTaskMem( buffer )
			
			Console.WriteLine( ControlChars.CrLf & "Integer array passed ByRef after call:" )
			For Each i In  arrayRes
				Console.Write( " " & i )
			Next i
		Else
			Console.WriteLine( ControlChars.CrLf & "Array after call is empty" )
		End If
		 
		' *************** matrix ByVal ********************************
		Const [DIM] As Integer = 4
		Dim matrix([DIM], [DIM]) As Integer
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & "Matrix before call:" )
		For i = 0 To [DIM]
			Dim j As Integer
			For j = 0 To [DIM]
				matrix(i, j) = j
				Console.Write( " " & matrix(i, j) )
			Next j
			Console.WriteLine( "" )
		Next i
      
		Dim sum3 As Integer = LibWrap.TestMatrixOfInts( matrix, [DIM] + 1 )
		Console.WriteLine( ControlChars.CrLf & "Sum of elements:" & sum3 )
		
		Console.WriteLine( ControlChars.CrLf & "Matrix after call:" )
		For i = 0 To [DIM]
			Dim j As Integer
			For j = 0 To [DIM]
				Console.Write( " " & matrix(i, j) )
			Next j
			Console.WriteLine( "" )
		Next i
      
		' *************** string array ByVal ********************************
		Dim strArray As String() =  { "one", "two", "three", "four", "five" }
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & "String array before call:" )
		Dim s As String
		For Each s In  strArray
			Console.Write( " " & s )
		Next s 
		
		Dim lenSum As Integer = LibWrap.TestArrayOfStrings( strArray, strArray.Length )
		Console.WriteLine( ControlChars.CrLf & "Sum of string lengths:" & lenSum )
		
		Console.WriteLine( ControlChars.CrLf & "String array after call:" )
		For Each s In  strArray
			Console.Write( " " & s )
		Next s
      
		' *************** struct array ByVal ********************************
		Dim points As MyPoint() = { New MyPoint(1, 1), New MyPoint(2, 2), New MyPoint(3, 3) }
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & "Points array before call:" )
		Dim p As MyPoint
		For Each p In  points
			Console.WriteLine( "x = {0}, y = {1}", p.x, p.y )
		Next p 
		
		Dim allSum As Integer = LibWrap.TestArrayOfStructs( points, points.Length )
		Console.WriteLine( ControlChars.CrLf & "Sum of points:" & allSum )
		
		Console.WriteLine( ControlChars.CrLf & "Points array after call:" )
		For Each p In  points
			Console.WriteLine( "x = {0}, y = {1}", p.x, p.y )
		Next p 
		
      ' *************** struct with strings array ByVal ********************************
		Dim persons As MyPerson() =  { New MyPerson( "Kim", "Akers" ), _
										New MyPerson( "Adam", "Barr" ), _
										New MyPerson( "Jo", "Brown" )}
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & "Persons array before call:" )
		Dim pe As MyPerson
		For Each pe In  persons
			Console.WriteLine( "first = {0}, last = {1}", pe.first, pe.last )
		Next pe 
		
		Dim namesSum As Integer = LibWrap.TestArrayOfStructs2( persons, persons.Length )
		Console.WriteLine( ControlChars.CrLf & "Sum of name lengths:" & namesSum )
		
		Console.WriteLine( ControlChars.CrLf & ControlChars.CrLf & "Persons array after call:" )
		For Each pe In  persons
			Console.WriteLine( "first = {0}, last = {1}", pe.first, pe.last )
		Next pe
		
	End Sub 'Main
End Class 'App 
