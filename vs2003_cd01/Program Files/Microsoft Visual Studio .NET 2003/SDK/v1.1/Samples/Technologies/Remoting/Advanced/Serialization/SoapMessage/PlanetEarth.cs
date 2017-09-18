/*=====================================================================

  File:      PlanetEarth.cs

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
using System.Runtime.Remoting.Metadata;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Soap;


namespace PlanetEarth
{
    [Serializable]
    [SoapType(Embedded=true)]
    public class Person
    {
        public String FirstName;
        public String LastName;
        public int age;
    }

    [Serializable]
    [SoapType(Embedded=true)]
    public class Animal
    {
        [SoapField(XmlNamespace="urn:cities.org", XmlElementName="SpeciesName")]			
        public String Name;

        [SoapField(XmlNamespace="urn:cities.org", XmlElementName="Extinct")]			
        public bool Extinct;
    }

    public class Client
    {
        public static void Main(string[] args)
        {
            PersonToXml();
            AnimalToXml();

            PersonSOAPMessageToStream();
            StreamToPersonSOAPMessage();
        }

        public static void PersonToXml()
        {
            Console.WriteLine("PersonToXml\n");

            Person person = new Person();
            person.FirstName = "Bill";
            person.LastName = "Gates";
            person.age = 43;

            SoapFormatter formatter = new SoapFormatter();

            formatter.TopObject = null;

            MemoryStream stream = new MemoryStream();
            StreamWriter tw = new StreamWriter(stream);
            formatter.Serialize(stream, person);
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

        public static void AnimalToXml()
        {
            Console.WriteLine("AnimalToXml\n");

            Animal animal = new Animal();
            animal.Name = "Lion";
            animal.Extinct = false;

            SoapFormatter formatter = new SoapFormatter();

            formatter.TopObject = null;

            MemoryStream stream = new MemoryStream();
            StreamWriter tw = new StreamWriter(stream);
            formatter.Serialize(stream, animal);
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

        public static void PersonSOAPMessageToStream()
        {
            Console.WriteLine("PersonSOAPMessageToStream\n");

            Person person = new Person();
            person.FirstName = "John";
            person.LastName = "Smith";
            person.age = 43;

            SoapMessage soapMessage = new SoapMessage();

            soapMessage.XmlNameSpace = "Some-URI";
            soapMessage.MethodName = "SendPerson";
            soapMessage.ParamNames = new String[] {"person"};
            soapMessage.ParamValues = new Object[] {person};

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

        public static void StreamToPersonSOAPMessage()
        {
            Console.WriteLine("StreamToPersonSOAPMessage\n");

            SoapFormatter formatter = new SoapFormatter();
            MemoryStream stream = new MemoryStream();

            StreamWriter tw = new StreamWriter(stream);
            tw.Write("<SOAP-ENV:Envelope xmlns:xsi=\"http://http://www.w3.org/2000/10/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2000/10/XMLSchema\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:a1=\"http://schemas.microsoft.com/clr/nsassem/PlanetEarth/PlanetEarth\" xmlns:i3=\"Some-URI\">");
            tw.Write("<SOAP-ENV:Header>");
            tw.Write("<Transaction xsi:type=\"SOAP-ENC:string\" SOAP-ENC:mustUnderstand=\"1\" root=\"1\">tip://www.microsoft.com/?oletx-0000000-0000-0000-0000-000000000001</Transaction>");
            tw.Write("</SOAP-ENV:Header>");
            tw.Write("<SOAP-ENV:Body>");
            tw.Write("<i3:SendPerson id=\"ref-1\">");
            tw.Write("<person xsi:type=\"a1:Person\">");
            tw.Write("<FirstName id=\"ref-5\">John</FirstName>");
            tw.Write("<LastName id=\"ref-6\">Smith</LastName>");
            tw.Write("<age>43</age>");
            tw.Write("</person>");
            tw.Write("</i3:SendPerson>");
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







