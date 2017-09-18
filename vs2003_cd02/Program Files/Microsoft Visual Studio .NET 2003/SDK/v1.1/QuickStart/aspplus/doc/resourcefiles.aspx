<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Working with Resource Files</span>

<p>
<div class="indent" style="font-family:Verdana;">
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#create">Creating Resources</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#useresource">Using Resources on a Page</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#satellite">Using Satellite Assemblies</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#satellitecont">Using Satellite Assemblies for Controls</a><br>
<b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>



<!--BEGIN SECTION-->
<a name="create">
<span class="subhead">Creating Resources</span>
<p>

Resource management, a feature of the .NET Framework class library, can be used to extract
localizable elements from source code and to store them with a string key as
resources. At runtime an instance of the <b>ResourceManager</b> class can be used to resolve
the key to the original resource or a localized version. Resources can be stored as
independent ("loose") files or as a part of an assembly.
<p>
ASP.NET pages can utilize resource files; compiled code-behind controls can, in
addition, utilize resources embedded or linked into their assembly.
<p>

Resources can be created using the <b>ResourceWriter</b> class programmatically or by the tool
Resgen.exe. Resgen.exe can use a simple key=value format as input or an XML file in .resx
format.
<div class="code"><xmp>
;
; Lines beginning with a semicolon can be used for comments.
;

[strings]
greeting=Welcome !
more=Read more ...
...
</xmp></div>

<b>ResourceWriter</b> and Resgen.exe create a .resources file, which can be used as is or as part
of an assembly. To include a .resources file in an assembly, use the related compiler
switch or the Al.exe tool. Assemblies containing only localized resources and no code
are called satellite assemblies.



<!--BEGIN SECTION-->
<br>
<a name="useresource">
<br>
<span class="subhead">Using Resources on a Page</span>
<p>

The following sample implements only one .aspx page, which is localized
for each request. The supported languages are English, German, and Japanese.
The language is determined by examining the <b>Content-Language</b> field
of the HTTP header in the Global.asax file. The contents of the
field are accessible through the <b>UserLanguages</b> collection:
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages[0]);
</Tab>

<Tab Name="VB">
Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages(0))
</Tab>

<Tab Name="JScript">
Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages.GetValue(0));
</Tab>

</Acme:TabControl><p>

To change the initial language setting, you can use differently localized clients or
change the language setting on your browser. For Internet Explorer 5.x, for
example, select <b>Tools</b> -> <b>Internet Options</b> from the menu and click the <b>Languages</b>
button at the bottom. In the following dialog you can add additional languages and
define their priority. For simplicity the sample always chooses the first entry.
<p>
After the page is loaded the first time, the user can select another culture in the
drop-down list control <b>MyUICulture</b>. If a valid culture is selected, this value
overrides the setting acquired from <b>UserLanguages</b>:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
String SelectedCulture = MyUICulture.SelectedItem.Text;
if(! SelectedCulture.StartsWith("Choose")) {
  // If another culture was selected, use that instead.
  Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(SelectedCulture);
  Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
}
</Tab>

<Tab Name="VB">
Dim SelectedCulture As String = MyUICulture.SelectedItem.Text
If Not(SelectedCulture.StartsWith("Choose")) Then
  '  If another culture was selected, use that instead.
  Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages(0))
  Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture
End If
</Tab>

<Tab Name="JScript">
var SelectedCulture:String = MyUICulture.SelectedItem.Text;
if(! SelectedCulture.StartsWith("Choose")) {
  // If another culture was selected, use that instead.
  Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages.GetValue(0));
  Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
}
</Tab>

</Acme:TabControl><p>

<p>
In the previous code, the use of the CreateSpecificCulture method is required because you cannot set the current CultureInfo of your Thread to a neutral culture. However, the string available from the UserLanguages setting may be a neutral culture. Therefore, the CreateSpecificCulture method takes this string, and makes an appropriate CultureInfo from it.
<p>
Also, in the Global.asax file, a <b>ResourceManager</b> instance with application scope
is initialized. This way, resources are only loaded once per application. Because
resources are read-only, no lock contention should occur.
<p><Acme:TabControl runat="server">
<Tab Name="C#">
public void Application_Start() {
    Application["RM"] = new ResourceManager("articles",
                Server.MapPath("resources") + Path.DirectorySeparatorChar,
                null);
}
</Tab>

