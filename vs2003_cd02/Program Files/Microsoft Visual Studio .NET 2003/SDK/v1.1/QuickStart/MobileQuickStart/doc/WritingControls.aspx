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

<h4>Writing Your Own Controls</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#User">Writing a User Control</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Custom">Custom Controls</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Inheritance">Using Inheritance</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Composite">Writing a Composite Control</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Advanced">Writing Advanced Controls</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

In addition to the built-in set of ASP.NET mobile controls, you can author your own 
controls, encapsulating custom functionality so that it can be reused on any
ASP.NET mobile Web Forms page.
Because mobile controls are built on Microsoft ASP.NET, you can use the same
features and techniques available in ASP.NET to create your own controls.
        
<p>

ASP.NET allows you to create two kinds of controls: 
<ul compact>
<li><b>User Controls</b>. Files you can create by using the same techniques that you use for pages (with a few small modifications).
<li><b>Custom Controls</b>. Controls you write and compile separately, giving you greater flexibility.
</ul compact>

This section describes how to use control authoring techniques to create your own
mobile controls.
For a general background of user controls and custom controls in ASP.NET,
see the Web Forms User Controls and Authoring Custom Controls sections in the 
<a href="/quickstart/aspplus/default.aspx" target="_top">ASP.NET QuickStart tutorial</a>.
Note that this tutorial
is available only if you have installed the Microsoft .NET Framework samples on this computer.

<p>

<a name="User"></a>
<span class="subhead">Writing a User Control</span><br>

<p>

User controls provide an easy way to reuse page logic in other pages.
To create a user control, you use the same declarative tag syntax that you use for a page,
except that you create an .ascx file extension instead of an .aspx file extension.
Similar to an ASP.NET mobile Web Forms page, a mobile user control file must contain 
some standard header directives, indicating that it is a mobile control as shown in the following code. 

<p>

<div class="xmpcode">
&lt;%@ Control Inherits="System.Web.UI.MobileControls.MobileUserControl"<br>
&nbsp;&nbsp;&nbsp;&nbsp;Language="<%= GetLanguage() %>" %&gt;<br>
&lt;%@ Register TagPrefix="mobile" <br>
&nbsp;&nbsp;&nbsp;&nbsp;Namespace="System.Web.UI.MobileControls"<br>
&nbsp;&nbsp;&nbsp;&nbsp;Assembly="System.Web.Mobile" %&gt;
</div>

<p> 

These directives are very similar to that of a mobile page,
except that a <b>Control</b> directive is used instead of a <b>Page</b> directive.
The <b>Inherits</b> attribute can point to the <b>System.Web.UI.UserControl</b> class,
or any other class that itself inherits from the <b>UserControl</b> class. 

<p>

As with any other user control, using a mobile user control in
an ASP,NET mobile Web Forms page requires two steps. The first declaration,
a <b>Register</b> directive, registers the control for use in the page and
gives it a unique name.
After the control is registered, you can place the control in a form, as you can with any other control.

<p>

The following sample shows a mobile user control used in a page.
The control uses a <b>List</b> control for a menu bar, but encapsulates 
additional functionality, including the ability to  
navigate to a form automatically based on the menu selection. It also includes templated
UI on a richer browser.

<p>

<Acme:SourceRef runat="server" Path="WritingControls/UserControl" />

<p>

Mobile user controls also differ from pages in the following ways:

<ul compact>

<li>User controls do not need to contain a <b>Form</b> control. If they do not,
they can be placed inside a form on a mobile page. 
<li>Because a top-level user control inherits from neither the 
<b>MobileControl</b> nor the <b>MobilePage</b> class, you cannot override methods
specific to either of them. 
For example, the <b>OnDeviceCustomize</b> method is not available to a top-level user control.

</ul>

<p>

<a name="Custom"></a>
<span class="subhead">Custom Controls</span><br>

<p>

