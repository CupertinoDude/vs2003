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

' CustomReader: Implement the interface IResourceReader.
' CustomManager: Sub-class ResourceManager and create
' ResourceSets using the CustomReader class.


Imports System
Imports System.Collections
Imports System.Globalization
Imports System.Resources

Imports Microsoft.VisualBasic



Class CustomReader
Implements IResourceReader

    Public Sub Close() Implements IResourceReader.Close
        ' Close any open files, DB connections, etc here.
    End Sub

    Function IEnumerable_GetEnumerator() As IEnumerator Implements IEnumerable.GetEnumerator
        IEnumerable_GetEnumerator = Me.GetEnumerator()
    End Function

    Sub IDisposable_Dispose() Implements IDisposable.Dispose
    End Sub

    Public Function GetEnumerator() As IDictionaryEnumerator Implements IResourceReader.GetEnumerator

        Dim dict As Hashtable = new Hashtable()

        dict("key1") = "value 1"
        dict("key2") = "value 2"
        dict("key3") = "value 3"

        GetEnumerator = dict.GetEnumerator()
    End Function

End Class



Public Class CustomManager
Inherits ResourceManager


    Protected Overrides Function InternalGetResourceSet( _
        culture As CultureInfo, _
        createIfNotExists As Boolean, _
        tryParents As Boolean ) As ResourceSet

        InternalGetResourceSet = new ResourceSet( new CustomReader() )
    End Function



    Public shared Sub Main()
        Dim my_resourceManager As ResourceManager = new CustomManager()
        Console.WriteLine( "Lookup for key1 yields: " + my_resourceManager.GetString("key1") )

        Console.WriteLine (ControlChars.CrLf + "Press Return to exit.")
        Console.Read()
    End Sub

End Class

