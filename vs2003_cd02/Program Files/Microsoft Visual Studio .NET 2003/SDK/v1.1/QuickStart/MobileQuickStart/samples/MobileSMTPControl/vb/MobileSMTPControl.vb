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
Imports System.Web.Mail
Imports System.Web.UI
Imports System.Web.UI.MobileControls


Namespace Acme.MailControlsVB

    '==============
    ' This is a mobile server side controls that enables developers
    ' to send email message to an SMTP Address such as: someone@microsoft.com
    '==============
    Public Class MobileSMTPControl 
        Inherits MobileControl 
        Implements INamingContainer

        ' ==============
        ' Set or get the SMTP server that the message will be sent to 
        ' ==============
        Public Property SmtpServerName As String
            Get
                Return CType(ViewState("SmtpServerName"), String)
            End Get

            Set
                ViewState("SmtpServerName") = value
            End Set
        End Property
      
        ' ==============
        ' Get and set the destination SMTP Address of the message.
        ' this String needs to follow the SMTP Address schema
        ' ==============
        Public Property MessageTo As String
            Get
                Dim str as String = CType(ViewState("MessageTo"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageTo") = value
            End Set
        End Property
    
        ' ==============
        ' Get or set the source of the E-Mail Message.
        ' ==============
        Public Property MessageFrom As String
            Get
                Dim str as String = CType(ViewState("MessageFrom"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageFrom") = value
            End Set
        End Property
    
        ' ==============
        ' Get or set a destination SMTP Address of the message. 
        ' the adress or addressses entered will be in the Cc field of the e-mail message
        ' this String needs to follow the SMTP Address RFC
        ' ==============
        Public Property MessageCc As String
            Get
                Dim str as String = CType(ViewState("MessageCc"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageCc") = value
            End Set
        End Property

        ' ==============
        ' Get or set a destination SMTP Address of the message. 
        ' the adress or addressses entered will be in the Bcc field of the e-mail message
        ' this String needs to follow the SMTP Address RFC
        ' ==============
        Public Property MessageBcc As String
            Get
                Dim str as String = CType(ViewState("MessageBcc"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageBcc") = value
            End Set
        End Property

        ' ==============
        ' Get or set the Subject of the email message
        ' ==============
        Public Property MessageSubject As String
            Get
                Dim str as String = CType(ViewState("MessageSubject"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageSubject") = value
            End Set
        End Property
      
        ' ==============
        ' Get or set the Body of the email message
        ' ==============
        Public Property MessageBody As String
            Get
                Dim str as String = CType(ViewState("MessageBody"), String)
                If str = Nothing Then
                    Return String.Empty
                Else
                    Return str
                End If
            End Get

            Set
                ViewState("MessageBody") = value
            End Set
        End Property
      
        ' ==============
        ' Get or Set the option of making visible the Cc field
        ' to the end user.
        ' ==============
        Private _visibleCc As Boolean = True
        Public Property VisibleCc As Boolean
            Get
                return _visibleCc
            End Get

            Set
                _visibleCc = value
            End Set
        End Property

        ' ==============
        ' Get or Set the option of making visible the BCc field
        ' to the end user
        ' ==============
        Private _visibleBcc As Boolean = True
        Public Property VisibleBcc As Boolean
            Get
                return _visibleBcc
            End Get

            Set
                _visibleBcc = value
            End Set
        End Property

        ' ==============
        ' Get or Set the option of making visible the From field
        ' to the end user
        ' ==============
        Private _visibleFrom As Boolean = True
        Public Property VisibleFrom As Boolean
            Get
                return _visibleFrom
            End Get

            Set
                _visibleFrom = value
            End Set
        End Property

        ' ==============
        ' Get or Set the option of making visible the Priority field
        ' to the end user
        ' ==============
        Private _visiblePriority As Boolean = True
        Public Property VisiblePriority As Boolean
            Get
                return _visiblePriority
            End Get

            Set
                _visiblePriority = value
            End Set
        End Property

        ' ==============
        ' Get or Set the Priority of the Email Message
        ' ==============
        Public Property MessagePriority As String
            Get
                Dim mailPriority as MailPriority = _
                       CType(ViewState("MessagePriority"), MailPriority)

                If mailPriority.Equals(MailPriority.High)
                    Return "High"
                Else If mailPriority.Equals(MailPriority.Low)
                    Return "Low"
                End If
                Return "Normal"
            End Get
                
            Set
                Select value
                  Case "High"
                    ViewState("MessagePriority") = MailPriority.High
                  Case "Low"
                    ViewState("MessagePriority") = MailPriority.Low
                  Case Else
                    ViewState("MessagePriority") = MailPriority.Normal
                End Select
            End Set
                      
        End Property
      
        ' ==============
        ' Get or Set the Priority of the Email Message
        ' This is an internal interface to be use by the send email function
        ' ==============
        Protected Property MsgPriority As MailPriority
            Get
                Return CType(ViewState("MessagePriority"), MailPriority)
            End Get
            Set
                Select value
                  Case MailPriority.High
                    ViewState("MessagePriority") = MailPriority.High
                  Case MailPriority.Low
                    ViewState("MessagePriority") = MailPriority.Low
                  Case Else
                    ViewState("MessagePriority") = MailPriority.Normal
                End Select
            End Set
        End Property
      
        ' ==============
        ' This function overilde the CreateChildControl function 
        '  - Initialize each control with the value set in the properties (if applicable)
        '  - Hide or display the control base on the property settings
        '  - Add the control to the controiner
        '  - Set the ChildControlsCreated = true;    
        '  NOTE: the control are created when the class in instatiated
        ' ==============
        Overrides Protected Sub CreateChildControls()
            ' TO Section
            _lblMsgTo.ID = "lblMsgTo"
            _lblMsgTo.Text = "To:"
            _txtMsgTo.ID = "txtMsgTo"
            _txtMsgTo.Text = MessageTo
            _reqMsgTo.ControlToValidate = _txtMsgTo.ID
            _reqMsgTo.Text = "Must fill in the To: field"

            Me.Controls.Add(_reqMsgTo)
            Me.Controls.Add(_lblMsgTo)
            Me.Controls.Add(_txtMsgTo)

            ' From Section
            _lblMsgFrom.ID = "lblMsgFrom"
            _lblMsgFrom.Text = "From:"
            _lblMsgFrom.Visible = VisibleFrom
            _txtMsgFrom.ID = "txtMsgFrom"
            _txtMsgFrom.Text = MessageFrom
            _txtMsgFrom.Visible = VisibleFrom
            _reqMsgFrom.ControlToValidate = _txtMsgFrom.ID
            _reqMsgFrom.Text = "Must fill in the From: field"
            _reqMsgFrom.Visible = VisibleFrom

            Me.Controls.Add(_reqMsgFrom)
            Me.Controls.Add(_lblMsgFrom)
            Me.Controls.Add(_txtMsgFrom)
      
            ' Cc Section
            _lblMsgCc.ID    = "lblMsgCc"
            _lblMsgCc.Text    =  "CC:"
            _lblMsgCc.Visible= VisibleCc
            Me.Controls.Add(_lblMsgCc)

            _txtMsgCc.ID="txtMsgCc"
            _txtMsgCc.Visible = VisibleCc
            _txtMsgCc.Text = MessageCc
            Me.Controls.Add(_txtMsgCc)

            ' Bcc Section
            _lblMsgBcc.ID      = "lblMsgBcc"
            _lblMsgBcc.Text    =  "Bcc:"
            _lblMsgBcc.Visible = VisibleBcc
            Me.Controls.Add(_lblMsgBcc)

            _txtMsgBcc.ID = "txtMsgBBcc"
            _txtMsgBcc.Visible = VisibleBcc
            _txtMsgBcc.Text = MessageBcc
            Me.Controls.Add(_txtMsgBcc)

            ' SUBJECT Section
            _lblMsgSubject.ID = "lblMsgSubject"
            _lblMsgSubject.Text =  "Subject:"
            Me.Controls.Add(_lblMsgSubject)

            _txtMsgSubject.ID = "txtMsgSubject"
            _txtMsgSubject.Text = "MessageSubject"
            Me.Controls.Add(_txtMsgSubject)

            ' BODY Section
            _lblMsgBody.ID    = "lblMsgBody"
            _lblMsgBody.Text    = "Body:"
            Me.Controls.Add(_lblMsgBody)

            _txtMsgBody.ID = "txtMsgBody"
            _txtMsgBody.Text = MessageBody
            Me.Controls.Add(_txtMsgBody)

            ' PRIORITY Section
            _lblMsgPriority.ID    = "lblMsgPriority"
            _lblMsgPriority.Text    = "Priority:"
            _lblMsgPriority.Visible = VisiblePriority
            Me.Controls.Add(_lblMsgPriority)


            _slstMsgPriority.ID = "slstMsgPriority"
            ' add the option for the prioirty control (High, Normal, Low)
            _slstMsgPriority.Items.Add("High")
            _slstMsgPriority.Items.Add("Normal")
            _slstMsgPriority.Items.Add("Low")
            _slstMsgPriority.SelectedIndex =1
            _slstMsgPriority.Visible= VisiblePriority
            Me.Controls.Add(_slstMsgPriority)

            ' empty line created 
            _lblLine.ID    = "lblLine"
            Me.Controls.Add(_lblLine)

            ' SEND BUTTON Section
            _cmdOk.ID = "cmdOk"
            _cmdOk.Text = "Send"
                
            ' Subscribe to the OnClick event so it call Send_Function
            AddHandler _cmdOk.Click, AddressOf Me.Send_Click
            Me.Controls.Add(_cmdOk)
           
            'Saving the output
            ChildControlsCreated = true    

        End Sub
      
        ' ==============
        ' This function gets call after the user have click OK in the Send button
        '  - Get the latest values from the postback (enter by the user)
        '  - Find the priority settings
        '  - Call the internal function call SendMessage to send the message out
        '  - Check for any exception case by the SendMessage function
        ' ==============
        Protected Sub Send_Click(sender As Object, e As EventArgs)

            If (Not _reqMsgTo.IsValid)
                Exit Sub
            End If

            If (Not _reqMsgFrom.IsValid)
                Exit Sub
            End If

            If (Not _txtMsgTo.Text.Equals(MessageTo))
                MessageTo=_txtMsgTo.Text
            End If
            If (Not _txtMsgFrom.Text.Equals(MessageFrom))
                MessageFrom=_txtMsgFrom.Text
            End If
            If (Not _txtMsgCc.Text.Equals(MessageCc))
                MessageCc=_txtMsgCc.Text
            End If
            If (Not _txtMsgBcc.Text.Equals(MessageBcc))
                MessageBcc=_txtMsgBcc.Text
            End If
            If (Not _txtMsgSubject.Text.Equals(MessageSubject))
                MessageSubject=_txtMsgSubject.Text
            End If
            If (Not _txtMsgBody.Text.Equals(MessageBody))
                MessageBody=_txtMsgBody.Text
            End If
          
            Dim indexSelected as Integer = _slstMsgPriority.SelectedIndex
            Select indexSelected
              Case 0
                MsgPriority =  MailPriority.High
              Case 1
                MsgPriority =  MailPriority.Normal
              Case 2
                MsgPriority =  MailPriority.Low
            End Select

            Me.SendMessage()

            If _sendMailFailed = True
                Dim msgEventArg As MessageSentEventArgs = _
                       New MessageSentEventArgs(False,_internalException.Message)
                OnMessageSent(msgEventArg)
            Else
                Dim msgEventArg As MessageSentEventArgs = _
                       New MessageSentEventArgs(True)
                OnMessageSent(msgEventArg)
            End If

        End Sub
      
        ' ==============
        ' This function send the E-Mail to the SMTP Server
        '  - validate that there is a TO and From set
        '  - instanciate the Mail Message object
        '  - populate the object with the right information
        '  - Send the message
        '  - Catch any excption in the case of any proble
        ' ==============
        Protected Sub SendMessage()
            if (Not (Me.MessageFrom = Nothing)) And (Not (Me.MessageTo = Nothing))
                Dim newMailMessage As New MailMessage

                newMailMessage.From = Me.MessageFrom
                newMailMessage.To = Me.MessageTo
                newMailMessage.Priority = Me.MsgPriority
                newMailMessage.Body = Me.MessageBody
                newMailMessage.Subject = Me.MessageSubject

                Try 
                    SmtpMail.SmtpServer = Me.SmtpServerName
                    ' NOTE: the call to send is commented out
                    ' - restore it to send mail
                    ' SmtpMail.Send(newMailMessage)
                Catch e as Exception
                    _internalException = e
                    _sendMailFailed = true
                End Try
            End If

        End Sub
      

        ' ==============
        ' This is the event handler when the message sent
        ' ==============
        '' Public Delegate Sub MessageSentEventHandler(source As Object, e As MessageSentEventArgs)
        Public Event MessageSent(source As Object, e As MessageSentEventArgs)
        '''  public event MessageSentEventHandler MessageSent;
      
        Protected Sub OnMessageSent(e As MessageSentEventArgs) 
            RaiseEvent MessageSent(Me, e)
        End Sub

        ' private fields
        Private _internalException As Exception      = Nothing
        Private _sendMailFailed As Boolean           = False        
        Private _lblMsgTo As New Label               
        Private _lblMsgFrom As New Label             
        Private _lblMsgCc As New Label               
        Private _lblMsgBcc As New Label              
        Private _lblMsgSubject As New Label          
        Private _lblMsgBody As New Label             
        Private _lblMsgPriority As New Label         
        Private _lblLine As New Label                
        Private _txtMsgTo As New TextBox             
        Private _txtMsgFrom As New TextBox           
        Private _txtMsgCc As New TextBox             
        Private _txtMsgBcc As New TextBox            
        Private _txtMsgSubject As New TextBox        
        Private _txtMsgBody As New TextBox           
        Private _cmdOk As New Command                
        Private _reqMsgTo As New RequiredFieldValidator
        Private _reqMsgFrom As New RequiredFieldValidator
        Private _slstMsgPriority As New SelectionList

    End Class

    Public Class MessageSentEventArgs
        Inherits EventArgs

        Private _errorMessage as String = Nothing
        Private _wasMessageSent as Boolean = False

        Public Sub New(wasMessageSent As Boolean)
            _wasMessageSent = wasMessageSent
        End Sub

        Public Sub New(wasMessageSent As Boolean, newErrorMessage As String)
            _errorMessage = newErrorMessage
        End Sub

        Public ReadOnly Property ErrorMessage As String
            Get
                Return _errorMessage
            End Get
        End Property

        Public ReadOnly Property WasMessageSent As Boolean
            Get
                Return _wasMessageSent
            End Get
        End Property
    End Class

End Namespace