<Tab Name="VB">
Public Sub Application_Start()
    Application("RM") = New ResourceManager("articles", _
                Server.MapPath("resources") + Path.DirectorySeparatorChar, _
                Nothing)
End Sub
</Tab>

<Tab Name="JScript">
public function Application_Start() : void {
    Application["RM"] = new ResourceManager("articles",
                Server.MapPath("resources") + Path.DirectorySeparatorChar,
                null);
}
</Tab>

</Acme:TabControl><p>

<p>

The resource manager then can easily be used on the page. The greeting string is
simply localized by:
<div class="code"><pre>
&lt;%=rm.GetString("greeting")%&gt;
</pre></div>

<table><tr>
<td>
<Acme:SourceRef
  ViewSource="/quickstart/aspplus/samples/localize/resources/news/global_asax.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="global.asax"
  runat="server" />
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/News/CS/news.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/News/news.src"
  Icon="/quickstart/aspplus/images/resources2.gif"
  Caption="C# news.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/News/VB/news.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/News/news.src"
  Icon="/quickstart/aspplus/images/resources2.gif"
  Caption="VB news.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/News/JS/news.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/News/news.src"
  Icon="/quickstart/aspplus/images/resources2.gif"
  Caption="JScript news.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr></table>

<!--BEGIN SECTION-->
<br>
<a name="satellite">
<br>
<span class="subhead">Using Satellite Assemblies</span>
<p>

If you look at the structure of the directories in the sample in the previous section,
you see that the resources for the sample are loaded not from DLLs, but
from .resource files. Although this is certainly one solution,
you can also compile your code into satellite assemblies. A satellite assembly
is defined as an assembly with resources only, no executable code. For more
information on satellite assemblies, see the section
<A HREF="/quickstart/howto/doc/createresources.aspx">How Do I... Create Resources?
</A>.<p>
The benefit of using satellite assemblies becomes apparent when you realize that
.resources files are not shadow-copied because they are not DLLs, and therefore
Web sites can encounter locking problems when using them. The alternative is to use a
parallel main assembly for application resources.  The main assembly contains fallback
resources; the satellites (one per culture) contain localized resources.
The main assembly is installed into the \bin directory, and the satellites are
stored in the usual xx-XX subdirectories (see
<A HREF="/quickstart/howto/doc/createresources.aspx">How Do I... Create Resources?
</A>). Being assemblies, they are shadow-copied and are not locked. To create an assembly-aware .asp application:
<p>

<ol>
<li>Create the resource DLL and copy it into the \bin directory. For example:<p>
        resgen qq.txt qq.resources<br>
        al /embed:qq.resources,qq.resources /out:qq.dll<p>
        In the above example, the <b>Private</b> option on the <b>/embed</b> parameter
        has been omitted to specify that this module is public and visible to other assemblies.
        Since the <b>ResourceManager</b> lives in Mscorlib and
        is a different assembly from "qq", the .resources file must be publically
        visible.<p>
<li>On your page, include the following statement. Note that the name of the
        assembly here is in the <b>System.Reflection</b> namespace defined in Mscorlib
        (which is always referenced for you when compiling):
<p><Acme:TabControl runat="server">
<Tab Name="C#">
        &LT;%
        Assembly a = Assembly.Load("qq");
        ResourceManager rm = new ResourceManager("qq", a);
        Response.Write(rm.GetString("key"));
        %>
</Tab>
<Tab Name="VB">
        &LT;%
        Dim a As Assembly = Assembly.Load("qq")
        Dim rm As ResourceManager = New ResourceManager("qq", a)
        Response.Write(rm.GetString("key"))
        %>
</Tab>
<Tab Name="JScript">
        &LT;%
        var a:Assembly = Assembly.Load("qq");
        var rm:ResourceManager = new ResourceManager("qq", a);
        Response.Write(rm.GetString("key"));
        %>
