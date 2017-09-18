// Copyright
// Microsoft Corporation
// All rights reserved

// Arrays.cs

using System;
using System.Runtime.InteropServices;

/*
typedef struct _MYPOINT
{
	int x; 
	int y; 
} MYPOINT;
*/

[ StructLayout( LayoutKind.Sequential )]
public struct MyPoint 
{
	public int x; 
	public int y;
	public MyPoint( int x, int y )
	{
		this.x = x;
		this.y = y;
	}
}

/*
typedef struct _MYPERSON
{
	char* first; 
	char* last; 
} MYPERSON;
*/

[ StructLayout( LayoutKind.Sequential, CharSet=CharSet.Ansi )]
public struct MyPerson 
{
	public String first; 
	public String last;
	public MyPerson( String first, String last )
	{
		this.first = first;
		this.last = last;
	}
}

public class LibWrap
{
	// this way array size can't be changed and array can be copied back
	
	// int TestArrayOfInts(int* pArray, int pSize)	
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestArrayOfInts([In, Out] int[] array, int size );
	
	// this way we could change array size, but array can't be copied back
	// since marshaler doesn't know resulting size, we must do this manually
	
	// int TestRefArrayOfInts(int** ppArray, int* pSize)	
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestRefArrayOfInts( ref IntPtr array, ref int size );	
	
	// int TestMatrixOfInts(int pMatrix[][COL_DIM], int row)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestMatrixOfInts([In, Out] int[,] pMatrix, int row );	
	
	// int TestArrayOfStrings(char** ppStrArray, int size)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestArrayOfStrings( [In, Out] String[] stringArray, int size );	
	
	// int TestArrayOfStructs(MYPOINT* pPointArray, int size)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestArrayOfStructs([In, Out] MyPoint[] pointArray, int size );	
	
	// without [In, Out] strings will not be copied out
	
	// int TestArrayOfStructs2(MYPERSON* pPersonArray, int size)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern int TestArrayOfStructs2( [In, Out] MyPerson[] personArray, int size );		
}


public class App
{
	public static void Main()
	{
		// *************** array ByVal ********************************
		int[] array1 = new int[ 10 ];
		
		Console.WriteLine( "Integer array passed ByVal before call:" );
		for( int i = 0; i < array1.Length; i++ )
		{
			array1[ i ] = i;
			Console.Write( " " + array1[ i ] );
		}
			
		int sum1 = LibWrap.TestArrayOfInts( array1, array1.Length );
		
		Console.WriteLine( "\nSum of elements:" + sum1 );
		Console.WriteLine( "\nInteger array passed ByVal after call:" );
		
		foreach( int i in array1 )
		{
			Console.Write( " " + i );
		}	
		
		// *************** array ByRef ********************************
		int[] array2 = new int[ 10 ];
		int size = array2.Length;
		
		Console.WriteLine( "\n\nInteger array passed ByRef before call:" );
		for( int i = 0; i < array2.Length; i++ )
		{
			array2[ i ] = i;
			Console.Write( " " + array2[ i ] );
		}
				
		IntPtr buffer = Marshal.AllocCoTaskMem( Marshal.SizeOf( size ) * array2.Length );
		Marshal.Copy( array2, 0, buffer, array2.Length );
		
		int sum2 = LibWrap.TestRefArrayOfInts( ref buffer, ref size );
		Console.WriteLine( "\nSum of elements:" + sum2 );	
		
		if( size > 0 )
		{
			int[] arrayRes = new int[ size ];
			Marshal.Copy( buffer, arrayRes, 0, size );
			Marshal.FreeCoTaskMem( buffer );
			
			Console.WriteLine( "\nInteger array passed ByRef after call:" );
			foreach( int i in arrayRes )
			{
				Console.Write( " " + i );
			}	
		}
		else
			Console.WriteLine( "\nArray after call is empty" );	
			
		// *************** matrix ByVal ********************************
		const int DIM = 5;
		int[,] matrix = new int[ DIM, DIM ];
		
		Console.WriteLine( "\n\nMatrix before call:" );
		for( int i = 0; i < DIM; i++ )
		{
			for( int j = 0; j < DIM; j++ )
			{
				matrix[ i, j ] = j;
				Console.Write( " " + matrix[ i, j ] );
			}
			Console.WriteLine( "" );
		}
			
		int sum3 = LibWrap.TestMatrixOfInts( matrix, DIM );
		Console.WriteLine( "\nSum of elements:" + sum3 );
			
		Console.WriteLine( "\nMatrix after call:" );
		for( int i = 0; i < DIM; i++ )
		{
			for( int j = 0; j < DIM; j++ )
			{
				Console.Write( " " + matrix[ i, j ] );
			}
			Console.WriteLine( "" );
		}
		
		// *************** string array ByVal ********************************
		String[] strArray = { "one", "two", "three", "four", "five" };
		
		Console.WriteLine( "\n\nString array before call:" );
		foreach( String s in strArray )
			Console.Write( " "+ s );
			
		int lenSum = LibWrap.TestArrayOfStrings( strArray, strArray.Length );
		Console.WriteLine( "\nSum of string lengths:" + lenSum );
			
		Console.WriteLine( "\nString array after call:" );
		foreach( String s in strArray )
		{
			Console.Write( " " + s );
		}	
		
		// *************** struct array ByVal ********************************
		MyPoint[] points = { new MyPoint(1,1), new MyPoint(2,2), new MyPoint(3,3) };
		
		Console.WriteLine( "\n\nPoints array before call:" );
		foreach( MyPoint p in points )
			Console.WriteLine( "x = {0}, y = {1}", p.x, p.y );
			
		int allSum = LibWrap.TestArrayOfStructs( points, points.Length );
		Console.WriteLine( "\nSum of points:" + allSum );
			
		Console.WriteLine( "\nPoints array after call:" );
		foreach( MyPoint p in points )
			Console.WriteLine( "x = {0}, y = {1}", p.x, p.y );		
			
		// *************** struct with strings array ByVal *************************
		MyPerson[] persons = { new MyPerson( "Kim", "Akers" ), 
			new MyPerson( "Adam", "Barr" ), new MyPerson( "Jo","Brown" )};
		
		Console.WriteLine( "\n\nPersons array before call:" );
		foreach( MyPerson pe in persons )
			Console.WriteLine( "first = {0}, last = {1}", pe.first, pe.last );
			
		int namesSum = LibWrap.TestArrayOfStructs2( persons, persons.Length );
		Console.WriteLine( "\nSum of name lengths:" + namesSum );
			
		Console.WriteLine( "\n\nPersons array after call:" );
		foreach( MyPerson pe in persons )
			Console.WriteLine( "first = {0}, last = {1}", pe.first, pe.last );							
	}
}


