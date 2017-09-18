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



Imports System
Imports System.Runtime.InteropServices


' <doc>
' <desc>
'        Declare native function to determine drive type
' </desc>
' </doc>
'
Public Class PlatformInvokeKernel32
    Public Declare Auto Function GetDriveType Lib "KERNEL32" (ByVal lpRootPathName As String) As Integer
    Public Shared DRIVE_FIXED As Integer = 3
End Class

