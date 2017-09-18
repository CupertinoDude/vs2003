//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Runtime.InteropServices;

[StructLayout(LayoutKind.Sequential)]
public struct SystemTime
{
	public ushort wYear;
	public ushort wMonth;
	public ushort wDayOfWeek;
	public ushort wDay;
	public ushort wHour;
	public ushort wMinute;
	public ushort wSecond;
	public ushort wMiliseconds;
}

public class Win32
{
        [DllImport("Kernel32.dll")]
        public static extern void GetSystemTime(ref SystemTime sysTime);

        [DllImport("User32.dll", EntryPoint="MessageBox", CharSet=CharSet.Auto)]
        public static extern int MsgBox(int hWnd, String text, String caption, uint type);
}

public class TestPInvoke
{
        public static void Main()
        {
        	SystemTime sysTime = new SystemTime();
        	Win32.GetSystemTime(ref sysTime);

        	String date = String.Format("System time is: \nYear: {0}\nMonth: {1}\nDayOfWeek: {2}\nDay: {3}",
        	    sysTime.wYear,
        	    sysTime.wMonth,
        	    sysTime.wDayOfWeek,
        	    sysTime.wDay);

                Win32.MsgBox(0, date, "PInvoke Sample", 0);
        }
}
