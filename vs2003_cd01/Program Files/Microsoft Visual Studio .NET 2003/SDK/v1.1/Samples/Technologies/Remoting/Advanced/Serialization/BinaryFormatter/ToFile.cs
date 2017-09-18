/*=====================================================================

  File:      ToFile.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Binary;

[Serializable]
public class MyDataType
{
    public int n1;
    public int n2;
    public String str;
}

public class Sample
{
    public static void Main()
    {
        ToFile();
        FromFile();
    }

    public static void ToFile()
    {
        Console.WriteLine("ToFile");
        MyDataType dataOut = new MyDataType();
        dataOut.n1 = 1;
        dataOut.n2 = 24;
        dataOut.str = "Some String";

        Console.WriteLine("n1: {0}", dataOut.n1);
        Console.WriteLine("n2: {0}", dataOut.n2);
        Console.WriteLine("str: {0}", dataOut.str);

        IFormatter objFormatterToStream = new BinaryFormatter();
        Stream toStream = new FileStream("myDataFile.bin", FileMode.Create, FileAccess.Write, FileShare.None);
        objFormatterToStream.Serialize(toStream, dataOut);
        toStream.Close();
    }

    public static void FromFile()
    {
        Console.WriteLine("FromFile");
        //Then you can read it back in with code like this:
        IFormatter objFormatterFromStream = new BinaryFormatter();
        Stream fromStream = new FileStream("myDataFile.bin", FileMode.Open, FileAccess.Read, FileShare.Read);
        MyDataType dataIn = (MyDataType) objFormatterFromStream.Deserialize(fromStream);
        fromStream.Close();

        Console.WriteLine("n1: {0}", dataIn.n1);
        Console.WriteLine("n2: {0}", dataIn.n2);
        Console.WriteLine("str: {0}", dataIn.str);
    }
}
