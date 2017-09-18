'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System.Xml.Serialization
Imports System.IO
Imports XmlSerializationHowTo

public Class Test
	Shared Sub Main()
        Dim serializer as XmlSerializer
        serializer = new XmlSerializer(GetType(PurchaseOrder))

        Dim reader as TextReader
        reader = new StreamReader("..\PurchaseOrder.xml")

        Dim po as PurchaseOrder
        po = CType(serializer.Deserialize(reader), PurchaseOrder)

        reader.Close

        Dim writer as TextWriter
        writer = new StreamWriter("PurchaseOrder2.xml")

        serializer.Serialize(writer, po)
        writer.Close()
	End Sub
End Class
