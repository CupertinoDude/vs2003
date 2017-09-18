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
Imports System.Text.RegularExpressions

Namespace Samples
    Public Class RegExMatcher
        Shared Sub Main()
            Dim digitregex As Regex = new Regex("(?<digit>[0-9])")
            Dim Before As String = "Here is so4848me te88xt with emb4493edded numbers."
            Dim Args As String() = Environment.GetCommandLineArgs()
            
            If Args.Length > 1
                Before = String.Join(" ", Args, 1, Args.Length - 1)
            End If
            
            Dim After As String = DigitRegex.Replace(Before, "")

            System.Console.WriteLine("Before: " & Before)
            System.Console.WriteLine("After : " & After)

            System.Console.WriteLine()
            System.Console.WriteLine("Press Enter to Continue...")
            System.Console.ReadLine()
        End Sub
    End Class
End Namespace