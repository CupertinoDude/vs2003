
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Configuration File Format</span>
<p>
ASP.NET configuration files are XML-based text files--each named web.config--that can
appear in any directory on an ASP.NET Web application server.

Each web.config file applies configuration settings to the directory it is located in and to all virtual child directories beneath it.   Settings in
child directories can optionally override or modify settings specified in parent directories. The root configuration file--WinNT\Microsoft.NET\Framework\&lt;version&gt;\config\machine.config--provides default configuration settings for the entire machine.
ASP.NET configures IIS to prevent direct browser access to web.config files to ensure that their values cannot become public (attempts to access them will cause ASP.NET to return
403: Access Forbidden).
</p>
<p>
At run time ASP.NET uses these web.config configuration files to hierarchically compute a unique collection of settings for each incoming
URL target request (these settings are calculated only once and then cached across subsequent requests; ASP.NET automatically
watches for file changes and will invalidate the cache if any of the configuration files change).
<p>
For example, the configuration settings for the URL http://myserver/myapplication/mydir/page.aspx would be computed by applying
web.config file settings in the following order:
<p>
<div class="code"><pre>
Base configuration settings for machine.
C:\WinNT\Microsoft.NET\Framework\v.1.00\config\machine.config

Overridden by the configuration settings for the site (or the root application).
C:\inetpub\wwwroot\web.config

Overridden by application configuration settings.
D:\MyApplication\web.config

Overridden by subdirectory configuration settings.
D:\MyApplication\MyDir\web.config
</pre></div>

If a web.config file is present at the root directory for a site, for example "Inetpub\wwwroot", its
configuration settings will apply to every application in that site.  Note that the presence of a web.config
file within a given directory or application root is completely optional.  If a web.config file is not
present, all configuration settings for the directory are automatically inherited from the parent directory.

<h5>Configuration Section Handlers and Sections</h5>

A web.config file is an XML-based text file that can contain standard XML document elements,
including well-formed tags, comments, text, cdata, and so on. The file may be ANSI, UTF-8, or Unicode; the
system automatically detects the encoding.

The root element of a web.config file is always a <b>&lt;configuration&gt;</b> tag.  ASP.NET and end-user settings are
then encapsulated within the tag, as follows:

<div class="code"><pre>
&lt;configuration&gt;
    &lt;!- Configuration settings would go here. --&gt;
&lt;/configuration&gt;
</pre></div>

All configuration information resides between the <b>&lt;configuration&gt;</b> and <b>&lt;/configuration&gt;</b> root XML tags. Configuration information between the tags is grouped into two main areas: the configuration section handler declaration area and the configuration section settings area.
<p>

<ul>

<li><b>Configuration section handlers</b> - The ASP.NET configuration infrastructure makes no
assumptions regarding the file format or supported settings within a web.config file.  Instead, it delegates
the processing of web.config data to configuration section handlers, .NET Framework classes
that implement the <b>IConfigurationSectionHandler</b> interface.  An individual
<b>IConfigurationSectionHandler</b> declaration needs to appear only once, typically in the machine.config file.
The web.config files in child directories automatically inherit this
declaration.  Configuration section handlers are declared within a web.config file using section
tag directives nested within a <b>&lt;configSections&gt;</b> tag.  Section tags may be further qualified
by section group tags to organize them into logical groups (see below).  Each section tag
identifies a tag name denoting a specific section of configuration data and an associated
<b>IConfigurationSectionHandler</b> class that processes it.
<p>

<li><b>Configuration section groups</b> - ASP.NET configuration allows hierarchical 
grouping of sections for organizational purposes.  A <b>&lt;sectionGroup&gt;</b> 
tag may appear inside a <b>&lt;configSections&gt;</b> tag or inside other 
<b>&lt;sectionGroup&gt;</b> tags.  For example, ASP.NET section handlers all 
appear within the <b>&lt;system.web&gt;</b>
section group.
<p>

