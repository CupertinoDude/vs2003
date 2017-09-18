// Copyright
// Microsoft Corporation
// All rights reserved

// MsgBox.cs

using System;
using System.Runtime.InteropServices;

public class LibWrap 
{
	// int MessageBox(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType);
	
	[ DllImport( "User32.dll", EntryPoint="MessageBox", CharSet=CharSet.Auto )]
	public static extern int MsgBox( int hWnd, String text, String caption, uint type );
	
	// this will cause incorrect output in message window
	
	[ DllImport( "User32.dll", EntryPoint="MessageBoxW", CharSet=CharSet.Ansi )]
	public static extern int MsgBox2( int hWnd, String text, String caption, uint type );	
	
	// this will cause an exception
	
	[ DllImport( "User32.dll", EntryPoint="MessageBox", CharSet=CharSet.Ansi, ExactSpelling=true )]
	public static extern int MsgBox3( int hWnd, String text, String caption, uint type );	
}

public class MsgBoxSample
{
	public static void Main()
	{
		LibWrap.MsgBox( 0, "Correct text", "MsgBox Sample", 0 );
		LibWrap.MsgBox2( 0, "Incorrect text", "MsgBox Sample", 0 );
		try
		{
			LibWrap.MsgBox3( 0, "No such function", "MsgBox Sample", 0 );
		}
		catch( EntryPointNotFoundException )
		{
			Console.WriteLine( "EntryPointNotFoundException thrown as expected!" );
		}
	}
}


