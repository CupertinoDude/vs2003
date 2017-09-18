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
Imports System.DirectoryServices

Public Class ADRead
        public shared sub Main()
        if(Environment.GetCommandLineArgs().Length<>2)
            Console.WriteLine("Usage: " & Environment.GetCommandLineArgs()(0) & " <ad_path>")
            Console.WriteLine ()
            Console.WriteLine ("Press Enter to continue...")
            Console.ReadLine()
            exit sub
        end if

        Dim objDirEnt As DirectoryEntry = new DirectoryEntry(Environment.GetCommandLineArgs(1))
        Console.WriteLine("Name            = " & objDirEnt.Name)
        Console.WriteLine("Path            = " & objDirEnt.Path)
        Console.WriteLine("SchemaClassName = " & objDirEnt.SchemaClassName)
        Console.WriteLine("")
        Console.WriteLine("Properties:")

        Dim tab As string = "    "
        Dim Key As String
        Dim objValue as object

        For Each Key In objDirEnt.Properties.PropertyNames
            Console.Write(tab & Key & " = ")
            Console.WriteLine("")
            For Each objValue In objDirEnt.Properties(Key)
                    Console.WriteLine(tab & tab & objValue.ToString())
            next objValue
        Next
    End Sub
End Class