<%@Page Language="C#" ResponseEncoding="utf-8" %>
<%@Import Namespace="System.Globalization"%>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Internationalization Overview</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
  <a class="toc2" href="#encoding">Encoding Support</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
  <a class="toc2" href="#localization">Localization Support</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
  <a class="toc2" href="#config">Configuration Settings</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
  <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="encoding">
<span class="subhead">Encoding Support</span>
<p>

ASP.NET internally uses Unicode. In addition, ASP.NET utilizes the <b>String</b> class of the
.NET Framework class library and the related utility functions, which are also
internally Unicode. When interfacing with the outside world, ASP.NET can
be configured in several ways to use a defined encoding, which includes the encoding
of .aspx files, request data, and response data. For example, it is possible to
store .aspx files with Unicode encoding and convert the HTML output of a page to an
ANSI code page like <nobr>ISO-8859-1</nobr>.

<!--BEGIN SECTION-->
<br>
<a name="localization">
<br>
<span class="subhead">Localization Support</span>
<p>

Properties of a locale are accessible through the <b>CultureInfo</b> class.
Additionally, ASP.NET tracks two properties of a default culture per thread and request:
<b>CurrentCulture</b> for the default of locale-dependent functions
and <b>CurrentUICulture</b> for locale-specific lookup of resource data.
<p>

The following code displays the culture values on the Web server.
Note that the <b>CultureInfo class</b> is fully qualified.
<div class="code"><pre>
&lt;%@Import Namespace="System.Globalization"%&gt;
...
&lt;%=CultureInfo.CurrentCulture.NativeName%&gt;
&lt;%=CultureInfo.CurrentUICulture.NativeName%&gt;
</pre></div>

<p>
The result is as follows:
<p>

<div class="code">
<%=System.Globalization.CultureInfo.CurrentCulture.NativeName%> <br>
<%=System.Globalization.CultureInfo.CurrentUICulture.NativeName%>
</div>
<p>

For locale-dependent data like date/time formats or currency, ASP.NET leverages
the support of the .NET Framework class library in the common language runtime.
Code on ASP.NET pages can use locale-dependent formatting routines like
<b>DateTime.Format</b>. For example, the following code displays the current
date in a long format: the first line according to the system locale, the second
one according to the German ("de") locale:

<div class="code"><pre>
&lt;%=DateTime.Now.ToString("f")%&gt;
&lt;%=DateTime.Now.ToString("f", new System.Globalization.CultureInfo("de-DE"))%&gt;
</pre></div>

<p>
The result is as follows:
<p>

<div class="code">
<%=DateTime.Now.ToString("f")%><br>
<%=DateTime.Now.ToString("f", new System.Globalization.CultureInfo("de-DE"))%>
</div>


<!--BEGIN SECTION-->

<a name="config">
<br>
<span class="subhead">Configuration Settings</span>
<p>

When creating ASP.NET pages or code-behind modules, developers can use the
.NET Framework class library to provide features necessary for a globalized environment
or to localize the application.
ASP.NET also provides configuration settings to ease development and
administration of ASP.NET applications.
<p>

ASP.NET utilizes configuration files to provide directory settings that are
usually also inherited by subdirectories. Each file can contain a
<b>Globalization</b> section in which you can specify default encodings and cultures. Values are valid if they are accepted by the related classes
<b>Encoding</b> and <b>CultureInfo</b>.  You can find more information about the <b>Encoding</b> and <b>CultureInfo</b>
classes in the .NET Framework SDK.

<div class="code"><xmp>
<configuration>
  <system.web>
    <globalization
       fileEncoding="utf-8"
       requestEncoding="utf-8"
       responseEncoding="utf-8"
       culture="en-US"
       uiCulture="de-DE"
    />
  </system.web>
</configuration>
</xmp></div>

Within the <b>Globalization</b> section, the value of <b>fileEncoding</b> determines
the way in which ASP.NET encodes .aspx files; the values of
<b>requestEncoding</b> and <b>responseEncoding</b> determine the way in which request data and
response data are encoded, respectively.
<p>

The attributes of the <b>Globalization</b> section in the Web.config file can also be specified on
the <b>Page</b> directive (with the exception of <b>fileEncoding</b>, because it applies
to the file itself). These settings are only valid for a specific page and override
the settings of the Web.config file. The following sample directive specifies that the
page should use French culture settings and UTF-8 encoding for the response:

<div class="code"><pre>
&lt;%@Page Culture="fr-FR" UICulture="fr-FR" ResponseEncoding="utf-8"%&gt;
</pre></div>
<p>

<b>Note:</b> Within a page, the culture values can be changed programmatically by setting
<b>Thread.CurrentCulture</b> and <b>Thread.UICulture</b>.
<p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET supports a wide range of encodings for .aspx files, request data, and response data.
<li>Support for locale-dependent data is provided by the <b>CultureInfo</b> class, where the two
values <b>CurrentCulture</b> and <b>CurrentUICulture</b> are tracked.
<li>Internationalization settings can be configured for each computer, for each directory, and for each page.
</ol>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->