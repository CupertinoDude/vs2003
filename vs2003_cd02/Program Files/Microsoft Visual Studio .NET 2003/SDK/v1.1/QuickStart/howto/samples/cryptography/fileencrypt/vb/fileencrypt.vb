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
Imports System.Security.Cryptography
Imports System.Text

Class FileEncrypt
    Public Shared Function ConvertStringToByteArray(s As [String]) As [Byte]()
        Return (New UnicodeEncoding()).GetBytes(s)
    End Function 'ConvertStringToByteArray


    Public Shared Sub Main()
        Dim fs As New FileStream("EncryptedFile.txt", FileMode.Create, FileAccess.Write)

        'Creating a file stream

        Console.WriteLine("Enter Some Text to be stored in encrypted file:")
        Dim strinput As [String] = Console.ReadLine()
        Dim bytearrayinput As [Byte]() = ConvertStringToByteArray(strinput)
        'DES instance with random key
        Dim des As New DESCryptoServiceProvider()
        'create DES Encryptor from this instance
        Dim desencrypt As ICryptoTransform = des.CreateEncryptor()
        'Create Crypto Stream that transforms file stream using des encryption
        Dim cryptostream As New CryptoStream(fs, desencrypt, CryptoStreamMode.Write)
        'write out DES encrypted file
        cryptostream.Write(bytearrayinput, 0, bytearrayinput.Length)

        cryptostream.Close()
        'create file stream to read encrypted file back
        Dim fsread As New FileStream("EncryptedFile.txt", FileMode.Open, FileAccess.Read)
        'create DES Decryptor from our des instance
        Dim desdecrypt As ICryptoTransform = des.CreateDecryptor()
        'create crypto stream set to read and do a des decryption transform on incoming bytes
        Dim cryptostreamDecr As New CryptoStream(fsread, desdecrypt, CryptoStreamMode.Read)
        'print out the contents of the decrypted file
        Console.WriteLine(New StreamReader(cryptostreamDecr, New UnicodeEncoding()).ReadToEnd())

        Console.WriteLine ()
        Console.WriteLine ("Press Enter to continue...")
        Console.ReadLine()
    End Sub 'Main
End Class 'FileEncrypt
