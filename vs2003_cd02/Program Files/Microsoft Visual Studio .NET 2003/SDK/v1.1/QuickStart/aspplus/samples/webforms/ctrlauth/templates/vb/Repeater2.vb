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
Imports System.Web
Imports System.Web.UI

Namespace TemplateControlSamplesVB

    <ParseChildren(true)> Public Class Repeater2VB : Inherits Control : Implements INamingContainer

        Private _itemTemplate As ITemplate = Nothing
        Private _dataSource As ICollection = Nothing
        Private _repeaterItems As RepeaterItemCollectionVB = Nothing

        Public Property DataSource As ICollection
            Get
               Return _dataSource
            End Get
            Set
               _dataSource = Value
            End Set
        End Property

        <TemplateContainer(GetType(RepeaterItemVB))> public Property ItemTemplate As ITemplate
            Get
               return _itemTemplate
            End Get
            Set
               _itemTemplate = value
            End Set
        End Property

        Public ReadOnly Property Items As RepeaterItemCollectionVB
            Get
                return _repeaterItems
            End Get
        End Property

        ' override to prevent literal controls from being added as children
        Protected Overrides Sub AddParsedSubObject(O As Object)
        End Sub

        ' override to create repeated items
        Protected Overrides Sub CreateChildControls()
            Dim O As Object = ViewState("NumItems")
            If Not (O Is Nothing)
               ' clear any existing child controls
               Controls.Clear()

                Dim I As Integer
                Dim Items As New ArrayList
                Dim NumItems As Integer = CInt(O)
                For I = 0 To NumItems - 1
                    ' create item
                    Dim Item As RepeaterItemVB = New RepeaterItemVB(I, Nothing)
                    ' initialize item from template
                    ItemTemplate.InstantiateIn(Item)
                    ' add item to the child controls collection
                    Controls.Add(Item)
                    ' save item in ArrayList to update the Items collection
                    Items.Add(Item)
                Next
                ' update the Items collection with newly added items
                _repeaterItems = New RepeaterItemCollectionVB(Items)
            End If
        End Sub

        ' override to create repeated items from DataSource
        Protected Overrides Sub OnDataBinding(E As EventArgs)
            MyBase.OnDataBinding(e)

            If Not DataSource Is Nothing
                ' clear any existing child controls
                Controls.Clear()
                ' clear any previous viewstate for existing child controls
                ClearChildViewState()

                Dim Items As New ArrayList
                ' iterate DataSource creating a new item for each data item
                Dim DataEnum As IEnumerator = DataSource.GetEnumerator()
                Dim I As Integer = 0
                Do While(DataEnum.MoveNext())

                    ' create item
                    Dim Item As RepeaterItemVB = New RepeaterItemVB(I, DataEnum.Current)
                    ' initialize item from template
                    ItemTemplate.InstantiateIn(Item)
                    ' add item to the child controls collection
                    Controls.Add(Item)
                    ' save item in ArrayList to update the Items collection
                    Items.Add(Item)

                    I = I + 1
                Loop

                ' update the Items collection with newly added items
                _repeaterItems = New RepeaterItemCollectionVB(Items)
                ' prevent child controls from being created again
                ChildControlsCreated = true
                ' store the number of items created in viewstate for postback scenarios
                ViewState("NumItems") = I
            End If

        End Sub

    End Class

End NameSpace