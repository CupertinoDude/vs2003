// Copyright
// Microsoft Corporation
// All rights reserved

// Errors.cs

using System;
using System.Text;
using System.Runtime.InteropServices;

public class LibWrap
{
	// int MessageBox(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType)
	
	[ DllImport( "User32.dll", SetLastError=true )]
	public static extern int MessageBox( IntPtr hWnd, String text, String caption, int type );
	
	// DWORD FormatMessage(DWORD dwFlags, LPCVOID lpSource, DWORD dwMessageId, 
	//						DWORD dwLanguageId, LPTSTR lpBuffer, DWORD nSize, 
	//						va_list *Arguments)
	
	[ DllImport( "Kernel32.dll" )]
	public static extern int FormatMessage( int flags, IntPtr source, int messageId,
						int languageId, StringBuilder buffer, int size, IntPtr arguments );	
						
	public const int FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;						
}


public class App
{
	public static void Main()
	{
		int errCode = Marshal.GetLastWin32Error();
		Console.WriteLine( "\nThe last error before MessageBox is called: {0}", errCode );
		
		Console.WriteLine( "Calling MessageBox with wrong parameters..." );
		int res = LibWrap.MessageBox( IntPtr.Zero, "Correct text", "PInvoke MsgBox Sample", 999 );
		Console.WriteLine( "Call result: {0}", res );
		
		errCode = Marshal.GetLastWin32Error();
		Console.WriteLine( "The last error after MessageBox is called: {0}", errCode );
		
		StringBuilder buffer = new StringBuilder( 256 );
		LibWrap.FormatMessage( LibWrap.FORMAT_MESSAGE_FROM_SYSTEM, IntPtr.Zero, errCode, 0, 
			buffer, buffer.Capacity, IntPtr.Zero );
		Console.WriteLine( "Error message: {0}", buffer );
	}
}


