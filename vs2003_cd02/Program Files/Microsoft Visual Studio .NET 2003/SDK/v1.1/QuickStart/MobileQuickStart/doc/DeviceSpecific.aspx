<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Device-Specific Content</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Filters">Device Filters</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#DeviceSpecific">DeviceSpecific and Choice</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Overrides">Property Overrides</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Using">Templates and Template Sets</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#List">A Templated List</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Form">A Templated Form</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Stylesheet">Template Sets in Stylesheets</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Arbitrary">Inserting Arbitrary Content</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Programming">Device-Specific Programming</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="Filters"></a>
<span class="subhead">Device Filters</span><br>

<p>

To create and use device-specific content, you must first configure a set of 
device filters for your application. 
The ASP.NET page framework uses these device filters to choose device-specific content
for a target device.
Device filters do not have to be exclusive—a single device can
match multiple filters.

<p>

To define a device filter, you need to create a <b>&lt;deviceFilters&gt;</b>
section in the application's web.config file, and add a <b>&lt;filter&gt</b>
element to it. The following code example shows a basic device filter.

<p>

<div class="xmpcode">
&lt;system.web&gt;<br>
&nbsp;&nbsp;&lt;deviceFilters&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter name="IsColor" compare="IsColor" argument="true" /&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter name="IsPocketIE" compare="Browser" argument="Pocket IE" /&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;filter name="IsHTML" compare="PreferredRenderingMIME"<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;argument="text/html" /&gt;<br>
&nbsp;&nbsp;&lt;/deviceFilters&gt;<br>
&lt;/system.web&gt;
</div>

<p>

The <b>name</b> attribute gives the filter a name that you can use to refer to the filter
in ASP.NET mobile Web Forms pages.
The remaining attributes define how the filter is tested.
To test a device against a filter, the framework checks the device capability named in the
<b>compare</b> attribute against the value specified in the <b>argument</b> attribute.

<p>
    
The set of available capabilities can be found in the reference for the 
<b>System.Web.UI.Mobile.Controls.MobileCapabilities</b> class. You can also write more complex filters,
as described in the topic 
<a href="/MobileQuickStart?url=doc/Capabilities.aspx" target="_top">Using Mobile Capabilities</a>.

<p>

<a name="DeviceSpecific"></a>
<span class="subhead">DeviceSpecific and Choice</span><br>

<p>

To define device-specific content declaratively on your page, you can use a <b>&lt;DeviceSpecific&gt;</b>
tag. You can declare this tag as a child of any mobile Web Forms control on the page.
The following is an example of a <b>&lt;DeviceSpecific&gt;</b> tag added to a <b>Label</b> mobile control.

<p>

<div class="xmpcode">
&ltmobile:Label runat="server" &gt;<br>
&nbsp;&nbsp;&lt;DeviceSpecific&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;Choice Filter="IsPocketIE" Text="Running on Pocket IE" /&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;Choice Filter="IsHTML" Text="Running on other HTML device" /&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;Choice Text="Running on other device" /&gt;<br>
&nbsp;&nbsp;&lt;/DeviceSpecific&gt;<br>
&lt;/mobile:Label&gt;
</div>

<p>

When a device requests the page, the ASP.NET page framework checks each defined <b>&lt;Choice&gt;</b>
tag in order. For each choice, it tests the filter specified by the <b>filter</b> attribute.
If the filter matches the target device, that choice is picked.
The last choice (in the previous example) has no filter attribute,
and is thus picked by default if none of the choices above it match.
A default choice is optional.

<p>

<a name="Overrides"></a>
<span class="subhead">Property Overrides</span><br>

<p>

In the previous example, each choice has a <b>Text</b> property declared.
When a choice is picked, the <b>Label</b> control applies the value of this property to itself,
overriding any value that may have been set for its own <b>Text</b> property. 
This is called a <i>property override</i>.

<p>

You can use this technique for almost any property defined for a parent control. 
The following examples show the various ways you can use property overrides:

<ul compact>
<li>Override the <b>Text</b> property to show abbreviated titles or messages on smaller displays.
<li>Override the <b>TargetURL</b> property of a <b>Link</b> control to allow the user to access device-specific external links.
<li>Override the <b>ImageURL</b> property to show alternate images for different displays. (This
technique is demonstrated in the <b>Image</b> control sample in the following section.)
<li>Override properties in a <b>Style</b> element to create a single style that renders differently
depending on the device. The following sample shows how to create a property override that renders in a device-specific manner.
</ul>