Unlike user controls, custom controls require you to write separate 
classes in a common language runtime language of your choice, and compile them into assemblies.
However, this gives you the added flexibility to create complex controls.

<p>

When creating custom controls, you can use one or more of the following general 
techniques:

<ul compact>
<li><b>Inheritance</b>. Write a control by inheriting from an existing mobile
control class, and add custom properties, methods, events, or behavior. 
<li><b>Composition</b>. Write a composite control by combining existing mobile controls.
<li><b>Device-specific composition</b>. Write a control that composes itself differently
depending on the target device. For example, a control may use a series of
images on one set of devices, and a list control on another.
<li><b>Writing from scratch</b>. Write a control that inherits directly from the
<b>System.Web.UI.MobileControl</b> class and provides its own functionality and behavior.
</ul>

The first two techniques,Inheritance and Composition, are fairly easy. 
The latter two, Device-specific Composition and Writing from Scratch,
are more difficult because they require device-specific behavior. 
Some of the issues you face in writing these controls are described in the following sections.

<p>

<a name="Inheritance"></a>
<span class="subhead">Using Inheritance</span><br>

<p>

With inheritance, you can attach
custom functionality and behavior to an existing mobile control, while relying on the base control
for rendering and interaction. Things you can do with this type of inheritance 
include:

<ul compact>

<li>Predefining style and other properties for a control.
<li>Adding richer data-binding behavior. 
<li>Processing a control's own events, generating higher-level events or automatically
updating data.

</ul>

<p>

The following sample illustrates a <b>Menu</b> control by inheriting from the <b>List</b> control class.
The <b>Menu</b> control includes the ability to generate a menu from the forms on the current
page.

<p>

<Acme:SourceRef runat="server" Path="WritingControls/Inheritance" />

<p>

<a name="Composite"></a>
<span class="subhead">Writing a Composite Control</span><br>

<p>

A composite control creates one or more existing controls as its children.
Composite controls are equivalent to user controls in the following way.
The techniques for creating mobile controls that use composition 
are the same as for any ASP.NET composite control.
Because all rendering is done by children of the control, your control
does not require any device-specific behavior.

<p>
    
When writing a composite mobile control, it is helpful for your control to inherit
from the <b>Panel</b> control. This is because the the ASP.NET page framework
treats the <b>Panel</b>control differently than other controls.
For example, making your  control inherit from the <b>Panel</b> control ensures
that it is not divided across multiple pages of a paginated form.

<p>

The following sample shows a composite control.

<p>

<Acme:SourceRef runat="server" Path="WritingControls/Composite" />

<p>

<a name="Advanced"></a>
<span class="subhead">Writing Advanced Controls</span><br>

<p>

A mobile control that requires very customized rendering or 
interaction presents unique challenges. 

<p>

When writing ordinary ASP.NET server controls, it is customary to override
the <b>Render</b> method and add custom rendering. 
However, for a mobile control, such rendering is usually device specific. 
Mobile controls are designed to contain no 
device-specific logic, which allows a page written with
mobile controls to be reusable across a variety of devices, and allows support
for new devices to be added without changes to an application.

<p>

The solution to this problem lies in the architecture of the ASP.NET page framework. 
ASP.NET adds the concept of <i>device adapters</i> to Web Forms.
When a device requests a page, ASP.NET chooses device adapters 
suitable for the device for each control on the page.
Device adapters implement a standard set of properties and methods, similar to controls
themselves. 
The control delegates all device-specific behavior to its adapter. 
For example, when a mobile control receives a call to its <b>Render</b>
method, it automatically calls the adapter method of the same name.

<p>

To write a custom control that includes device-specific logic, you must write
the control and a set of device adapters, one for each category of 
device that you want to support.
Although the concept of writing device adapters is beyond the scope of this QuickStart, there
is an example of a 
<a href="TimerForm.aspx">custom Timer control</a>
provided in the QuickStart that creates and uses device adapters.

<p>

For more information, see the ASP.NET page framework documentation for mobile controls.


<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
