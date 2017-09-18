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
Imports System.Collections
Imports System.Globalization
Imports System.Web
Imports System.Web.UI

Namespace CustomParsingControlSamples

    Public Class CustomParse2ControlBuilderVB : Inherits ControlBuilder

       Public Overrides Function GetChildControlType(TagName As String, Attributes As IDictionary) As Type

          If String.Compare(TagName, "customitem", true, CultureInfo.InvariantCulture) = 0
             Return GetType(CustomParsingControlSamples.ItemVB)
          End If

          Return Nothing
       End Function
    End Class

    <ControlBuilderAttribute(GetType(CustomParse2ControlBuilderVB))> Public Class CustomParse2VB : Inherits Control

       Private _items As New ArrayList
       Private _selectedIndex As Integer = 0

       Public Property SelectedIndex As Integer
           Get
              Return _selectedIndex
           End Get
           Set
              _selectedIndex = Value
           End Set
       End Property

       Protected Overrides Sub AddParsedSubObject(Obj As Object)

           If (TypeOf Obj Is ItemVB)
              _items.Add(Obj)
           End If
       End Sub

       Protected Overrides Sub Render(Output As HtmlTextWriter)

           If (SelectedIndex < _items.Count)
              Dim SelectedItem As ItemVB = CType(_items(SelectedIndex), ItemVB)
              Output.Write(SelectedItem.Message)
           End If
       End Sub

    End Class

End Namespace