<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/Override" />

<p>

<a name="Using"></a>
<span class="subhead">Templates and Template Sets</span><br>

<p>

For richer customization of controls, mobile Web Forms pages provide a feature called
<i>template sets</i>. Template sets are built on the ASP.NET Web Forms template mechanism.
In Web Forms, controls can provide templated rendering, allowing you to customize their
appearance by using one or more templates.

<p>

Templated mobile controls extend the idea of templates to the multidevice world,
by allowing you to specify multiple sets of templates. 
To define templates for a mobile control, you create a <b>&lt;DeviceSpecific&gt;</b> tag and
one or more <b>&lt;Choice&gt;</b> tags. 
Each <b>&lt;Choice&gt;</b> tag can contain templates defined for the control.

<p>

If a choice that contains templates is picked for a target device, the control uses
these templates to render the information. Otherwise, the control uses its default rendering.
This mechanism allows you to customize the control for specific devices, 
and fall back on the adaptive rendering of the control for others.

<p>

In the following samples, you need to have some familiarity with templated controls.
For more background, see the Data Access and Customization section in the 
<a href="/quickstart/aspplus/default.aspx" target="_top">ASP.NET QuickStart tutorial</a>.
Note that this tutorial
is only available if you have installed the .NET Framework samples on this computer.

<p>

<a name="List"></a>
<span class="subhead">A Templated List</span><br>

<p>

The <b>List</b> mobile control allows you to define a similar set of templates as the
Web Forms <b>Repeater</b> control. The following sample demonstrates how you can define a
template set for a list. The template set shown here is chosen only when the rendering format is HTML.
The sample also describes how to perform data binding inside a template, and how to use 
an interactive object, such as a Microsoft ASP.NET <b>LinkButton</b> server control, to generate list events.

<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/List" />

<p>

<a name="Form"></a>
<span class="subhead">A Templated Form</span><br>

<p>

Similar to the <b>List</b> control, the <b>Form</b> mobile control also supports templated rendering.
If you define a <b>&lt;Choice&gt;</b> tag that contains a <b>HeaderTemplate</b> or a <b>FooterTemplate</b>,
and the choice is picked for the target device,
the form will emit the contents of the defined templates as the header and footer. 

<p> 

You can even define a <b>device-independent</b> template set for a form, where each 
defined template contains mobile controls. To do this, use a <b>&lt;Choice&gt;</b> tag without a filter
attribute.

<p>

The following sample shows how to create multiple template sets for a <b>Form</b> mobile control.
It illustrates how you can provide a device-independent template set. Because it is the last
choice listed, and has no filter, it is chosen for default rendering.

<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/Form" />

<p>

<a name="Stylesheet"></a>
<span class="subhead">Template Sets in Stylesheets</span><br>

<p>

As with styles, you can share template sets for a control by placing them in a 
<b>&lt;Style&gt;</b> element in a style sheet. By setting the <b>StyleReference</b> 
property of a templated mobile control, you can make it inherit template sets from the
style. The following sample illustrates how you can take the template sets defined in
the preceding sample, move them to a style sheet, and share them among multiple forms.


<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/Stylesheet" />

<p>

<a name="Arbitrary"></a>
<span class="subhead">Inserting Arbitrary Content</span><br>

<p>

Sometimes, you may want to insert a block of markup for a specific device into your mobile form. 
To do this, you need to add a <b>Panel</b> mobile control to your form,
and define a <b>&lt;Choice&gt;</b> tag with a <b>ContentTemplate</b>.
If the panel has no other choices, it will render only if the defined choice
matches the target device. 
    
<p>

The following sample includes blocks of markup rendered only to HTML devices.

<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/Arbitrary" />

<p>

<a name="Programming"></a>
<span class="subhead">Device-Specific Programming</span><br>

<p>

You can also programmatically control the appearance and behavior of your pages on 
a per-device basis.
The <b>MobileCapability</b> class has a method called the <b>HasCapability</b> method, which is
used to evaluate filters. 
Alternatively, you can evaluate capabilities directly.
For more information about how to use mobile capabilities, see the 
<a href="/MobileQuickStart?url=doc/Capabilities.aspx" target="_top">Using Mobile Capabilities</a> section.

<p>

The following sample presents a form, and then browses to one of two different menus,
depending on the capabilities of the target device.

<p>

<Acme:SourceRef runat="server" Path="DeviceSpecific/Programming" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
