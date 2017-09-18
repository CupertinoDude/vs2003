// Copyright
// Microsoft Corporation
// All rights reserved

// ClassMethods.cs

using System;
using System.Text;
using System.Runtime.InteropServices;

public class LibWrap
{
	/*
	class PINVOKELIB_API CTestClass 
	{
	public:
		CTestClass( void );
		int DoSomething( int i );
	private:
		int m_member;
	};	
	*/
	 
	[ DllImport( "..\\LIB\\PinvokeLib.dll", 
	EntryPoint="?DoSomething@CTestClass@@QAEHH@Z", 
	CallingConvention=CallingConvention.ThisCall )]
	public static extern int TestThisCalling( IntPtr ths, int i );	
	
	// CTestClass* CreateTestClass();
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern IntPtr CreateTestClass();	
	
	// void DeleteTestClass( CTestClass* instance )
	[ DllImport( "..\\LIB\\PinvokeLib.dll" )]
	public static extern void DeleteTestClass( IntPtr instance );	
}

public class App
{
	public static void Main()
	{
		IntPtr instancePtr = LibWrap.CreateTestClass();
		
		int res = LibWrap.TestThisCalling( instancePtr, 9 );	
		Console.WriteLine( "\nResult: {0} \n", res );
		
		LibWrap.DeleteTestClass( instancePtr );
	}
}


