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

Imports System
Imports System.IO
Imports System.Collections
Imports System.Runtime.Serialization
Imports System.Runtime.Serialization.Formatters.Binary

Namespace ClassLibrary1
    Public Class SerializeTest
        Public Shared Sub Main()
            Console.WriteLine("Create object graph")
            Dim l As New ArrayList
            Dim x As Integer
            For x = 0 To 9
                Console.WriteLine(x)
                l.Add(x)
            Next x
            Console.Write("Serializing object graph to disk..")
            Dim s As Stream = File.Open("foo.bin", FileMode.Create, FileAccess.ReadWrite)
            Dim b As BinaryFormatter = New BinaryFormatter
            b.Serialize(s, l)
            s.Close()
            Console.WriteLine("Complete.")

            Console.Write("Deserializing object graph from disk..")
            Dim r As Stream = File.Open("foo.bin", FileMode.Open, FileAccess.Read)
            Dim c As New BinaryFormatter
            Dim p As ArrayList = CType(c.Deserialize(r), ArrayList)
            Console.WriteLine("Complete.")
            Dim i As Object
            For Each i In p
                Console.WriteLine(i)
            Next i

            r.Close()

            Console.WriteLine(Microsoft.VisualBasic.ControlChars.CrLf & "Press Return to exit.")
            Console.Read()
        End Sub
    End Class
End Namespace
