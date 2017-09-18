// Copyright
// Microsoft Corporation
// All rights reserved

// Strings.cs

using System;
using System.Text;
using System.Runtime.InteropServices;

/*
typedef struct _MYSTRSTRUCT
{
	wchar_t* buffer;
	UINT size; 
} MYSTRSTRUCT;
*/

[ StructLayout( LayoutKind.Sequential, CharSet=CharSet.Unicode )]
public struct MyStrStruct 
{	
	public String buffer;
	public int size;
}

/*
typedef struct _MYSTRSTRUCT2
{
	char* buffer;
	UINT size; 
} MYSTRSTRUCT2;
*/

[ StructLayout( LayoutKind.Sequential, CharSet=CharSet.Ansi )]
public struct MyStrStruct2 
{	
	public String buffer;
	public int size;
}

public class LibWrap
{
	// char* TestStringAsResult()
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern String TestStringAsResult();	
	
	// void TestStringInStruct(MYSTRSTRUCT* pStruct)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void TestStringInStruct( ref MyStrStruct mss );			
	
	//void TestStringInStructAnsi(MYSTRSTRUCT2* pStruct)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void TestStringInStructAnsi( ref MyStrStruct2 mss );		
}

public class App
{
	public static void Main()
	{
		// ************** string as result ********************************
		String str = LibWrap.TestStringAsResult();
		Console.WriteLine( "\nString returned: {0}", str );
		
		// ************* pass Unicode string ***********
		
		// initialize buffer and append something to the end so whole
		// buffer is passed to unmanaged side
		
		StringBuilder buffer = new StringBuilder( "content", 100 ); 
		buffer.Append( (char)0 );
		buffer.Append( '*', buffer.Capacity - 8 );
		
		MyStrStruct mss;
		mss.buffer = buffer.ToString();
		mss.size = mss.buffer.Length;
		
		LibWrap.TestStringInStruct( ref mss );
		
		Console.WriteLine( "\nBuffer after Unicode function call: {0}", mss.buffer );		
		
		// ************* pass Ansi string *********************
		StringBuilder buffer2 = new StringBuilder( "content", 100 ); 
		buffer2.Append( (char)0 );
		buffer2.Append( '*', buffer2.Capacity - 8 );
		
		MyStrStruct2 mss2;
		mss2.buffer = buffer2.ToString();
		mss2.size = mss2.buffer.Length;
		
		LibWrap.TestStringInStructAnsi( ref mss2 );
		
		Console.WriteLine( "\nBuffer after Ansi function call: {0}", mss2.buffer );			
	}
}


