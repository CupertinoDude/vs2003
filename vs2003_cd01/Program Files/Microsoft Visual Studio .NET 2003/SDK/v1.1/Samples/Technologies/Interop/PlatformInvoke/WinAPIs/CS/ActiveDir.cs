// Copyright
// Microsoft Corporation
// All rights reserved

// ActiveDir.cs

using System;
using System.Text;
using System.Runtime.InteropServices;
using System.Threading;

/*
typedef struct 
{
	DWORD           cbStruct;
	HWND            hwndOwner;
	LPCWSTR         pszCaption;
	LPCWSTR         pszTitle;
	LPCWSTR         pszRoot;
	LPWStr          pszPath;
	ULONG           cchPath;
	DWORD           dwFlags;
	BFFCALLBACK     pfnCallback;
	LPARAM          lParam;
	DWORD           dwReturnFormat;
	LPCWSTR         pUserName;
	LPCWSTR         pPassword;
	LPWStr          pszObjectClass;
	ULONG           cchObjectClass;
} DSBROWSEINFOW, *PDSBROWSEINFOW;
*/

// all strings in structure will be marshaled as LPWStr
[ StructLayout( LayoutKind.Sequential, CharSet=CharSet.Unicode )]
public struct DSBrowseInfo
{
	public int structSize;
	public IntPtr dlgOwner;
	
	public string dlgCaption;
	public string treeViewTitle;
	public string rootPath;
	
	// in/out string must be declared as String in struct/class, 
	// not as StringBuilder
	public string path;	
	public int pathSize;
	
	public int flags;
	public IntPtr callback;
	public IntPtr lParam;
	public int returnFormat;
	
	public string userName;
	public string password;
	
	public string objectClass;
	public int objectClassSize;
};

public class LibWrap
{
	//int DsBrowseForContainer(PDSBROWSEINFO pInfo);
	
	[ DllImport( "dsuiext.dll", CharSet=CharSet.Unicode )]
	public static extern int DsBrowseForContainerW( ref DSBrowseInfo info );

	public const int DSBI_ENTIREDIRECTORY = 0x00090000;	
}

class App
{
	public const int MAX_PATH = 256;

	// Must be marked as STA since default is MTA. DsBrowseForContainerW calls 
	// CoInitialize, which initializes the COM library as STA.
	
	[ STAThread ]
	public static void Main()
	{
		// initialize all members
		DSBrowseInfo dsbi = new DSBrowseInfo();
		
		dsbi.structSize = Marshal.SizeOf( dsbi );
		dsbi.dlgCaption = "The container picker";
		dsbi.treeViewTitle = "Pick a container for this example.";
		
		dsbi.path = new string( new char[ MAX_PATH ]);
		dsbi.pathSize = dsbi.path.Length;
		
		dsbi.flags = LibWrap.DSBI_ENTIREDIRECTORY;
		
		dsbi.objectClass = new string( new char[ MAX_PATH ]);
		dsbi.objectClassSize = dsbi.objectClass.Length;

		Console.WriteLine( "Call DSBrowseForContainer..." );
		
		int status = LibWrap.DsBrowseForContainerW( ref dsbi );
		
		Console.WriteLine( "The status is " + status );
		if( status == 1 )
		{
			Console.WriteLine( "The path is " + dsbi.path );
		}
		else 
		{
			Console.WriteLine( "Call failed!" );
		}
	}
}
