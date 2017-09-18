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
Imports System.Globalization
Imports System.Reflection
Imports System.Resources
Imports System.Threading
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace LocalizedControlsVB 
  Friend Class ResourceFactory 
    Shared _rm As ResourceManager

    Public Shared ReadOnly Property RManager As ResourceManager
      Get
        If(_rm Is Nothing) Then
          _rm = new ResourceManager("LocalizedStringsVB", System.Reflection.Assembly.GetExecutingAssembly(), Nothing)
        End If

        RManager = _rm
      End Get
    End Property
  End Class
    
  Public Class LocalizedButton
  Inherits System.Web.UI.WebControls.Button 

    Overrides Protected Sub Render (writer As HtmlTextWriter) 
      Me.Text = ResourceFactory.RManager.GetString(Me.Text)
      MyBase.Render(writer)
    End Sub
  End Class
End Namespace

