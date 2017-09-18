<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Image, AdRotator, Calendar, and PhoneCall</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Images">Displaying Images</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#AdRotator">Showing an Ad Rotator</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Phone">Allowing the User to Make Phone Calls</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Calendar">Choosing a Date with the Calendar Control</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="Images"></a>
<span class="subhead">Displaying Images</span><br>

<p>

Images pose a unique challenge for authoring mobile Web applications because their appearance is so dependent
on the characteristics of the device that they will be displayed on. The mobile Web Forms controls provide
an <b>Image</b> control that allows different versions of an image to be rendered, based on
device characteristics.

<p>
The following sample chooses between three images, based on the preferred image type of the
requesting device.
<p>
<Acme:SourceRef runat="server" Path="SpecialFeatures/Image" />
<p>

<a name="AdRotator"></a>
<span class="subhead">Showing an Ad Rotator</span><br>

<p>
The Microsoft ASP.NET <b>AdRotator</b> control cycles through a number of images and displays each with
a hyperlink for the image.
The mobile version of the <b>AdRotator</b> control serves the same purpose  for devices that cannot
display UI as rich as many HTML browsers. Descriptive text appears in place of the specified image. In addition, the mobile <b>AdRotator</b> control allows specification of separate image
URLs to display different images on different devices.
<p>
The control uses an XML <i>advertisement file</i> that is described in the
ASP.NET Mobile Controls documentation.
<p>
The following sample displays an <b>AdRotator</b> control that cycles among three advertisements that provide alternate images from the advertisement file for devices accepting GIF, BMP,
and WBMP files.

<p>
<Acme:SourceRef runat="server" Path="SpecialFeatures/AdRotator" />
<p>

<a name="Phone"></a>
<span class="subhead">Allowing the User to Make Phone Calls</span><br>

<p>
Certain mobile devices, such as cell phones, can originate phone calls
when the user makes a selection.  The <b>PhoneCall</b> control provides a way for
an application to encapsulate this action so that when the application is visited
from a device that is capable of making phone calls, a UI is presented to do so.
When the application is visited from a device that cannot make phone calls,
either label text or a link is displayed.

<p>
<Acme:SourceRef runat="server" Path="SpecialFeatures/Call" />
<p>

<p>
<a name="Calendar"></a>
<p>
<span class="subhead">Choosing a Date with the Calendar Control</span><br>
<p>
The ASP.NET <b>Calendar</b> control allows the convenient selection of a date. The mobile
version of the <b>Calendar</b> control serves the same purpose, but on devices that cannot
display as rich of a calendar as many HTML browsers, a reduced version is used, or
a version that presents an interaction that consists of a number of screens.
<p>
The following example uses a <b>Calendar</b> control to allow the user to choose a date.
That chosen date is then displayed.
<p>
<Acme:SourceRef runat="server" Path="SpecialFeatures/Calendar" />
<p>


<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
