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

namespace HowTo.Samples.XML
{

using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;

public class XmlReadWriteSchemaSample
{
    //Schema to read from
    private const String document = "sample.xsd";

    public static void Main()
    {
        XmlReadWriteSchemaSample myXmlReadWriteSchemaSample = new XmlReadWriteSchemaSample();
        myXmlReadWriteSchemaSample.Run(document);
    }

    public void Run(String args)
    {

        try
        {
            //Create a stringwriter for output
            StringWriter myStringWriter = new StringWriter();
            XmlTextWriter myXmlWriter = new XmlTextWriter(myStringWriter);
            myXmlWriter.Formatting = Formatting.Indented;
            myXmlWriter.Indentation = 2;

            //Read the Schema
            Console.WriteLine("Reading schema {0} ...", args);
            Console.WriteLine();
            XmlSchema mySchema = XmlSchema.Read(new XmlTextReader(args), null);

            //Write the Schema
            Console.WriteLine("Writing schema {0} ...", args);
            Console.WriteLine();
            mySchema.Write(myXmlWriter);
            Console.WriteLine(myStringWriter.ToString());

        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }

    }
} // End class XmlReadWriteSchemaSample
} // End namespace HowTo.Samples.XML
