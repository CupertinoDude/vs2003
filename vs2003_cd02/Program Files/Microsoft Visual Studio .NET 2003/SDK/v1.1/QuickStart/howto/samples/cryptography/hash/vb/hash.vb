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
Imports System.IO
Imports System.Security
Imports System.Security.Cryptography
Imports System.Text


Public Class HashTest


    Public Shared Function ConvertStringToByteArray(s As [String]) As [Byte]()
        Return (New UnicodeEncoding()).GetBytes(s)
    End Function 'ConvertStringToByteArray


    Public Shared Sub Main()
        Dim s1, s2 As [String]


        Console.WriteLine("Enter String 1 To Hash:")
        s1 = Console.ReadLine()
        Console.WriteLine("Enter String 2 To Hash:")
        s2 = Console.ReadLine()
        Dim data1ToHash As [Byte]() = ConvertStringToByteArray(s1)
        Dim data2ToHash As [Byte]() = ConvertStringToByteArray(s2)
        Dim hashvalue1 As Byte() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(data1ToHash)


        Console.WriteLine(("Hash Value of String 1:" + BitConverter.ToString(hashvalue1)))
        Dim hashvalue2 As Byte() = New MD5CryptoServiceProvider().ComputeHash(data2ToHash)


        Console.WriteLine(("Hash Value of String 2:" + BitConverter.ToString(hashvalue2)))
        Dim i As Integer = 0
        Dim same As Boolean = True


        Do
            If hashvalue1(i) <> hashvalue2(i) Then
                same = False
                Exit Do
            End If
            i += 1
        Loop While i < hashvalue1.Length
        If same Then

            Console.WriteLine("The hash values of String 1 and String 2 are the same!")
        Else
            Console.WriteLine("The hash values of String 1 and String 2 are not the same!")

        End If
        Console.Write("Please Press Return to continue")
        s1 = Console.ReadLine()
    End Sub 'Main

End Class 'HashTest
