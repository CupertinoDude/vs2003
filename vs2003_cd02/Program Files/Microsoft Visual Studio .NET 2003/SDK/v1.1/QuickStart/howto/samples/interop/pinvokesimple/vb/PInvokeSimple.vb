'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

imports System
imports System.Text
imports Microsoft.VisualBasic
imports System.Runtime.InteropServices

<StructLayout(LayoutKind.Sequential)> Public Structure SystemTime
	Public wYear As Short
	Public wMonth As Short
	Public wDayOfWeek As Short
	Public wDay As Short
	Public wHour As Short
	Public wMinute As Short
	Public wSecond As Short
	Public wMiliseconds As Short
End Structure


Public Class Win32
	Declare Auto Sub GetSystemTime Lib "Kernel32.dll"(ByRef sysTime As SystemTime)

	Declare Auto Function MsgBox Lib "User32.dll" Alias "MessageBox" _
	(hWnd As Integer, txt As String, caption As String, Typ As Integer) As Integer
End Class

Public Class TestPInvoke
	Public Shared Sub Main()
        	Dim sysTime As New SystemTime()
        	Win32.GetSystemTime(sysTime)

        	Dim dt As String
        	dt = String.Format("System time is: Year: {0} Month: {1} DayOfWeek: {2} Day: {3}", _
        	    sysTime.wYear, _
        	    sysTime.wMonth, _
        	    sysTime.wDayOfWeek, _
        	    sysTime.wDay)

                Win32.MsgBox(0, dt, "Platform Invoke Sample", 0)
	End Sub
End Class


