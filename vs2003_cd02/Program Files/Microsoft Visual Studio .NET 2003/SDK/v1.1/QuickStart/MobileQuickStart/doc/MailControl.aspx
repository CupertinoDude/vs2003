<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Writing an E-Mail Control</h4>

<p>
This example demonstrates a custom-written control that is used to generate a user interface that allows 
users to send Simple Mail Transfer Protocol (SMTP) e-mail from their mobile devices.

<p>
The control itself, <b>MobileSMTPControl</b>, is a "composite control", which means that it
inherits from the <b>MobileControl</b> class, and overrides the <b>CreateChildControls()</b> method,
where it adds the primitive ASP.NET mobile Web Forms controls that make up the UI.
<p>
When the user selects the <b>Send</b> command, a server-side method is invoked. This method uses the
 content of the UI to construct a <b>System.Web.Mail.MailMessage</b> and
sends the message through an SMTP server.
<p>

This example also includes a sample Microsoft ASP.NET page, emailPage.aspx, that uses the <b>MobileSMTPControl</b> control.
This page provides three different uses of the <b>MobileSMTPControl</b> control: the first is a basic
usage, the second applies a style to the control, and the third uses the property-override
technique to show and hide various input fields (such as Cc: and Bcc:) based on
device type.
<p>
<b>Note:</b> To use this control, you need to set
the <b>SMTPServerName</b> property on the control to a server that your computers can
access, and that is capable of sending SMTP mail. In the example code in emailPage.aspx,
this value is set to <b>SmartHost</b>.
<p>

<Acme:SourceRef runat="server" Path="MobileSMTPControl/MobileSMTPControl" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
