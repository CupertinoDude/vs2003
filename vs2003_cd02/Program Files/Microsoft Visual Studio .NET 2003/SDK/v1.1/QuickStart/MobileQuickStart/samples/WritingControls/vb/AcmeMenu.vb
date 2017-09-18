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
Imports System.Web.UI
Imports System.Web.UI.MobileControls

Namespace Acme.CustomControlsVB

    Public Class Menu : Inherits System.Web.UI.MobileControls.List
    
        Overrides Protected Sub OnLoad(e As EventArgs)

            If (Not Page.IsPostBack)
	    
	        MyBase.OnLoad(e)
	        Dim thisForm As Form = Form
	        Dim testForm As Form
	        For Each testForm in MobilePage.Forms
	     	 
		    If (Not(testForm Is thisForm))
		     
		        Dim item As MobileListItem = New MobileListItem() 
		        Dim formTitle As String = testForm.Title
		        If (formTitle.Length > 0)
			    item.Text = formTitle
		        Else
			    item.Text = testForm.ID 
		        End If
		        item.Value = testForm.UniqueID
		        Items.Add(item)
		    
		    End If
		    
	        Next

            End If

            AddHandler Me.ItemCommand, AddressOf Me.HandleCommand
        
        End Sub

        Protected Sub HandleCommand(sender As Object, e As ListCommandEventArgs)
        
            Dim ctl As Form = CType(MobilePage.FindControl(e.ListItem.Value), Form)
            If (Not (ctl Is Nothing))
                MobilePage.ActiveForm = ctl
            End If
            
        End Sub
        
    End Class
    
End Namespace
