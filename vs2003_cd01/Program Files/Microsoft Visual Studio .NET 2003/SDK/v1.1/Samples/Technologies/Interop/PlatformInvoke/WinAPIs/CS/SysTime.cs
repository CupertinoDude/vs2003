// Copyright
// Microsoft Corporation
// All rights reserved

// SysTime.cs

using System;
using System.Runtime.InteropServices;

/*
typedef struct _SYSTEMTIME { 
    WORD wYear; 
    WORD wMonth; 
    WORD wDayOfWeek; 
    WORD wDay; 
    WORD wHour; 
    WORD wMinute; 
    WORD wSecond; 
    WORD wMilliseconds; 
} SYSTEMTIME, *PSYSTEMTIME; 
*/

[ StructLayout( LayoutKind.Sequential )]
public class SystemTime 
{
	public ushort year; 
	public ushort month;
	public ushort dayOfWeek; 
	public ushort day; 
	public ushort hour; 
	public ushort minute; 
	public ushort second; 
	public ushort milliseconds; 
}

public class LibWrap 
{
	// VOID GetSystemTime(LPSYSTEMTIME lpSystemTime)
	[ DllImport( "Kernel32.dll" )]
	public static extern void GetSystemTime([ In, Out ] SystemTime st );
}

public class App
{
	public static void Main()
	{
		SystemTime st = new SystemTime();

		LibWrap.GetSystemTime( st );

		Console.Write( "The Date and Time is: " );
		Console.Write( "{0:00}/{1:00}/{2} at ", st.month, st.day, st.year );
		Console.WriteLine( "{0:00}:{1:00}:{2:00}", st.hour, st.minute, st.second ); 
	}
}