<li><b>Configuration sections</b> - ASP.NET configuration settings are represented within configuration
tag sections, also nested within a <b>&lt;configuration&gt;</b> tag (and optional section group tags).
For each configuration section, an appropriate section handler must be defined in the config hierarchy.
For example, in the sample below, the tag <b>&lt;httpModules&gt;</b> is the configuration section that defines
the HTTP modules configuration data.  The <b>System.Configuration.HttpModulesConfigurationHandler</b>
class is responsible for interpreting the content contained within the <b>&lt;httpModules&gt;</b> tag at run time.
Note that both the section handler definition and the section must have the same section group qualifier
(in this case, <b>&lt;system.web&gt;</b>).  Also note that tag names are case-sensitive and must be typed exactly
as shown.  Various attributes and settings for ASP.NET are also case-sensitive and will not be examined by the
configuration runtime if the case does not match.
</ul>

<p>
<div class="code"><pre>
&lt;configuration&gt;

  &lt;configSections&gt;
    &lt;sectionGroup name="system.web"&gt;
      &lt;section
        name="httpModules"
        type="System.Web.Configuration.HttpModulesConfigurationHandler,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
    &lt;/sectionGroup&gt;
  &lt;/configSections&gt;

  &lt;system.web&gt;
    &lt;httpModules&gt;
      &lt;add
        name="CookielessSession"
        type="System.Web.SessionState.CookielessSessionModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="OutputCache"
        type="System.Web.Caching.OutputCacheModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="Session"
        type="System.Web.SessionState.SessionStateModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="WindowsAuthentication"
        type="System.Web.Security.WindowsAuthenticationModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="FormsAuthentication"
        type="System.Web.Security.FormsAuthenticationModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="PassportAuthentication"
        type="System.Web.Security.PassportAuthenticationModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="UrlAuthorization"
        type="System.Web.Security.UrlAuthorizationModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
      &lt;add
        name="FileAuthorization"
        type="System.Web.Security.FileAuthorizationModule,System.Web, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
      /&gt;
    &lt;/httpModules&gt;
  &lt;/system.web&gt;

&lt;/configuration&gt;
</pre></div>

<p>
<h5>Using Location and Path</h5>
By default, all configuration settings defined within the top-level <b>&lt;configuration&gt;</b> tag are applied
to the current directory location of the containing web.config file and to all of the child paths
beneath it. You can optionally apply configuration settings to specific child paths under the current
config file by using the <b>&lt;location&gt;</b> tag with an appropriately constraining <b>path</b> attribute. If the
config file is the main machine.config file, you can apply settings to specific virtual directories or
applications and the virtual path needs to include the friendly name of the site like, 
&lt;location path="Default Web Site/EnglishPages/OneJapanesePage.aspx"&gt,
which is also shown in the example below. If the config file is a web.config file,
you can apply settings to a specific file, child directory, virtual directory, or application.
<p>
<div class="code"><pre>
&lt;configuration&gt;

  &lt;location path="EnglishPages"&gt;
    &lt;system.web&gt;
      &lt;globalization
        requestEncoding="iso-8859-1"
        responseEncoding="iso-8859-1"
      /&gt;
    &lt;/system.web&gt;
  &lt;/location&gt;

  &lt;location path="Default Web Site/EnglishPages/OneJapanesePage.aspx"&gt;
    &lt;system.web&gt;
      &lt;globalization
        requestEncoding="Shift-JIS"
        responseEncoding="Shift-JIS"
      /&gt;
    &lt;/system.web&gt;
  &lt;/location&gt;

&lt;/configuration&gt;
</pre></div>

<h5>Locking down configuration settings</h5>
In addition to specifying path information using the <b>&lt;location&gt;</b> tag, you can also specify security
so that settings cannot be overridden by another configuration file further down the configuration
hierarchy.  To lock down a group of settings, you can specify an <b>allowOverride</b> attribute on the
surrounding <b>&lt;location&gt;</b> tag and set it to false. The following code locks down impersonation
settings for two different applications.

<p>
<div class="code"><pre>
&lt;configuration&gt;

  &lt;location path="app1" allowOverride="false"&gt;
    &lt;system.web&gt;
        &lt;identity impersonate="false" userName="app1" password="app1pw" /&gt;
    &lt;/system.web&gt;
  &lt;/location&gt;

  &lt;location path="app2" allowOverride="false"&gt;
    &lt;system.web&gt;
        &lt;identity impersonate="false" userName="app2" password="app2pw" /&gt;
    &lt;/system.web&gt;
  &lt;/location&gt;

&lt;/configuration&gt;
</pre></div>

