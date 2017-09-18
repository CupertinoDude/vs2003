// Copyright
// Microsoft Corporation
// All rights reserved

// FindFile.cs

using System;
using System.Runtime.InteropServices;

/*
typedef struct _WIN32_FIND_DATA 
{
  DWORD    dwFileAttributes; 
  FILETIME ftCreationTime; 
  FILETIME ftLastAccessTime; 
  FILETIME ftLastWriteTime; 
  DWORD    nFileSizeHigh; 
  DWORD    nFileSizeLow; 
  DWORD    dwReserved0; 
  DWORD    dwReserved1; 
  TCHAR    cFileName[ MAX_PATH ]; 
  TCHAR    cAlternateFileName[ 14 ]; 
} WIN32_FIND_DATA, *PWIN32_FIND_DATA; 
*/

[ StructLayout( LayoutKind.Sequential, CharSet=CharSet.Auto )]
public class FindData 
{
	public int	fileAttributes = 0;
	
	// creationTime was embedded FILETIME structure
	public int	creationTime_lowDateTime = 0 ;
	public int	creationTime_highDateTime = 0;
	
	// lastAccessTime was embedded FILETIME structure
	public int	lastAccessTime_lowDateTime = 0;
	public int	lastAccessTime_highDateTime = 0;
	
	// lastWriteTime was embedded FILETIME structure
	public int	lastWriteTime_lowDateTime = 0;
	public int	lastWriteTime_highDateTime = 0;
	
	public int	nFileSizeHigh = 0;
	public int	nFileSizeLow = 0;
	public int	dwReserved0 = 0;
	public int	dwReserved1 = 0;
	
	[ MarshalAs( UnmanagedType.ByValTStr, SizeConst=256 )]
	public String	fileName = null;
	
	[ MarshalAs( UnmanagedType.ByValTStr, SizeConst=14 )]
	public String	alternateFileName = null;
}

public class LibWrap
{
	//HANDLE FindFirstFile(LPCTSTR lpFileName, LPWIN32_FIND_DATA lpFindFileData);
	
	[ DllImport( "Kernel32.dll", CharSet=CharSet.Auto )]
	public static extern IntPtr FindFirstFile( String fileName, [ In, Out ] FindData findFileData );
}

public class App
{
	public static void Main()
	{
		FindData fd = new FindData();
		IntPtr handle = LibWrap.FindFirstFile( "C:\\*.*", fd );
		
		Console.WriteLine( "The first file: {0}", fd.fileName );
	}
}


