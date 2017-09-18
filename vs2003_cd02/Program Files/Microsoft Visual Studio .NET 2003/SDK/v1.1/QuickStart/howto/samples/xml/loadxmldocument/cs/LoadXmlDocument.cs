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

public class LoadXmlDocumentSample
{
    private const String document = "books.xml";

    public static void Main()
    {
        LoadXmlDocumentSample myLoadXmlDocumentSample = new LoadXmlDocumentSample();
        myLoadXmlDocumentSample.Run(document);
    }

    public void Run(String args)
    {
        try
        {
            // Load the XML from file
            Console.WriteLine ();
            Console.WriteLine ("Loading file {0} ...", args);

            XmlDataDocument myXmlDocument = new XmlDataDocument();
            myXmlDocument.Load (args);

            Console.WriteLine ("XmlDataDocument loaded with XML data successfully ...");
            
            // Display the XML document.
            myXmlDocument.Save(Console.Out);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

} // End class LoadXmlDocumentSample
} // End namespace HowTo.Samples.XML
