// Copyright
// Microsoft Corporation
// All rights reserved

// Void.cs

using System;
using System.Text;
using System.Runtime.InteropServices;

public class LibWrap
{
	public enum DataType 
	{
		DT_I2 = 1,
		DT_I4,
		DT_R4,
		DT_R8,
		DT_STR
	}
	
	// void SetData(DataType typ, void* object)
	// using AsAny when void* is expected
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void SetData( DataType t, 
		[ MarshalAs( UnmanagedType.AsAny )] Object o );
	
	// using overloading when void* is expected
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll", EntryPoint="SetData" )]
	public static extern void SetData2( DataType t, ref double i );			
	
	[ DllImport( "..\\LIB\\PinvokeLib.dll", EntryPoint="SetData" )]
	public static extern void SetData2( DataType t, String s );	
	
}

public class App
{
	public static void Main()
	{
		Console.WriteLine( "Calling SetData using AsAny... \n" );
		
		LibWrap.SetData( LibWrap.DataType.DT_I2, (short)12 );
		LibWrap.SetData( LibWrap.DataType.DT_I4, (long)12 );
		LibWrap.SetData( LibWrap.DataType.DT_R4, (float)12 );
		LibWrap.SetData( LibWrap.DataType.DT_R8, (double)12 );
		LibWrap.SetData( LibWrap.DataType.DT_STR, "abcd" );	
		
		Console.WriteLine( "\nCalling SetData using overloading... \n" );	
			
		double d = 12;
		LibWrap.SetData2( LibWrap.DataType.DT_R8, ref d );
		LibWrap.SetData2( LibWrap.DataType.DT_STR, "abcd" );
	}
}


