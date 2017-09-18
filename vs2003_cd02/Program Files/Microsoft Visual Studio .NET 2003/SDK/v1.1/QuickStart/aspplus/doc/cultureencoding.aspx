<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Setting Culture and Encoding</span>

<p>
<div class="indent" style="font-family:Verdana;">
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
<a class="toc2" href="#encodings">Encodings</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
<a class="toc2" href="#cultureinfo">Using CultureInfo</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
<a class="toc2" href="#region">Using RegionInfo</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
<a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="encodings">
<span class="subhead">Encodings</span>

<p>
Internally, ASP.NET handles all string data as Unicode. By using the <b>ResponseEncoding</b>
attribute in the following sample, ASP.NET is asked to also send the page with
UTF-8 encoding. Note that any arbitrary encoding could be chosen without
affecting the .aspx file. ASP.NET also sets the <b>CharSet</b> attribute on the
<b>Content Type</b> of the HTTP header according to the value of <b>ResponseEncoding</b>.
This enables browsers to determine the encoding without a
metatag or having to guess the correct encoding from the content.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/CS/i18n_encodings.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_encodings.src"
  Icon="/quickstart/aspplus/images/encoding1.gif"
  Caption="C# i18n_encodings.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/VB/i18n_encodings.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_encodings.src"
  Icon="/quickstart/aspplus/images/encoding1.gif"
  Caption="VB i18n_encodings.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/JS/i18n_encodings.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_encodings.src"
  Icon="/quickstart/aspplus/images/encoding1.gif"
  Caption="JScript i18n_encodings.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Note:</b> If some characters appear
as empty rectangles, you must install the additional language
support for Japanese and Hebrew. To do this on a Windows 2000 platform, open <b>Regional Options</b> on the
<b>Control Panel</b> and add the required language support.

<p>

The preceding sample demonstrates how to use different national character sets
on the same page. The page contains English text (ASCII), German
text with one umlaut character, Japanese text, and Hebrew
text (uses dir="rtl"). The source for the page itself is stored
with codepage-neutral UTF-8 encoding, as specified in Web.config.

<div class="code"><xmp>
<configuration>
  <system.web>
    <globalization
       fileEncoding="utf-8"
       ...
    />
  </system.web>
</configuration>
</xmp></div>
<p>

The <b>Page</b> directive specifies <b>ResponseEncoding</b> on the page itself:

<div class="code"><pre>
&lt;%@Page ... ResponseEncoding="utf-8"%&gt;
</pre></div>
<p>

<b>Note:</b> The <b>ResponseEncoding</b> in Web.config is also specified as UTF-8,
so repeating it on the page is redundant. However, if the .aspx file is
moved to a server that does not use UTF-8, the file would still
specify the right encoding.


<!--BEGIN SECTION-->
<br>
<a name="cultureinfo">
<br>
<span class="subhead">Using CultureInfo</span>
<p>

Code on ASP.NET pages can use the <b>CultureInfo</b> class to supply
localized settings. In the following sample, the properties of
a culture, initially the culture of the server, is set as follows:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
culture = CultureInfo.CurrentCulture;
</Tab>

<Tab Name="VB">
culture = CultureInfo.CurrentCulture
</Tab>

<Tab Name="JScript">
culture = CultureInfo.CurrentCulture;
</Tab>

</Acme:TabControl><p>

If the name of a new culture is submitted, it will be used
instead:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
culture = new CultureInfo(NewCulture.Value);
</Tab>

<Tab Name="VB">
culture = New CultureInfo(NewCulture.Value)
</Tab>

<Tab Name="JScript">
culture = new CultureInfo(NewCulture.Value);
</Tab>

</Acme:TabControl><p>

The submitted culture is set to be the new default value and
some properties are displayed:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%
Thread.CurrentThread.CurrentCulture = culture;
%&gt;
...
Current Culture is &lt;%= CultureInfo.CurrentCulture.Name %&gt;
(&lt;%=Thread.CurrentThread.CurrentCulture.Name%&gt;),
&lt;%= CultureInfo.CurrentCulture.EnglishName %&gt;/&lt;%=CultureInfo.CurrentCulture.NativeName%&gt;,
The localized date is: &lt;%= DateTime.Now.ToString("D", CultureInfo.CurrentCulture) %&gt;
</Tab>

