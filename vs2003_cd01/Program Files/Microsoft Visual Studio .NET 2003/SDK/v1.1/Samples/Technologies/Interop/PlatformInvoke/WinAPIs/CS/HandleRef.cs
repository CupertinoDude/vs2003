// Copyright
// Microsoft Corporation
// All rights reserved

// HandleRef.cs

using System;
using System.IO;
using System.Text;
using System.Runtime.InteropServices;

/*
typedef struct _OVERLAPPED { 
    ULONG_PTR  Internal; 
    ULONG_PTR  InternalHigh; 
    DWORD  Offset; 
    DWORD  OffsetHigh; 
    HANDLE hEvent; 
} OVERLAPPED; 
*/

// declared as structure
[ StructLayout( LayoutKind.Sequential )]
public struct Overlapped
{
	public IntPtr intrnal;
	public IntPtr internalHigh;
	public int offset;
	public int offsetHigh;
	public IntPtr hEvent;
}

// declared as class
[ StructLayout( LayoutKind.Sequential )]
public class Overlapped2
{
	public IntPtr intrnal;
	public IntPtr internalHigh;
	public int offset;
	public int offsetHigh;
	public IntPtr hEvent;
}

public class LibWrap
{
    // to prevent FileStream to be GC-ed before call ends, 
    // its handle should be wrapped in HandleRef
    
	// since Overlapped is struct, null can't be passed instead, 
	// we must declare overload method if we will use this     
    
    //BOOL ReadFile(HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead,
    //				LPDWORD lpNumberOfBytesRead, LPOVERLAPPED lpOverlapped);    
    
	[ DllImport( "Kernel32.dll" )]
	public static extern bool ReadFile( 
		HandleRef hndRef, 
		StringBuilder buffer, 
		int numberOfBytesToRead, 
		out int numberOfBytesRead, 
		ref Overlapped flag );
	    
	[ DllImport( "Kernel32.dll" )]
	public static extern bool ReadFile(
		HandleRef hndRef, 
		StringBuilder buffer, 
		int numberOfBytesToRead, 
		out int numberOfBytesRead, 
		int flag );	// int instead of structure reference
			
	// since Overlapped2 is class, we can pass null as parameter,
	// no overload is needed	
										
	[ DllImport( "Kernel32.dll", EntryPoint="ReadFile" )]
	public static extern bool ReadFile2(
		HandleRef hndRef, 
		StringBuilder buffer, 
		int numberOfBytesToRead, 
		out int numberOfBytesRead,
		Overlapped2 flag );
}

public class App
{
	public static void Main()
	{
        FileStream fs = new FileStream( "HandleRef.txt", FileMode.Open );
        HandleRef hr = new HandleRef( fs, fs.Handle );
        StringBuilder buffer = new StringBuilder( 5 );
        int read = 0;
        
        // platform invoke will hold reference to HandleRef until call ends
        
        LibWrap.ReadFile( hr, buffer, 5, out read, 0 );
        Console.WriteLine( "Read with struct parameter: {0}", buffer );
        
        LibWrap.ReadFile2( hr, buffer, 5, out read, null );
        Console.WriteLine( "Read with class parameter: {0}", buffer );
	}
}


