<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Retrieving Configuration</span>

<p>
ASP.NET allows developers to access configuration settings from within an application either by exposing
configuration settings directly (as strongly typed properties) or by using general configuration APIs.  The
following sample shows a page that accesses the <b>&lt;browserCaps&gt;</b> configuration section using the
<b>Browser</b> property of the <b>System.Web.HttpRequest</b> class.  This is a hash table of attributes that
reflect the capabilities of the browser client that is currently accessing the page. The actual
<b>&lt;browserCaps&gt;</b> section data is included in the machine.config file.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/CS/browscaps.aspx"
  ViewSource="/quickstart/aspplus/samples/config/browscaps.src"
  Icon="/quickstart/aspplus/images/browscaps.gif"
  Caption="C# BrowsCaps.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/VB/browscaps.aspx"
  ViewSource="/quickstart/aspplus/samples/config/browscaps.src"
  Icon="/quickstart/aspplus/images/browscaps.gif"
  Caption="VB BrowsCaps.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/JS/browscaps.aspx"
  ViewSource="/quickstart/aspplus/samples/config/browscaps.src"
  Icon="/quickstart/aspplus/images/browscaps.gif"
  Caption="JScript BrowsCaps.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In addition to accessing configuration settings, as demonstrated above, developers also can use the
<b>System.Configuration.ConfigurationSettings</b> class to retrieve the data for any
arbitrary configuration section.  Note that the particular object returned by <b>ConfigurationSettings</b>
depends on the section handler mapped to the configuration section (see
<b>IConfigurationSectionHandler.Create</b>).

The following code demonstrates how you can access the configuration data exposed for a <b>&lt;customconfig&gt;</b>
section.  In this example, it is assumed that the configuration section handler returns an object of type
<b>CustomConfigSettings</b> with the property <b>Enabled</b>.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
CustomConfigSettings config = (CustomConfigSettings) ConfigurationSettings.GetConfig("customconfig");

if (config.Enabled == true) {
    // Do something here.
}
</Tab>
<Tab Name="VB">
Dim config As CustomConfigSettings = CType(ConfigurationSettings.GetConfig("customconfig"), CustomConfigSettings)

If config.Enabled = True Then
    ' Do something here.
End If
</Tab>
<Tab Name="JScript">
var config:CustomConfigSettings = CustomConfigSettings(ConfigurationSettings.GetConfig("customconfig"));

if (config.Enabled == true) {
    // Do something here.
}
</Tab>

</Acme:TabControl><p>

<h5>Using Application Settings</h5>
Configuration files are perfectly suited for storing custom application settings, such as database
connection strings, file paths, or remote XML Web service URLs. The default configuration sections (defined
in the machine.config file) include an <b>&lt;appSettings&gt;</b> section that may be used to store these settings as name/value
pairs.  The following example shows an <b>&lt;appSettings&gt;</b> configuration section that defines database
connection strings for an application.

<p>
<div class="code"><pre>
&lt;configuration&gt;
  &lt;appSettings&gt;
    &lt;add key="pubs" value="server=(local)\NetSDK;database=pubs;Integrated Security=SSPI" /&gt;
    &lt;add key="northwind" value="server=(local)\NetSDK;database=northwind;Integrated Security=SSPI" /&gt;
  &lt;/appSettings&gt;
&lt;/configuration&gt;
</pre></div>

The <b>ConfigurationSettings</b> object exposes a special <b>AppSettings</b> property that can be used to retrieve
these settings:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
String dsn = ConfigurationSettings.AppSettings["pubs"];
</Tab>
<Tab Name="VB">
Dim dsn As String = ConfigurationSettings.AppSettings("pubs")
</Tab>
<Tab Name="JScript">
var dsn:String = ConfigurationSettings.AppSettings["pubs"];
</Tab>
</Acme:TabControl><p>

The following sample illustrates this technique.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/CS/config1.aspx"
  ViewSource="/quickstart/aspplus/samples/config/config1.src"
  Icon="/quickstart/aspplus/images/config.gif"
  Caption="C# Config1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/VB/config1.aspx"
  ViewSource="/quickstart/aspplus/samples/config/config1.src"
  Icon="/quickstart/aspplus/images/config.gif"
  Caption="VB Config1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/config/JS/config1.aspx"
  ViewSource="/quickstart/aspplus/samples/config/config1.src"
  Icon="/quickstart/aspplus/images/config.gif"
  Caption="JScript Config1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->