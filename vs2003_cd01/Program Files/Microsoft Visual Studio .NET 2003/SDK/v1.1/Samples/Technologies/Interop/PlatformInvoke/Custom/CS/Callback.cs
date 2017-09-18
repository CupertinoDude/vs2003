// Copyright
// Microsoft Corporation
// All rights reserved

// Callback.cs

using System;
using System.Runtime.InteropServices;

public delegate bool FPtr( int value );
public delegate bool FPtr2( String value );

public class LibWrap
{
	//void TestCallBack(FPTR pf, int value)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void TestCallBack( FPtr cb, int value );	
	
	//void TestCallBack2(FPTR2 pf2, char* value)
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void TestCallBack2( FPtr2 cb2, String value );	
		
}

public class App
{
	public static void Main()
	{
		// If delagate will be used just inside one call, this syntax
		// is ok since platform invoke will protect delegate from GC
		// until call ends. If unmanaged side could store delegate and
		// try to use it later than caller should protect delegate until
		// unmanaged side is finished.
		
		FPtr cb = new FPtr( App.DoSomething );
		LibWrap.TestCallBack( cb, 99 );
		
		FPtr2 cb2 = new FPtr2( App.DoSomething2 );
		LibWrap.TestCallBack2( cb2, "abc" );		
	}
	
	public static bool DoSomething( int value )
	{
		Console.WriteLine( "\nCallback called with param: {0}", value );	
		if( value < 0 )
			return false;
		else
			return true;
	}
	
	public static bool DoSomething2( String value )
	{
		Console.WriteLine( "\nCallback called with param: {0}", value );	
		if( value.Length < 99 )
			return false;
		else
			return true;
	}	
}


