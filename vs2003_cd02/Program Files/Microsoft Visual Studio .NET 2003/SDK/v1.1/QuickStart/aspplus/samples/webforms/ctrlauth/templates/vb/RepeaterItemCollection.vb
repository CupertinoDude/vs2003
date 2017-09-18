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
Imports System.Web.Util

Namespace TemplateControlSamplesVB

    Public Class RepeaterItemCollectionVB : Implements ICollection

        Private Items As ArrayList

        Public Sub New(Items As ArrayList)
            MyBase.New()
            Me.Items = Items
        End Sub

        Public ReadOnly Property All As RepeaterItemVB()
            Get
                return CType(Items.ToArray(), RepeaterItemVB())
            End Get
        End Property

        Public ReadOnly Property Count As Integer Implements ICollection.Count
            Get
                Return Items.Count
            End Get
        End Property

        Public ReadOnly Property IsSynchronized As Boolean  Implements ICollection.IsSynchronized
            Get
                Return false
            End Get
        End Property

        Public ReadOnly Property SyncRoot As Object Implements ICollection.SyncRoot
            Get
                Return Me
            End Get
        End Property

        Public Default ReadOnly Property Item(Index As Integer) As RepeaterItemVB
            Get
                Return CType(Items(Index), RepeaterItemVB)
            End Get
        End Property

        Public Sub CopyTo(OutputArray As Array, Index As Integer)  Implements ICollection.CopyTo
            Dim E As IEnumerator = Me.GetEnumerator()
            Do While (E.MoveNext())
                OutputArray.SetValue(E.Current, Index)
                Index = Index + 1
            Loop
        End Sub

        Public Function GetEnumerator() As IEnumerator Implements ICollection.GetEnumerator
            Return Items.GetEnumerator()
        End Function

    End Class

End Namespace
