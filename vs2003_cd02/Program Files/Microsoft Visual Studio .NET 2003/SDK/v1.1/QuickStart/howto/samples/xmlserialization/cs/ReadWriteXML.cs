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

using System.Xml.Serialization;
using System.IO;
using XmlSerializationHowTo;

public class Test {
    public static void Main(string[] args) {
        XmlSerializer serializer = new XmlSerializer(typeof(PurchaseOrder));

        TextReader reader = new StreamReader("..\\PurchaseOrder.xml");
        PurchaseOrder po = (PurchaseOrder)serializer.Deserialize(reader);
        reader.Close();

        TextWriter writer = new StreamWriter("PurchaseOrder2.xml");
        serializer.Serialize(writer, po);
        writer.Close();
    }
}
