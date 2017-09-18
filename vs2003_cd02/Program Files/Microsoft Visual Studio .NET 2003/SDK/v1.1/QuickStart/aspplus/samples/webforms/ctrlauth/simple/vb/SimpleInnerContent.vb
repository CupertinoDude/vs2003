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

Option Strict Off

Imports System
Imports System.Web
Imports System.Web.UI

Namespace SimpleControlSamples

    Public Class SimpleInnerContentVB : Inherits Control

       Protected Overrides Sub Render(Output As HtmlTextWriter)

           If HasControls() And TypeOf Controls(0) Is LiteralControl
              Dim Ctrl As LiteralControl = Controls(0)
              Output.Write("<H2>" & "Your Message: " & Ctrl.Text & "</H2>")
           End If

       End Sub

    End Class

End Namespace