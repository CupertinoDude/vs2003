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

    Public Class UserLoginInfo
    
        Dim _userID As String 
        Dim _password As String

        Public Property UserID As String
        
            Get 
                Return _userID
            End Get
            Set 
                _userID = value 
            End Set
            
        End Property

        Public Property Password As String
        
            Get 
                Return _password
            End Get
            Set
                _password = value
            End Set
            
        End Property
        
    End Class
    
    Public Class LoginControl : Inherits MobileControl
    
        Implements INamingContainer
    
        Dim _loginInfo As UserLoginInfo
        Dim _txtuserid As TextBox
        Dim _txtpassword As TextBox
        
        Public Event Authenticate(sender As Object, e As EventArgs)

        Public ReadOnly Property LoginInfo As UserLoginInfo
        
            Get
            
                If (_loginInfo Is Nothing)
                    _loginInfo = New UserLoginInfo() 
                End If
                Return _loginInfo 
                
            End Get
            
        End Property

        Protected Sub OnClickCommand(sender As Object, e As EventArgs)
        
            LoginInfo.UserID = _txtuserid.Text
            LoginInfo.Password = _txtpassword.Text

            RaiseEvent Authenticate(Me, New EventArgs())
        
        End Sub
                 
        Overrides Protected Sub OnDataBinding(e As EventArgs)
        
            Controls.Clear()
            ClearChildViewState()
            CreateChildControls()
            _txtuserid.Text = LoginInfo.UserID
            _txtpassword.Text = LoginInfo.Password
            
        End Sub

        Overrides Protected Sub CreateChildControls()
        
            ' Create child controls

            Dim label As Label
            Dim command As Command

            label = New Label()
            label.Text = "UserID: "
            Controls.Add(label)

            _txtuserid = New TextBox()
            _txtuserid.ID = "userID"
            Controls.Add(_txtuserid)

            label = New Label()
            label.Text = "Password: "
            Controls.Add(label)

            _txtpassword = New TextBox()
            _txtpassword.Password = True
            _txtpassword.ID = "password"
            Controls.Add(_txtpassword)

            command = New Command()
            command.Text = "Submit"
            AddHandler command.Click, AddressOf Me.OnClickCommand
            Controls.Add(command)

            ChildControlsCreated = True
            
        End Sub
        
    End Class
    
End Namespace



