<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Using Mobile Capabilities</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#WhatIs">Mobile Capabilities</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Using">Using Mobile Capabilities</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#CustomFilters">Custom Device Filters</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="WhatIs"></a>
<span class="subhead">Mobile Capabilities</span><br>

<p>

Microsoft ASP.NET is designed to support a variety of mobile devices, and is built
on an extensible architecture that allows future support for additional devices.
These mobile devices may vary greatly in capabilities, such as screen resolution,
color, or the type of input devices available. These differences affect the way
ASP.NET mobile Web Forms pages are rendered.

<p>

To work with these differences, ASP.NET includes an extensible mobile 
capabilities component built on the browser capabilities feature of ASP.NET. 
This component identifies the client device, collects capability 
information from multiple sources, and makes this information available to the 
mobile Web Forms page and the ASP.NET mobile controls. 
This capability information is also available to your application in case
you want to alter your application logic for different devices.

<p>

The following sample provides a browser for all the properties available to you
from the <b>MobileCapabilities</b> object. Many of these properties are standard to
any ASP.NET installation, and are not relevant for mobile Web applications.

<p>

<Acme:SourceRef runat="server" Path="DeviceCapabilities/Browser" />

<p>

<a name="Using"></a>
<span class="subhead">Using Mobile Capabilities</span><br>

<p>

The <b>MobileCapabilities</b> object provides a 
large number of capability properties for your application and mobile Web Forms page. 
There are a number of ways you can use these properties.

In previous sections, you saw samples that use the <b>DeviceSpecific</b> element 
to provide device-specific choices. Examples of the <b>DeviceSpecific</b> element include 
template sets and image choices. The <b>Filter</b> 
attribute of each <b>Choice</b> element within a <b>DeviceSpecific</b> element is evaluated through 
a <b>MobileCapabilities</b> object.

<p>

The <b>MobileCapabilities</b> object also provides a number of typesafe properties, 
such as <b>MobileDeviceModel</b>. You can access the <b>MobileCapabilities</b> object through 
the <b>Request.Browser</b> property. However, to use the typesafe properties 
specific to mobile capabilities, you must explicitly cast this object to 
the <b>System.Web.Mobile.MobileCapabilities</b> class. The following code fragment
demonstrates how to do this in C#.

<p>

<div class="code"><xmp style="padding-left:0px">
using System.Web.Mobile;
MobileCapabilities capabilities = 
    (MobileCapabilities)Request.Browser;
String deviceModel = capabilities.MobileDeviceModel;
</xmp></div>

<p>

<a name="CustomFilters"></a>
<span class="subhead">Custom Device Filters</span><br>

<p>

In the <a href="/MobileQuickStart/?url=doc/DeviceSpecific.aspx" target="_top">Device-Specific Content</a>
section, you saw how to set up device filters.
The basic device filters shown in that section compare only a single
capability property of a device against a fixed value.
However, you can write your own device filters to perform more complex tests.

<p>

To write and install a custom device filter, complete the following steps:

<p>

<ol compact>
<li>Create a new file that uses the common language runtime programming language of your choice.
<li>Add a new class and a new static method to that class. The method takes
a <b>MobileCapabilities</b> object and a comparison string as arguments. 
<li>Write your custom code in the method, and return <b>true</b> or <b>false</b> to 
indicate whether the device matches the filter.
<li>Compile the file into an assembly, and place it in the application /bin directory.
<li>Add another <b>&lt;filter&gt;</b> entry to the web.config file, with the attributes shown in the following sample code. Specify the assembly-qualified name of the class in the <b>type</b> attribute,
and the name of the method in the <b>method</b> attribute.
</ol>

<p>

The sample that follows adds 20 new device filters. When you run the sample, the page evaluates each of
these filters and displays the results. Although this selection of filters may seem 
haphazard, it is intended to demonstrate different techniques for building filters and provide a
number of useful filters. An application writer will know what filters are appropriate
for their application. More useful device-specific usage scenarios will involve
the use of these filters in a <b>&lt;Choice&gt;</b> tag to provide device-specific property overrides
and template sets, as described in the
<a href="/MobileQuickStart/?url=doc/DeviceSpecific.aspx" target="_top">Device-Specific Content</a>
section.

<p>

Note that the source code provided for this example shows the .aspx page, the Microsoft Visual Basic and C# code that defines
the static filter methods, and the relevant web.config files for defining the filters themselves.
<p>

<Acme:SourceRef runat="server" Path="DeviceCapabilities/CustomFilters" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
