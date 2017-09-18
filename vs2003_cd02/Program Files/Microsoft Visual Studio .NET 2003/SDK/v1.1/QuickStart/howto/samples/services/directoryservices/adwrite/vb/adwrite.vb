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

Public Class ADWrite
    Public Shared Sub Main()
        If Environment.GetCommandLineArgs().Length <> 4 Then
            Console.WriteLine("Usage: " + Environment.GetCommandLineArgs()(0) + " <ad_path> <property> <value>")
            Console.WriteLine ()
            Console.WriteLine ("Press Enter to continue...")
            Console.ReadLine()
            Exit Sub
        End If

        Dim adPath as String = Environment.GetCommandLineArgs()(1)
        Dim propertyName As String = Environment.GetCommandLineArgs()(2)
        Dim newValue as string  = Environment.GetCommandLineArgs()(3)

        Dim objDirEnt As DirectoryEntry = new DirectoryEntry(adPath)
        Console.WriteLine("Name            = " + objDirEnt.Name)
        Console.WriteLine("Path            = " + objDirEnt.Path)
        Console.WriteLine("SchemaClassName = " + objDirEnt.SchemaClassName)
        Console.WriteLine(propertyName + " = " + objDirEnt.Properties(propertyName)(0).ToString())
        Console.WriteLine("... changing to ")

        objDirEnt.Properties(propertyName)(0) = newValue
        objDirEnt.CommitChanges()
        Console.WriteLine(propertyName + " = " + objDirEnt.Properties(propertyName)(0).ToString())
    End Sub
End Class