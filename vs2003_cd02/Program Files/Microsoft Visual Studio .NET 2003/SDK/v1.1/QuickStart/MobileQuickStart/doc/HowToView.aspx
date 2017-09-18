<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Viewing the Samples</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#PocketPCEmu">Using a Microsoft Pocket PC or Emulator</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#OtherEmu">Using Other Emulators</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#CellPhone">Using a Cell Phone or Other Wireless Device</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#NoCookies">Devices Without Cookies</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>


You can view the samples in the Mobile Controls QuickStart with a variety of
devices and emulators. For a complete list of supported devices and
emulators, consult the ASP.NET documentation.

<p>

Because ASP.NET mobile Web Forms can produce HTML, you can also view a mobile Web application on your desktop browser.
When you click a link for a sample that is marked <font color="darkred">[Run Sample]</font> in this tutorial, 
you will view the corresponding sample in a small framed area on your desktop browser.
This preview works on Microsoft Internet Explorer, or any other browser that
supports inline frames.

<p>

<a name="PocketPCEmu"></a>
<span class="subhead">Using a Microsoft Pocket PC or Emulator</span><br>

<p>

You can view pages authored for mobile devices by using Microsoft Internet Explorer for the Pocket PC.
To view pages with a Pocket PC, you must have network or wireless connectivity.
If your wireless connectivity is through a public carrier, follow the instructions
in the section titled Using a Cellular Phone.

<p>

An emulator for the Pocket PC is available as part of Microsoft Embedded Visual Tools 3.0,
and is available as a <a href="http://go.microsoft.com/fwlink/?LinkId=7250" target="_new">free download</a>.
When installing the tools, be sure to install the Pocket PC emulation environment.
To view pages created for mobile devices on this emulator,
an additional patch that provides Microsoft JScript support is required. This patch
is available as <a href="http://support.microsoft.com/support/kb/articles/Q296/9/04.ASP" target="_new">Knowledge
Base article Q296904</a>.

<p>

You can view the samples by using the emulator to browse to 
<u>http://<i>server name</i>/MobileQuickStart/Samples/default.aspx</u>, where
<i>server name</i> is the name of your server. 
You can bookmark this URL for faster future access.

<p>

<a name="OtherEmu"></a>
<span class="subhead">Using Other Emulators</span><br>

<p>

To view the samples with another supported emulator, you must first install
and configure the emulator to access the Web server where the QuickStart is 
installed.
This may require you to publish the QuickStart on a server accessible from the
Internet, or to configure the emulator to work with a proxy.
You can view the samples by using the emulator to browse to 
<u>http://<i>server name</i>/MobileQuickStart/Samples/default.aspx</u>, where
<i>server name</i> is the name of your server. 

<p>

<a name="CellPhone"></a>
<span class="subhead">Using a Cell Phone or Other Wireless Device</span><br>

<p>

To view the QuickStart samples with an Internet-enabled cell phone or other wireless
device, first ensure that the samples are accessible from the Internet. If your Web server is
behind a proxy or firewall, you must configure it to accept requests from the Internet. 
After you access your Web server from your cell phone, you can use the device to browse to 
<u>http://<i>server name</i>/MobileQuickStart/Samples/default.aspx</u>, where
<i>server name</i> is the name of your server. 
Most devices will allow you to bookmark this URL for easier future access.
<p>
Note also that the Mobile QuickStart samples are installed in such a way that Integrated
Windows authentication (NTLM) is required to access them. Because most devices do not
support Integrated Windows authentication, you will need
to configure the MobileQuickStart virtual directory to allow anonymous access 
for such devices to access the samples. Complete the following steps to configure the virtual directory
(these instructions are for systems running Microsoft Windows 2000; modify as appropriate if
you have a different system):
<ol>
  <li>Start the Internet Information Services (IIS) management tool by running <b>inetmgr</b> from a command prompt.
Or, click the <b>Start</b> button, and then click <b>Run</b>. In the <b>Tree</b> pane,</li>
  <li>Open the computer name node.</li>
  <li>Open the <b>Default Web Site</b> node.</li>
  <li>Right-click the MobileQuickStart virtual directory node.</li>
  <li>Click <b>Properties</b>.</li>
  <li>Click the <b>Directory Security</b> tab.</li>
  <li>In the <b>Anonymous access and authentication</b> section, click <b>Edit</b>.</li>
  <li>Select the <b>Anonymous access</b> check box.</li>
  <li>Click <b>OK</b>.</li>
  <li>Click <b>OK</b>.</li>
  <li>Close the IIS management tool.</li>
</ol>

<p>

<a name="NoCookies"></a>
<span class="subhead">Devices Without Cookies</span><br>

<p>

By default, Mobile Web applications use cookies 
on the client device to help maintain session state. However, some devices do not support 
cookies, or allow the user to turn off cookies. To support these devices, you must
configure your application to use cookieless session management. Do not rely on 
cookies in your application code. 
To learn how to turn on cookieless sessions in your mobile Web application,
consult the ASP.NET documentation.
<p>
This tutorial supports
cookieless devices through entries in the web.config file. To see an indication that cookieless support is enabled,
 look at the URL in the address bar of the browser. For example, the URL
to this page might be the following.

<p>
<div class="xmpcode">
http://localhost/MobileQuickStart/(p5bbz555jx3f34552km4bn55)/Default.aspx?url=doc/HowToView.aspx
</div>
<p>

The existence of <b>(p5bbz555jx3f34552km4bn55)</b>, or a similar token string, in the URL
indicates that cookieless sessions are enabled for this application.

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
