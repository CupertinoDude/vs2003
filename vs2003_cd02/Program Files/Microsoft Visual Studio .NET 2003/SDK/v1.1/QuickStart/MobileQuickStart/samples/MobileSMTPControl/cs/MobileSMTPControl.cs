//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.MobileControls;


namespace Acme.MailControlsCS
{
    /// <summary>
    /// This is a mobile server side controls that enables developers
    /// to send email message to an SMTP Address such as: someone@microsoft.com
    /// </summary>
    public class MobileSMTPControl : MobileControl, INamingContainer
    {
        /// <summary>
        /// Set or get the SMTP server that the message will be sent to 
        /// </summary>
        public String SmtpServerName
        {
            get
            {
                return (String)ViewState["SmtpServerName"];
            }
            set
            {
                ViewState["SmtpServerName"] = value;
            }
        }
      
        /// <summary>
        /// Get or set the destination SMTP Address of the message.
        /// this String needs to follow the SMTP Address schema
        /// </summary>
        public String MessageTo
        {
            get
            {
                String str = (String)ViewState["MessageTo"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageTo"] = value;
            }
        }
    
        /// <summary>
        /// Get or set the source of the E-Mail Message.
        /// </summary>
        public String MessageFrom
        {
            get
            {
                String str = (String)ViewState["MessageFrom"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageFrom"] = value;
            }
        }
    
        /// <summary>
        /// Get or set a destination SMTP Address of the message. 
        /// the adress or addressses entered will be in the Cc field of the e-mail message
        /// this String needs to follow the SMTP Address RFC
        /// </summary>
        public String MessageCc
        {
            get
            {
                String str = (String)ViewState["MessageCc"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageCc"] = value;
            }
        }
    
        /// <summary>
        /// Get or set a destination SMTP Address of the message. 
        /// the adress or addressses entered will be in the Bcc field of the e-mail message
        /// this String needs to follow the SMTP Address RFC
        /// </summary>
        public String MessageBcc
        {
            get
            {
                String str = (String)ViewState["MessageBcc"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageBcc"] = value;
            }
        }

        /// <summary>
        /// Get or set the Subject of the email message
        /// </summary>
        public String MessageSubject
        {
            get
            {
                String str = (String)ViewState["MessageSubject"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageSubject"]= value;
            }
        }
      
        /// <summary>
        /// Get or set the Body of the email message
        /// </summary>
        public String MessageBody
        {
            get
            {
                String str = (String)ViewState["MessageBody"];
                return str == null ? String.Empty : str;
            }
            set
            {
                ViewState["MessageBody"] = value;
            }
        }
      
        /// <summary>
        /// Get or Set the option of making visible the Cc field
        /// to the end user.
        /// </summary>
        private bool _visibleCc = true;
        public bool VisibleCc
        {
            get
            {
                return _visibleCc;
            }
            set
            {
                _visibleCc = value;
            }
        }
        /// <summary>
        /// Get or Set the option of making visible the BCc field
        /// to the end user
        /// </summary>
        private bool _visibleBcc = true;
        public bool VisibleBcc
        {
            get
            {
                return _visibleBcc;
            }
            set
            {
                _visibleBcc = value;
            }
        }

        /// <summary>
        /// Get or Set the option of making visible the From field
        /// to the end user
        /// </summary>
        private bool _visibleFrom = true;
        public bool VisibleFrom
        {
            get
            {
                return _visibleFrom;
            }
            set
            {
                _visibleFrom = value;
            }
        }

        /// <summary>
        /// Get or Set the option of making visible the Priority field
        /// to the end user
        /// </summary>
        private bool _visiblePriority = true;
        public bool VisiblePriority
        {
            get
            {
                return _visiblePriority;
            }
            set
            {
                _visiblePriority = value;
            }
        }

        /// <summary>
        /// Get or Set the Priority of the Email Message
        /// </summary>
        public String MessagePriority
        {
            get
            {
                MailPriority mailPriority = (MailPriority)ViewState["MessagePriority"];
                if (mailPriority.Equals(MailPriority.High))
                {
                    return ("High");
                } else if (mailPriority.Equals(MailPriority.Low))
                {
                    return ("Low");
                }
                return ("Normal");
            }
            set
            {
                switch (value)
                {
                  case ("High"):
                    ViewState["MessagePriority"] = MailPriority.High;
                    break;
                  case ("Low"):
                    ViewState["MessagePriority"] = MailPriority.Low;
                    break;
                  case ("Normal"):
                  default:
                    ViewState["MessagePriority"] = MailPriority.Normal;
                    break;
                }
            }
        }
      
        /// <summary>
        /// Get or Set the Priority of the Email Message
        /// This is an internal interface to be use by the send email function
        /// </summary>
        protected MailPriority MsgPriority
        {
            get
            {
                return ((MailPriority)ViewState["MessagePriority"]);
            }
            set
            {
                switch (value)
                {
                  case (MailPriority.High):
                    ViewState["MessagePriority"] = MailPriority.High;
                    break;
                  case (MailPriority.Low):
                    ViewState["MessagePriority"] = MailPriority.Low;
                    break;
                  case (MailPriority.Normal):
                  default:
                    ViewState["MessagePriority"] = MailPriority.Normal;
                    break;
                }
            }
        }
      
        /// <summary>
        /// This function overilde the CreateChildControl function 
        ///  - Initialize each control with the value set in the properties (if applicable)
        ///  - Hide or display the control base on the property settings
        ///  - Add the control to the controiner
        ///  - Set the ChildControlsCreated = true;    
        ///  NOTE: the control are created when the class in instatiated
        /// </summary>
        protected override void CreateChildControls()
        {
            // TO Section
            _lblMsgTo.ID = "lblMsgTo";
            _lblMsgTo.Text = "To:";
            _txtMsgTo.ID = "txtMsgTo";
            _txtMsgTo.Text = MessageTo;
            _reqMsgTo.ControlToValidate = _txtMsgTo.ID;
            _reqMsgTo.Text = "Must fill in the To: field";
            
            this.Controls.Add(_reqMsgTo);
            this.Controls.Add(_lblMsgTo);
            this.Controls.Add(_txtMsgTo);

            // From Section
            _lblMsgFrom.ID = "lblMsgFrom";
            _lblMsgFrom.Text = "From:";
            _lblMsgFrom.Visible = VisibleFrom;
            _txtMsgFrom.ID = "txtMsgFrom";
            _txtMsgFrom.Text = MessageFrom;
            _txtMsgFrom.Visible = VisibleFrom;
            _reqMsgFrom.ControlToValidate = _txtMsgFrom.ID;
            _reqMsgFrom.Text = "Must fill in the From: field";
            _reqMsgFrom.Visible = VisibleFrom;
            
            this.Controls.Add(_reqMsgFrom);
            this.Controls.Add(_lblMsgFrom);
            this.Controls.Add(_txtMsgFrom);
            
            // Cc Section
            _lblMsgCc.ID    = "lblMsgCc";
            _lblMsgCc.Text    =  "CC:";
            _lblMsgCc.Visible= VisibleCc;
            this.Controls.Add(_lblMsgCc);

            _txtMsgCc.ID="txtMsgCc";
            _txtMsgCc.Visible = VisibleCc;
            _txtMsgCc.Text = MessageCc;
            this.Controls.Add(_txtMsgCc);

            // Bcc Section
            _lblMsgBcc.ID      = "lblMsgBcc";
            _lblMsgBcc.Text    =  "Bcc:";
            _lblMsgBcc.Visible = VisibleBcc;
            this.Controls.Add(_lblMsgBcc);

            _txtMsgBcc.ID = "txtMsgBBcc";
            _txtMsgBcc.Visible = VisibleBcc;
            _txtMsgBcc.Text = MessageBcc;
            this.Controls.Add(_txtMsgBcc);

            // SUBJECT Section
            _lblMsgSubject.ID = "lblMsgSubject";
            _lblMsgSubject.Text =  "Subject:";
            this.Controls.Add(_lblMsgSubject);

            _txtMsgSubject.ID = "txtMsgSubject";
            _txtMsgSubject.Text = "MessageSubject";
            this.Controls.Add(_txtMsgSubject);

            // BODY Section
            _lblMsgBody.ID    = "lblMsgBody";
            _lblMsgBody.Text    = "Body:";
            this.Controls.Add(_lblMsgBody);

            _txtMsgBody.ID = "txtMsgBody";
            _txtMsgBody.Text = MessageBody;
            this.Controls.Add(_txtMsgBody);

            // PRIORITY Section
            _lblMsgPriority.ID    = "lblMsgPriority";
            _lblMsgPriority.Text    = "Priority:";
            _lblMsgPriority.Visible = VisiblePriority;
            this.Controls.Add(_lblMsgPriority);


            _slstMsgPriority.ID = "slstMsgPriority";
            // add the option for the prioirty control (High, Normal, Low)
            _slstMsgPriority.Items.Add("High");
            _slstMsgPriority.Items.Add("Normal");
            _slstMsgPriority.Items.Add("Low");
            _slstMsgPriority.SelectedIndex =1;
            _slstMsgPriority.Visible= VisiblePriority;
            this.Controls.Add(_slstMsgPriority);

            // empty line created 
            _lblLine.ID    = "lblLine";
            this.Controls.Add(_lblLine);

            // SEND BUTTON Section
            _cmdOk.ID = "cmdOk";
            _cmdOk.Text="Send";
            
            // Subscribe to the OnClick event so it call Send_Function
            _cmdOk.Click += new EventHandler(this.Send_Click);
            this.Controls.Add(_cmdOk);
           
            //Saving the output
            ChildControlsCreated = true;    

        }
      
        /// <summary>
        /// This function gets call after the user have click OK in the Send button
        ///  - Get the latest values from the postback (enter by the user)
        ///  - Find the priority settings
        ///  - Call the internal function call SendMessage to send the message out
        ///  - Check for any exception case by the SendMessage function
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Send_Click(Object sender, EventArgs e)
        {
            if (!_reqMsgTo.IsValid || !_reqMsgFrom.IsValid)
            {
                return;
            }
            
            if (!_txtMsgTo.Text.Equals(MessageTo))
            {    
                MessageTo=_txtMsgTo.Text;
            }        
            if (!_txtMsgFrom.Text.Equals(MessageFrom))
            {    
                MessageFrom=_txtMsgFrom.Text;
            }
            if (!_txtMsgCc.Text.Equals(MessageCc))
            {    
                MessageCc=_txtMsgCc.Text;
            }
            if (!_txtMsgBcc.Text.Equals(MessageBcc))
            {    
                MessageBcc=_txtMsgBcc.Text;
            }
            if (!_txtMsgSubject.Text.Equals(MessageSubject))
            {    
                MessageSubject=_txtMsgSubject.Text;
            }
            if (!_txtMsgBody.Text.Equals(MessageBody))
            {    
                MessageBody=_txtMsgBody.Text;
            }
          
          
            int indexSelected = _slstMsgPriority.SelectedIndex;
            switch (indexSelected)
            {
              case 0:
                MsgPriority =  MailPriority.High;
                break;
              case 1:
                MsgPriority =  MailPriority.Normal;
                break;
              case 2:
                MsgPriority =  MailPriority.Low;
                break;
            }
          

            this.SendMessage();

            if (_sendMailFailed == true)
            {        
                MessageSentEventArgs msgEventArg = new MessageSentEventArgs(false,_internalException.Message);
                OnMessageSent(msgEventArg);
            }
            else
            {
                MessageSentEventArgs msgEventArg = new MessageSentEventArgs(true);
                OnMessageSent(msgEventArg);
            }
        }
      
        /// <summary>
        /// This function send the E-Mail to the SMTP Server
        ///  - validate that there is a TO and From set
        ///  - instanciate the Mail Message object
        ///  - populate the object with the right information
        ///  - Send the message
        ///  - Catch any excption in the case of any proble
        /// </summary>
        protected void SendMessage()
        {
            if ((this.MessageFrom != null) && (this.MessageTo!=null))
            {
                MailMessage newMailMessage = new MailMessage();

                newMailMessage.From = this.MessageFrom;
                newMailMessage.To = this.MessageTo;
                newMailMessage.Priority = this.MsgPriority;
                newMailMessage.Body = this.MessageBody;
                newMailMessage.Subject = this.MessageSubject;

                try 
                {
                    SmtpMail.SmtpServer = this.SmtpServerName;
                    // NOTE: the call is send is commented out
                    // - restore it to send mail
                    //SmtpMail.Send(newMailMessage);
                }
                catch (Exception e)
                {
                    _internalException = e;
                    _sendMailFailed = true;
                }
            }
        }
      
        /// <SECTION>
        /// EVENTS
        /// This section provides the event managment
        /// </SECTION>
        /// 
        /// <summary>
        /// This is the event handler when the message sent
        /// </summary>
        /// 
        public delegate void MessageSentEventHandler(Object source, MessageSentEventArgs e);
        public event MessageSentEventHandler MessageSent;
      
        /// <summary>
        /// 
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected void OnMessageSent(MessageSentEventArgs e) 
        {
            if (MessageSent != null)
            {
                MessageSent(this, e);
            }
        }

        // private fields
        Exception _internalException         = null;
        bool     _sendMailFailed             = false;        
        Label    _lblMsgTo                   = new Label();
        Label    _lblMsgFrom                 = new Label();
        Label    _lblMsgCc                   = new Label();
        Label    _lblMsgBcc                  = new Label();
        Label    _lblMsgSubject              = new Label();
        Label    _lblMsgBody                 = new Label();
        Label    _lblMsgPriority             = new Label();
        Label    _lblLine                    = new Label();
        TextBox  _txtMsgTo                   = new TextBox();
        TextBox  _txtMsgFrom                 = new TextBox();
        TextBox  _txtMsgCc                   = new TextBox();
        TextBox  _txtMsgBcc                  = new TextBox();    
        TextBox  _txtMsgSubject              = new TextBox();
        TextBox  _txtMsgBody                 = new TextBox();
        Command  _cmdOk                      = new Command();
        RequiredFieldValidator _reqMsgTo     = new RequiredFieldValidator();
        RequiredFieldValidator _reqMsgFrom   = new RequiredFieldValidator();
        SelectionList _slstMsgPriority       = new SelectionList();
    }

    public class MessageSentEventArgs : EventArgs
    {
        String _errorMessage = null;
        bool   _wasMessageSent = false;
        public MessageSentEventArgs(bool wasMessageSent)
        {
            _wasMessageSent = wasMessageSent;
        }
        public MessageSentEventArgs(bool wasMessageSent, String newErrorMessage)
        {
            _errorMessage = newErrorMessage;
        }

        public String ErrorMessage
        {
            get
            {
                return _errorMessage;
            }
        }
        public bool WasMessageSent
        {
            get
            {
                return _wasMessageSent;
            }
        }
    }

}
