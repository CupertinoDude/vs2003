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

public class SaveXmlDocumentSample
{
    public static void Main()
    {
        String document = Environment.CurrentDirectory + "\\books.xml";
        String updatedDocument = 
            Environment.GetEnvironmentVariable("TEMP") + "\\updatebooksCS.xml";

        String[] args = {document, updatedDocument};
        SaveXmlDocumentSample mySaveXmlDocumentSample = new SaveXmlDocumentSample();
        mySaveXmlDocumentSample.Run(args);
    }

    public void Run(String[] args)
    {
        try
        {
            // Create XmlDocument and load the XML from file
            XmlDocument myXmlDocument = new XmlDocument();
            myXmlDocument.Load (new XmlTextReader (args[0]));
            Console.WriteLine ("XmlDocument loaded with XML data successfully ...");
            Console.WriteLine();

            IncreasePrice(myXmlDocument.DocumentElement);

            // Write out data as XML
            myXmlDocument.Save(args[1]);
            Console.WriteLine();
            Console.WriteLine("Updated prices saved in file {0}", args[1]);
        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

    public void IncreasePrice(XmlNode node)
    {
        if (node.Name == "price")
        {
            node = node.FirstChild;
            Decimal price = Decimal.Parse(node.Value);
            // Increase all the book prices by 2%
            String newprice = ((Decimal)price*(new Decimal(1.02))).ToString("#.00");
            Console.WriteLine("Old Price = " + node.Value + "\tNew price = " + newprice);
            node.Value = newprice;
        }

        node = node.FirstChild;
        while (node != null)
        {
            IncreasePrice(node);
            node = node.NextSibling;
        }
    }

} // End class SaveXmlDocumentSample
} // End namespace HowTo.Samples.XML
