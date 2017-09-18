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
Imports System.Web
Imports System.Web.UI
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Web.UI.WebControls

Namespace NonCompositionSampleControls

    Public Class NonComposition1VB : Inherits Control : Implements IPostBackDataHandler

        Private _value As Integer = 0

        Public Property Value As Integer

           Get
               Return _value
           End Get
           Set
               _value = Value
           End Set

        End Property

        Public Function LoadPostData(PostDataKey As String, Values As NameValueCollection) As Boolean Implements IPostBackDataHandler.LoadPostData

           _value = Int32.Parse(Values(Me.UniqueID))
           Return false
        End Function

        Public Sub RaisePostDataChangedEvent() Implements IPostBackDataHandler.RaisePostDataChangedEvent

           ' Part of the IPostBackDataHandler contract.  Invoked if we ever returned true from the
           ' LoadPostData method (indicates that we want a change notification raised).  Since we
           ' always return false, this method is just a no-op.
        End Sub

        Protected Overrides Sub Render(Output As HtmlTextWriter)
           Output.Write("<h3>Value: <input name=" & Me.UniqueID & " type=text value=" & Me.Value & "> </h3>")
        End Sub

    End Class

End Namespace