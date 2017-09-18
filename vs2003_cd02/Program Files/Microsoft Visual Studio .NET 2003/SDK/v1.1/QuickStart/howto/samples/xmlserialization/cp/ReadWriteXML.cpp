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

// This is the main project file for VC++ application project 
// generated using an Application Wizard.

#using <mscorlib.dll>
#using <System.Xml.dll>
#using "PurchaseOrder.dll"


using namespace System;
using namespace System::Xml::Serialization;
using namespace System::IO;
using namespace XmlSerializationHowTo;

// This is the entry point for this application
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{
   XmlSerializer * serializer = new XmlSerializer(__typeof(PurchaseOrder));

   TextReader * reader = new StreamReader(S"..\\PurchaseOrder.xml");
   PurchaseOrder * po = __try_cast<PurchaseOrder*>(serializer->Deserialize(reader));
   reader->Close();

   TextWriter * writer = new StreamWriter(S"PurchaseOrder2.xml");
   serializer->Serialize(writer, po);
   writer->Close();
   return 0;
}
