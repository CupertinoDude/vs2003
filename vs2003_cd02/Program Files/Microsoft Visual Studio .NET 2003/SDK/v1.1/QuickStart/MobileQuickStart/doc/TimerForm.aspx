<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Writing a TimerForm Control</h4>

<p>
The base set of controls offered by the ASP.NET does not include a <b>TimerForm</b>
control. A TimerForm control can be used to cause a mobile browser to post back to the server
or navigate to another link after a specified time period.
<p>
This sample provides an example of such a control. The TimerForm control also includes custom adapters
that emit browser-specific markup, and are instantiated based on the type of browser
being targeted.
<p>
The <b>TimerForm</b> control inherits from the <b>Form</b> control, and provides properties to specify a
time-out period, the name of a server-side method to invoke after the time-out, and a URL to navigate
to after the time-out (only one of these last two properties is used).
<p>
<b>Note</b>&nbsp; &nbsp; &nbsp;For HTML-based devices, the <b>TimerForm</b> control emits a refresh <b>META</b> tag into
the HTML response. These tags are unsupported on J-Phone and NTT Docomo devices. Therefore, the <b>TimerForm</b> control does not invoke
postback and does not work on such devices.
<p>

<Acme:SourceRef runat="server" Path="TimerForm/TimerForm" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
