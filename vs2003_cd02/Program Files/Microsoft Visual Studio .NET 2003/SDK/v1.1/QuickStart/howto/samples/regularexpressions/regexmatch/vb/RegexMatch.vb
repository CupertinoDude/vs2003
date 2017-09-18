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
            Dim Args As String() = System.Environment.GetCommandLineArgs()
            Dim EmailRegex As Regex = New Regex("(?<user>[^@]+)@(?<host>.+)")
            Dim S As String = "johndoe@tempuri.org"

            If Args.Length > 1
                S = Args(1)
            End If

            Dim M As Match = EmailRegex.Match(S)

            If M.Success
                System.Console.WriteLine("User: " & M.Groups("user").Value)
                System.Console.WriteLine("Host: " & M.Groups("host").Value)
            Else
                System.Console.WriteLine(s & " is not a valid email address")
            End If

            System.Console.WriteLine()
            System.Console.WriteLine("Press Enter to Continue...")
            System.Console.ReadLine()
        End Sub
    End Class
End Namespace