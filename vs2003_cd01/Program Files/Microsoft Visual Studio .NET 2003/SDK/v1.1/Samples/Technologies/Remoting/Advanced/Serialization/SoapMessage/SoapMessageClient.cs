/*=====================================================================

  File:      SoapMessageClient.cs

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
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Soap;

namespace Foo
{
    public class SoapMessageClient
    {
        public static void Main(string[] args)
        {
            SOAPMessageToStream();
            StreamToSOAPMessage();
        }

        public static void SOAPMessageToStream()
        {
            Console.WriteLine("SOAPMessageToStream\n");
            SoapMessage soapMessage = new SoapMessage();
            
            soapMessage.XmlNameSpace = "Some-URI";
            soapMessage.MethodName = "GetLastTradePrice";
            soapMessage.ParamNames = new String[] {"symbol"};
            soapMessage.ParamValues = new Object[] {"DIS"};

            soapMessage.Headers = new Header[1];
            soapMessage.Headers[0] = new Header("Transaction", "tip://www.microsoft.com/?oletx-0000000-0000-0000-0000-000000000001");

            SoapFormatter formatter = new SoapFormatter();
            formatter.TopObject = soapMessage;

            MemoryStream stream = new MemoryStream();
            StreamWriter tw = new StreamWriter(stream);
            formatter.Serialize(stream, soapMessage);
            tw.Flush();

            stream.Position = 0;
            StreamReader sr = new StreamReader(stream);
            String line;
            while ((line = sr.ReadLine()) != null)
            {
                Console.WriteLine(line);
            }

            Console.WriteLine("\n");
        }

        public static void StreamToSOAPMessage()
        {
            Console.WriteLine("SOAPStreamToSOAPMessage\n");

            SoapFormatter formatter = new SoapFormatter();
            MemoryStream stream = new MemoryStream();

            StreamWriter tw = new StreamWriter(stream);
            tw.Write("<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\"");
            tw.Write(" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">");
            tw.Write("<SOAP-ENV:Body>");
            tw.Write("<m:GetLastTradePrice xmlns:m=\"Some-URI\">");
            tw.Write("<symbol>DIS</symbol>");
            tw.Write("</m:GetLastTradePrice>");
            tw.Write("</SOAP-ENV:Body>");
            tw.Write("</SOAP-ENV:Envelope>");
            tw.Flush();
            stream.Position = 0;

            SoapMessage soapMessage = new SoapMessage();
            formatter.TopObject = soapMessage;
            soapMessage = (SoapMessage)formatter.Deserialize(stream);

            String xmlNameSpace = soapMessage.XmlNameSpace;
            Console.WriteLine("XmlNameSpace "+ xmlNameSpace);
            
            String methodName = soapMessage.MethodName;
            Console.WriteLine("methodName "+methodName);

            Object[] parameters = soapMessage.ParamValues;

            for (int i=0; i<parameters.Length; i++)
                Console.WriteLine("param "+i+" "+parameters[i]);

            Console.WriteLine("\n");
        }
    }
}

