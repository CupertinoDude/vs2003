<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>
<%@ Register TagPrefix="SMTP" Namespace="Acme.MailControlsVB" Assembly="Acme.MobileSMTPControlVB" %>

<script runat="Server">

Protected Sub SMTP_MessageSent(source As Object, e As MessageSentEventArgs)
    If e.WasMessageSent = True
        lblMsgSent.Text = "Message was successfully sent"
    Else
        lblMsgSent.Text = _
             String.Format("Could not sent your email due to the following reason : '{0}'", _
                           e.ErrorMessage)
    End If
    Me.ActiveForm = frmMessageSent
End Sub

</script>

<mobile:StyleSheet id="ss1" runat="server">
    <PagerStyle Font-Name="Verdana" Name="FromStyle" BackColor="#80FFFF"></PagerStyle>
</mobile:StyleSheet>

<mobile:Form id="frmWelcome" runat="server" StyleReference="FromStyle">
    Testing the SMTP Control<br/>
    <mobile:Link runat="server" NavigateUrl="#frmDefault">Default SMTP Control</mobile:Link>
    <mobile:Link runat="server" NavigateUrl="#frmStyle">Applying Styles to the control</mobile:Link>
    <mobile:Link runat="server" NavigateUrl="#frmDeviceSpecific">Applying Device Specific to the control</mobile:Link>
</mobile:Form>

<%-- basic usage of the SMTP control.  Note that you have to put in a valid SMTPServer for you
     network (true for all instances of this control) --%>
<mobile:Form id="frmDefault" runat="server">
    <SMTP:MobileSmtpControl Runat="server"
                            SMTPServerName="SmartHost"
                            OnMessageSent="SMTP_MessageSent"/>
</mobile:Form>

<%-- Shows the SMTP control inheriting a style.  --%>
<mobile:Form id="frmStyle" runat="Server" StyleReference="FromStyle">
    <SMTP:MobileSmtpControl runat="Server"
                            SMTPServerName="SmartHost"
                            OnMessageSent="SMTP_MessageSent"/>
</mobile:Form>

<%-- Shows fields optionally made disabled, with additional fields disabled on
     a per-device-type basis.  --%>
<mobile:Form id="frmDeviceSpecific" runat="server" StyleReference="FromStyle">
    <SMTP:MobileSmtpControl runat="Server"
                            SMTPServerName="SmartHost"
                            VisibleBcc="false"
                            OnMessageSent="SMTP_MessageSent" >
        <DeviceSpecific>
            <Choice filter="IsWML" VisiblePriority="false" VisibleCc="false" />
        </DeviceSpecific>
    </SMTP:MobileSmtpControl>
</mobile:Form>

<mobile:Form id="frmMessageSent" runat="server" StyleReference="FromStyle">
    <mobile:Label id="lblMsgSent" runat="server"/>
    <mobile:Link runat="server" NavigateURL="#frmWelcome">Back to Start Page</mobile:Link>
</mobile:Form>