<p>
Note that if a user tries to override these settings in another configuration file, the configuration
system will throw an error:

<div class="code"><pre>
&lt;configuration&gt;

  &lt;system.web&gt;
      &lt;identity userName="developer" password="loginpw" /&gt;
  &lt;/system.web&gt;

&lt;/configuration&gt;
</pre></div>

<h5>Standard ASP.NET Configuration Section</h5>

ASP.NET ships with a number of standard configuration section handlers that are used to process
configuration settings within web.config files.  The following table provides brief descriptions of the sections, along
with pointers to more information.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="200">Section Name</th><th width="*">Description</th>
</tr>
<tr>
<td><b>&lt;httpModules&gt;</b></td><td>Responsible for configuring HTTP modules within an application. HTTP modules participate in the processing of every request into an application.  Common uses include security and logging.</td>
</tr>
<tr>
<td><b>&lt;httpHandlers&gt;</b></td><td>Responsible for mapping incoming URLs to <b>IHttpHandler</b> classes. Subdirectories do not inherit these settings.
Also responsible for mapping incoming URLs to <b>IHttpHandlerFactory</b> classes.  Data represented in <b>&lt;httpHandlers&gt;</b> sections are hierarchically inherited by subdirectories.  For more information, see the <a href="httphandlers.aspx">Http Handlers and Factories</a> section of this tutorial.</td>
</tr>
<tr>
<td><b>&lt;sessionState&gt;</b></td><td>Responsible for configuring the session state HTTP module.  For more information, see the <a href="stateoverview.aspx">Managing Application State</a> section of this tutorial.</td>
</tr>
<tr>
<td><b>&lt;globalization&gt;</b></td><td>Responsible for configuring the globalization settings of an application.  For more information, see the <a href="internationalization.aspx">Localization</a> section of this tutorial.</td>
</tr>
<tr>
<td><b>&lt;compilation&gt;</b></td><td>Responsible for all compilation settings used by ASP.NET.  For more information, see the <a href="businessobjs.aspx">Business Objects</a> and <a href="debugcomsdk.aspx">Debugging</a> sections of this tutorial.</td>
</tr>
<tr>
<td><b>&lt;trace&gt;</b></td><td>Responsible for configuring the ASP.NET trace service. For more information, see the <a href="tracingoverview.aspx">Tracing</a> section of this tutorial.</td>
</tr>
<tr>
<td><b>&lt;processModel&gt;</b></td><td>Responsible for configuring the ASP.NET process model settings on IIS Web server systems.  </td>
</tr>
<tr>
<td><b>&lt;browserCaps&gt;</b></td><td>Responsible for controlling the settings of the browser capabilities component.  For more information, see the <a href="configretrieve.aspx">Retrieving Configuration</a> section of this tutorial.</td>
</tr>
</table>

<p>
<b>Optional Attributes</b> - The following attributes are applicable only for ASP.NET applications. The configuration system ignores these attributes when other types of applications are running.
<p>
<table class="table2" width="90%" cellpadding=3>
<TR VALIGN="top">
<TH width=31%>Attribute</TH>
<TH width=69%>Description</TH>
</TR>
<TR VALIGN="top">
<TD width=31%><B>allowDefinition</B></TD>
<TD width=69%>Specifies which configuration file the section can be used in. Use one of the following values:
<DL>
<DT><B>Everywhere</B></DT>

<DD>Allows the section to be used in any configuration file. This is the default.</dd>

<DT><B>MachineOnly</B></DT>

<DD>Allows the section to be used only in the machine configuration file (Machine.config).</dd>

<DT><B>MachineToApplication</B></DT>

<DD>Allows the section to be used in the machine configuration file or the application configuration file.</dd>
</DL>
</TD>
</TR>
<TR VALIGN="top">
<TD width=31%><B>allowLocation</B></TD>
<TD width=69%>Determines whether the section can be used within the <B>&lt;location&gt;</B> element. Use one of the following values:
<DL>
<DT><B>true</B></DT>

<DD>Allows the section to be used within the <B>&lt;location&gt;</B> element. This is the default.</dd>

<DT><B>false</B></DT>

<DD>Does not allow the section to be used within the <B>&lt;location&gt;</B> element.</dd>
</DL>
</TD>
</TR>
</Table>
  <!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->