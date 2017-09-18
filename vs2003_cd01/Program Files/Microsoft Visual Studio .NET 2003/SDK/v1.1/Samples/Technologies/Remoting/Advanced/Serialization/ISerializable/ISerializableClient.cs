/*=====================================================================

  File:      ISerializable.cs

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
using System.Runtime.Serialization.Formatters.Soap;
using System.Security.Permissions;

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
        ExampleFoo fooOut = new ExampleFoo();
        fooOut.i = 1;
        fooOut.j = 20;
        fooOut.k = 50;

        Console.WriteLine("i: {0}", fooOut.i);
        Console.WriteLine("j: {0}", fooOut.j);
        Console.WriteLine("k: {0}", fooOut.k);

        IFormatter objFormatterToStream = new SoapFormatter();
        Stream toStream = new FileStream("myFoo.xml", FileMode.Create, FileAccess.Write, FileShare.None);
        objFormatterToStream.Serialize(toStream, fooOut);
        toStream.Close();
    }

    public static void FromFile()
    {
        Console.WriteLine("FromFile");
        //Then you can read it back in with code like this:
        IFormatter objFormatterFromStream = new SoapFormatter();
        Stream fromStream = new FileStream("myFoo.xml", FileMode.Open, FileAccess.Read, FileShare.Read);
        ExampleFoo fooIn = (ExampleFoo) objFormatterFromStream.Deserialize(fromStream);
        fromStream.Close();

        Console.WriteLine("i: {0}", fooIn.i);
        Console.WriteLine("j: {0}", fooIn.k);
        Console.WriteLine("k: {0}", fooIn.k);
    }
}


[Serializable]
public class ExampleFoo : ISerializable 
{
    public int i, j, k;

    public ExampleFoo()
    {
    }

    internal ExampleFoo(SerializationInfo si, StreamingContext context) 
    {
        //Restore our scalar values.
        i = si.GetInt32("i");
        j = si.GetInt32("j");
        k = si.GetInt32("k");
    }

    [SecurityPermissionAttribute(SecurityAction.LinkDemand,SerializationFormatter=true)]
    public void GetObjectData(SerializationInfo si, StreamingContext context) 
    {
        //SerializationInfo is essentially a property bag.

        //Add our three scalar values;
        si.AddValue("i", i);
        si.AddValue("j", j);
        si.AddValue("k", k);

        Type t = this.GetType();
        si.AddValue("TypeObj", t);
    }
}
