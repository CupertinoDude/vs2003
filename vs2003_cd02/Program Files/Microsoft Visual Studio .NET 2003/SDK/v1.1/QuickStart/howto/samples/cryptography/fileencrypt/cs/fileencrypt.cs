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
using System.IO;
using System.Security.Cryptography;
using System.Text;

class FileEncrypt {

    public static Byte[] ConvertStringToByteArray(String s)
    {
    	return (new UnicodeEncoding()).GetBytes(s);
    }

    public static void Main()
    {
        //Creating a file stream
        FileStream fs  = new FileStream("EncryptedFile.txt",FileMode.Create,FileAccess.Write);

        Console.WriteLine("Enter Some Text to be stored in encrypted file:");
        String strinput = Console.ReadLine();

        Byte[] bytearrayinput=ConvertStringToByteArray(strinput);

        //DES instance with random key
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        //create DES Encryptor from this instance
        ICryptoTransform desencrypt = des.CreateEncryptor();

        //Create Crypto Stream that transforms file stream using des encryption
        CryptoStream cryptostream = new CryptoStream(fs,desencrypt,CryptoStreamMode.Write);

        //write out DES encrypted file
        cryptostream.Write(bytearrayinput,0,bytearrayinput.Length);

        cryptostream.Close();

        //create file stream to read encrypted file back
        FileStream fsread = new FileStream("EncryptedFile.txt",FileMode.Open,FileAccess.Read);

        //create DES Decryptor from our des instance
        ICryptoTransform desdecrypt = des.CreateDecryptor();

        //create crypto stream set to read and do a des decryption transform on incoming bytes
        CryptoStream cryptostreamDecr = new CryptoStream(fsread,desdecrypt,CryptoStreamMode.Read);
        //print out the contents of the decrypted file
        Console.WriteLine( (new StreamReader(cryptostreamDecr, new UnicodeEncoding())).ReadToEnd() );

        Console.WriteLine ();
        Console.WriteLine ("Press Enter to continue...");
        Console.ReadLine();
   }
}
