<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">A Class Browser Application</span>
<p>
The following sample application implements a .NET Framework-based class browser, using the <b>System.Reflection</b> APIs to gather
information about a class.  To simplify the .aspx code, the application employs a managed component that encapsulates the reflection
details.  The .aspx page itself relies heavily on several <b>DataList</b> controls for rendering the namespaces, classes, and class
details.  The sample also shows the use of nested <b>DataList</b> controls for rendering the parameter lists.  To view the
sample, click the icon below.
</p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/classbrowser/cs/classbrowser.aspx"
  ViewSource="/quickstart/aspplus/samples/classbrowser/classbrowser.src"
  Icon="/quickstart/aspplus/images/classbrowser_icon.gif"
  Caption="C# ClassBrowser.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/classbrowser/vb/classbrowser.aspx"
  ViewSource="/quickstart/aspplus/samples/classbrowser/classbrowser.src"
  Icon="/quickstart/aspplus/images/classbrowser_icon.gif"
  Caption="VB ClassBrowser.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/classbrowser/JS/classbrowser.aspx"
  ViewSource="/quickstart/aspplus/samples/classbrowser/classbrowser.src"
  Icon="/quickstart/aspplus/images/classbrowser_icon.gif"
  Caption="JScript ClassBrowser.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The class browser also uses the ASP.NET configuration system to determine which modules to load and reflect upon.  A configuration section is mapped to the <b>HashtableSectionHandler</b>, which maintains key/value pairs for the assembly name and
file.  You can add assemblies to this list by appending a line to the class browser application's configuration section, as follows:
<p>

<div class="code"><pre>
&lt;configuration&gt;
  &lt;configSections&gt;
    &lt;sectionGroup name="system.web"&gt;
      &lt;section name="ClassBrowser" type="System.Configuration.NameValueSectionHandler,
       System,Version=1.0.5000.0,Culture=neutral,PublicKeyToken=b77a5c561934e089"/&gt;
    &lt;/sectionGroup&gt;
  &lt;/configSections&gt;

  &lt;system.web&gt;
    &lt;ClassBrowser&gt;
       &lt;add key="ASP.NET Class Library" value="System.Web, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" /&gt;
       &lt;add key=".NET Framework class Library" value="mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" /&gt;
    &lt;/ClassBrowser&gt;
  &lt;/system.web&gt;

&lt;/configuration&gt;
</pre></div>

<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->