</Tab>
</Acme:TabControl>
<P>
<li>Compile each satellite resource into its own
        assembly, placing it into the correct required directory
        structure within the /bin directory:<p>

        al /embed:qq.en-US.resources,qq.en-US.resources /out:qq.resources.dll /c:en-US<p>

        Substitute the code for the culture into which you are localizing for <i>en-US</i>.
        Remember that the <b>/c:</b> tag is the culture specifier.
</ol>
After the DLLs are in the right locations (/bin and /bin/en-US in the
above samples), the resources can be retrieved appropriately. Note that
everything gets shadow-copied by assembly cache and thus is replaceable, avoiding
potential locking scenarios.
<p>

<!--BEGIN SECTION-->
<br>
<a name="satellitecont">
<br>
<span class="subhead">Using Satellite Assemblies for Controls</span>
<p>

Compiled code-behind controls can also use satellite assemblies to supply
localized content. From a deployment perspective, this is an especially good
thing, because satellite assemblies can be version-independent from the code.
As a result, support for additional languages can be provided just by copying
the module of the satellite to the server, and no code change is required.<p>

The following sample contains the <b>LocalizedButton</b> control in the
assembly <b>LocalizedControls</b> (module LocalizedControls.dll). On the page
Showcontrols.aspx, the compiled control is registered and used later on:

<div class="code"><pre>
&lt;%@Register TagPrefix="Loc" namespace="LocalizedControls" %&gt;
...
&lt;Loc:LocalizedButton runat="server" Text="ok" /&gt;
</pre></div>

<p>
The <b>LocalizedButton</b> control stores a <b>ResourceManager</b> instance, which is
shared by all instances of <b>LocalizedButton</b>. Whenever a control is
rendered, the value of the <b>Text</b> property is replaced with the localized
version:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
_rm = new ResourceManager("LocalizedStrings",
                          Assembly.GetExecutingAssembly(),
                          null,
                          true );
...
override protected void Render(HtmlTextWriter writer) {
    Text = ResourceFactory.RManager.GetString(Text);
    base.Render(writer);
}
</Tab>

<Tab Name="VB">
_rm = New ResourceManager("LocalizedStrings", _
                          Assembly.GetExecutingAssembly(), _
                          Nothing, _
                          True )
...
Overrides Protected Sub Render (writer As HtmlTextWriter)
    Text = ResourceFactory.RManager.GetString(Text)
    base.Render(writer)
End Sub
</Tab>

<Tab Name="JScript">
_rm = new ResourceManager("LocalizedStrings",
                          Assembly.GetExecutingAssembly(),
                          null,
                          true );
...
override protected function Render(writer:HtmlTextWriter) : void {
    Text = ResourceFactory.RManager.GetString(Text);
    base.Render(writer);
}
</Tab>

</Acme:TabControl><p>

The <b>ResourceManager</b> instance is responsible for resolving the key to a
localized resource. If a satellite assembly with the correct culture
is not available and no related culture is found, the neutral resource
of the main assembly is used ("en-us" <nobr>-></nobr> "en" <nobr>-></nobr>
neutral). Support for another language is simply granted by copying the
module file for the new satellite assembly in place.
<p>

<table><tr>
<td>
<Acme:SourceRef
  ViewSource="/quickstart/aspplus/samples/localize/resources/Controls/controls.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="Localized Controls"
  runat="server" />
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/ShowControls/CS/showcontrols.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/ShowControls/showcontrols.src"
  Icon="/quickstart/aspplus/images/resources1.gif"
  Caption="C# Using Localized Controls"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/ShowControls/VB/showcontrols.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/ShowControls/showcontrols.src"
  Icon="/quickstart/aspplus/images/resources1.gif"
  Caption="VB Using Localized Controls"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/resources/ShowControls/JS/showcontrols.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/resources/ShowControls/showcontrols.src"
  Icon="/quickstart/aspplus/images/resources1.gif"
  Caption="JScript Using Localized Controls"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr></table>

<p>


<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET pages can utilize the resource classes to isolate localizable content
in resources, which are selected at runtime.
<li>A good alternative is to use satellite assemblies rather than the intermediate .resources
files for loading your resources, since this can avoid locking issues.
<li>Compiled controls can contain resources of their own and will select the
correct localized content, depending on the <b>UICulture</b> of the hosting page.
</ol>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
