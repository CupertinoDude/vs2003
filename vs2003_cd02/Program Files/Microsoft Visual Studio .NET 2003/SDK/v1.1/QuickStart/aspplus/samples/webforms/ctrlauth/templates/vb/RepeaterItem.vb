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

    Public Class RepeaterItemVB : Inherits Control : Implements INamingContainer

        Private _ItemIndex As Integer
        Private _DataItem As Object

        Public Sub New(ItemIndex As Integer, DataItem As Object)
            MyBase.New()
            _ItemIndex = ItemIndex
            _DataItem = DataItem
        End Sub

        Public ReadOnly Property DataItem As Object
            Get
                return _DataItem
            End Get
        End Property

        Public ReadOnly Property ItemIndex As Integer
            Get
                return _ItemIndex
            End Get
        End Property

    End Class

End Namespace