<Tab Name="VB">
&lt;%
Thread.CurrentThread.CurrentCulture = culture
%&gt;
...
Current Culture is &lt;%= CultureInfo.CurrentCulture.Name %&gt;
(&lt;%=Thread.CurrentThread.CurrentCulture.Name%&gt;),
&lt;%= CultureInfo.CurrentCulture.EnglishName %&gt;/&lt;%=CultureInfo.CurrentCulture.NativeName%&gt;,
The localized date is: &lt;%= DateTime.Now.ToString("D", CultureInfo.CurrentCulture) %&gt;
</Tab>

<Tab Name="JScript">
&lt;%
Thread.CurrentThread.CurrentCulture = culture;
%&gt;
...
Current Culture is &lt;%= CultureInfo.CurrentCulture.Name %&gt;
(&lt;%=Thread.CurrentThread.CurrentCulture.Name%&gt;),
&lt;%= CultureInfo.CurrentCulture.EnglishName %&gt;/&lt;%=CultureInfo.CurrentCulture.NativeName%&gt;,
The localized date is: &lt;%= DateTime.Now.ToString("D", CultureInfo.CurrentCulture) %&gt;
</Tab>

</Acme:TabControl><p>

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/CS/i18n_cultureinfo.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_cultureinfo.src"
  Icon="/quickstart/aspplus/images/encoding2.gif"
  Caption="C# i18n_cultureinfo.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/VB/i18n_cultureinfo.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_cultureinfo.src"
  Icon="/quickstart/aspplus/images/encoding2.gif"
  Caption="VB i18n_cultureinfo.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/JS/i18n_cultureinfo.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_cultureinfo.src"
  Icon="/quickstart/aspplus/images/encoding2.gif"
  Caption="JScript i18n_cultureinfo.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="region">
<br>
<span class="subhead">Using RegionInfo</span>
<p>

Code on ASP.NET pages can also use the <b>RegionInfo</b> class to supply
regional settings. In the following sample, the properties of a region are displayed.
The initial display is the server's default region.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
region = RegionInfo.CurrentRegion;
...
Current region is &lt;%= region.EnglishName %&gt; (&lt;%=region.DisplayName%&gt;),
currency is &lt;%= region.CurrencySymbol %&gt;.
</Tab>

<Tab Name="VB">
region = RegionInfo.CurrentRegion
...
Current region is &lt;%= region.EnglishName %&gt; (&lt;%=region.DisplayName%&gt;),
currency is &lt;%= region.CurrencySymbol %&gt;.
</Tab>

<Tab Name="JScript">
region = RegionInfo.CurrentRegion;
...
Current region is &lt;%= region.EnglishName %&gt; (&lt;%=region.DisplayName%&gt;),
currency is &lt;%= region.CurrencySymbol %&gt;.
</Tab>

</Acme:TabControl><p>

On subsequent requests the entered region is displayed:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
region = new RegionInfo(NewRegion.Value);
</Tab>

<Tab Name="VB">
region = New RegionInfo(NewRegion.Value)
</Tab>

<Tab Name="JScript">
region = new RegionInfo(NewRegion.Value);
</Tab>

</Acme:TabControl><p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/CS/i18n_regional.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_regional.src"
  Icon="/quickstart/aspplus/images/encoding3.gif"
  Caption="C# I18N_Regional.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/VB/i18n_regional.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_regional.src"
  Icon="/quickstart/aspplus/images/encoding3.gif"
  Caption="VB I18N_Regional.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/i18n/JS/i18n_regional.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/i18n/i18n_regional.src"
  Icon="/quickstart/aspplus/images/encoding3.gif"
  Caption="JScript I18N_Regional.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET can use pages that are stored with UTF-8 encoding to support different national characters.
<li>The <b>CultureInfo</b> class can be set and used programmatically to localize pages.
<li>The <b>RegionInfo</b> class can be used to provide regional settings on ASP.NET pages.
</ol>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->









