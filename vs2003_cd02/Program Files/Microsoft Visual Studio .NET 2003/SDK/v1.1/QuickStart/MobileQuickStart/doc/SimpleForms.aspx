<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<script runat=server language="c#">

String GetLanguage()
{
    String code = "VB";
    HttpCookie codeCookie = Request.Cookies["langpref"];
    if (codeCookie != null) 
    {
        code = codeCookie.Value;
    }
    return code;
}


</script>

<h4>Introducing ASP.NET Mobile Web Forms</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#WhatAre">What Are Mobile Web Forms?</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Simple">An Easy Mobile Web Form</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Multiple">Placing Multiple Mobile Web Forms on a Page</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Events">Responding to Control Events</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Menus">Showing a Menu</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#DisplayText">Displaying Text</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="WhatAre"></a>
<span class="subhead">What Are Mobile Web Forms?</span><br>

<p>

A ASP.NET mobile Web Forms page is a specialized Microsoft ASP.NET Web Forms page. 
As with any other Web Forms page, a mobile Web Forms page is a text file 
with an .aspx file extension.
A mobile Web Forms page contains a set of mobile Web Forms controls, which are
ASP.NET server controls that can adaptively render to supported mobile devices.

<p>

You can program mobile pages and controls by using 
device-independent properties, methods, and events.
When a supported device requests a mobile Web Forms page, the page and controls
automatically produce a rendering suitable for the device.

<p>

<a name="Simple"></a>
<span class="subhead">An Easy Mobile Web Form</span><br>

<p>

The following sample shows an easy, short mobile Web Forms page, with some literal text and a mobile control.
Every mobile Web Forms page must have the following standard header
directives that identify it as a mobile page. The <b>Language=</b> attribute
varies, depending on which language you use for your page.

<p>

<div class="xmpcode">
&lt;%@ Page Inherits="System.Web.UI.MobileControls.MobilePage"<br>
&nbsp;&nbsp;&nbsp;&nbsp;Language="<%= GetLanguage() %>" %&gt;<br>
&lt;%@ Register TagPrefix="mobile" <br>
&nbsp;&nbsp;&nbsp;&nbsp;Namespace="System.Web.UI.MobileControls"<br>
&nbsp;&nbsp;&nbsp;&nbsp;Assembly="System.Web.Mobile" %&gt;
</div>

<p>

Every mobile control tag in a mobile Web Forms page must include 
the <b>runat="server"</b> attribute. Each page contains at least one mobile form, 
indicated by the <b>&lt;mobile:Form&gt</b> tag.

<p>

<Acme:SourceRef runat="server" Path="Introduction/SimpleForm" />

<p>

<a name="Multiple"></a>
<span class="subhead">Placing Multiple Mobile Web Forms on a Page</span><br>

<p>

Ordinary ASP.NET Web Forms pages can contain only one form per page.
However, because mobile devices typically have smaller screens,
a mobile Web Forms page allows several forms to be defined. 
This provides several benefits:

<ul>
<li>Manages the complexity of your Web site, by avoiding a large number of
small pages.
<li>Organizes your mobile Web application in the same way as your desktop
Web application, because you can have a single desktop page that corresponds to a single mobile page with several forms.
<li>Takes advantage of page-level features provided by mobile 
Web Forms , such as automatic maintenance of page state (known as view state), and 
adaptation to devices capable of receiving multiple screens in a single response.
</ul>

<p>

When a client accesses a page for the first time, the first form is shown by
default. You can programmatically navigate to other forms by setting the 
<b>ActiveForm</b> property of the mobile page, or you can allow a user to 
navigate to a form by using a <b>Link</b> control. 

The following sample shows a 
page with two forms, and an example of the latter type of form navigation.

<p>

<Acme:SourceRef runat="server" Path="Introduction/MultipleForms" />

<p>

<a name="Events"></a>
<span class="subhead">Responding to Control Events</span><br>

<p>

An ASP.NET mobile control 
exposes an object model that contains properties, methods, and events. 
You can use this object model to cleanly modify and interact with the
page. The object model of a mobile control is device independent,
so you can interact with it in a uniform way, regardless of the target
device.

<p>

The following sample demonstrates how to handle the <b>Click</b> event
from the <b>Command</b> control. When the code receives this event, it 
programmatically navigates to another form. A newly activated form
raises the <b>Activate</b> event, which you can use to 
initialize the form.

<p>

<Acme:SourceRef runat="server" Path="Introduction/ControlEvents" />

<p>

<a name="Menus"></a>
<span class="subhead">Showing a Menu</span><br>

<p>

A typical feature of a mobile user interface is a menu
that allows a user to easily browse to a choice of pages.
One way that you can construct a menu in a mobile Web Forms page is 
by using the <b>List</b> mobile control. 

<p>

The following sample shows a menu form using a <b>List</b> control. 
When the user clicks a choice, the control's <b>ItemCommand</b> event is
raised. The page's code uses the clicked choice to alter the
contents of the second form, and then navigate to the form.

<p>

<Acme:SourceRef runat="server" Path="Introduction/Menu" />

<p>

<a name="DisplayText"></a>
<span class="subhead">Displaying Text</span><br>

<p>

You can place text in a <b>Label</b> control, which is suitable for small
amounts of text, and you can also place text directly in a form.
Another control you can use to display larger amounts of text
is the <b>TextView</b> control, which
allows you to dynamically set text that 
includes some common markup tags. The tags <b>&lt;b&gt;</b>, 
<b>&lt;i&gt;</b>, <b>&lt;p&gt;</b>, <b>&lt;br&gt;</b>, and <b>&lt;a&gt;</b>
(in a limited form) are supported.

<p>

When placing large amounts of text on a single form, you can use the 
pagination feature of the form by setting the <b>Paginate</b> property to 
<b>true</b>. The form paginates its contents according to characteristics
of the target device.

<p>

The following sample shows the <b>TextView</b> control in action.
On a Pocket PC or similar device, the text occupies one page
(though it does scroll). On a WML-based cell phone, the text renders over
multiple screens.
In each instance, the <b>TextView</b> control automatically provides
UI for the user to browse between pages of text.

<p>

<Acme:SourceRef runat="server" Path="Introduction/DisplayText" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
