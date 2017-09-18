<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Using the Global.asax File</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#globalasax">The Global.asax File</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#events">Application or Session-Scoped Events</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#staticobjects">Application or Session-Scoped Objects</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="globalasasx">
<span class="subhead">The Global.asax File</span>
<p>

In addition to writing UI code, developers can also add application level
logic and event handling code into their Web applications. This code does not
handle generating UI and is typically not invoked in response to individual
page requests.  Instead, it is responsible for handling higher-level application
events  such as <b>Application_Start</b>, <b>Application_End</b>, <b>Session_Start</b>,
<b>Session_End</b>,  and so on. Developers author this logic using a <b>Global.asax</b> file located
at the root of a particular Web application's virtual directory tree.
ASP.NET automatically parses and compiles this file into a dynamic .NET Framework class--which extends the <b>HttpApplication</b> base class--the first time any resource or URL
within the application namespace is activated or requested.
<p>

The Global.asax file is parsed and dynamically compiled by ASP.NET into a .NET Framework class
the first time any resource or URL within its application namespace is activated
or requested. The Global.asax file is configured to automatically reject any direct URL
request so that external users cannot download or view the code within.
<p>



<!--BEGIN SECTION-->
<a name="events">
<span class="subhead">Application or Session-Scoped Events</span>
<p>

Developers can define handlers for events of the <b>HttpApplication</b> base class by
authoring methods in the Global.asax file that conform to the naming pattern
"Application_EventName(AppropriateEventArgumentSignature)". For example:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server">

void Application_Start(object sender, EventArgs e) {
  // Application startup code goes here
}
&lt;/script>
</Tab>

<Tab Name="VB">
&lt;script language="VB" runat="server">

Sub Application_Start(Sender As Object, E As EventArgs)
  ' Application startup code goes here
End Sub
&lt;/script>
</Tab>

<Tab Name="JScript">
&lt;script language="JScript" runat="server">

function Application_Start(sender:Object, e:EventArgs) : void {
  // Application startup code goes here
}
&lt;/script>
</Tab>

</Acme:TabControl><p>

If the event handling code needs to import additional namespaces, the <b>@ import</b>
directive can be used on an .aspx page, as follows:
<p>
<div class="code"><pre>
&lt;%@ Import Namespace="System.Text" %>
</pre></div>

<p>
The following sample illustrates the lifetime of <b>Application</b>,
<b>Session</b>, and <b>Request</b>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application1/CS/application1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application1/application1.src"
  Icon="/quickstart/aspplus/images/application1.gif"
  Caption="C# Application1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application1/VB/application1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application1/application1.src"
  Icon="/quickstart/aspplus/images/application1.gif"
  Caption="VB Application1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application1/JS/application1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application1/application1.src"
  Icon="/quickstart/aspplus/images/application1.gif"
  Caption="JScript Application1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The first time the page is opened, the <b>Start</b> event is raised for the application and the session:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Application_Start(object sender, EventArgs e) {
  // Application startup code goes here
}

void Session_Start(object sender, EventArgs e) {
  Response.Write("Session is Starting...&lt;br&gt;");
  Session.Timeout = 1;
}
</Tab>

<Tab Name="VB">
Sub Application_Start(Sender As Object, E As EventArgs)
  ' Application startup code goes here
End Sub

Sub Session_Start(Sender As Object, E As EventArgs)
  Response.Write("Session is Starting...&lt;br&gt;")
  Session.Timeout = 1
End Sub
</Tab>

<Tab Name="JScript">
function Application_Start(sender:Object, E:EventArgs) : void {
  // Application startup code goes here
}

function Session_Start(sender:Object, e:EventArgs) : void {
  Response.Write("Session is Starting...&lt;br&gt;");
  Session.Timeout = 1;
}
</Tab>

</Acme:TabControl><p>

The <b>BeginRequest</b> and <b>EndRequest</b> events are raised on each request.
When the page is refreshed, only messages from <b>BeginRequest</b>, <b>EndRequest</b>, and
the <b>Page_Load</b> method will appear. Note that by abandoning the current
session (click the "End this session" button) a new session is created
and the <b>Session_Start</b> event is raised again.
<p>



<!--BEGIN SECTION-->
<a name="staticobjects">
<span class="subhead">Application or Session-Scoped Objects</span>
<p>

Static objects, .NET Framework classes, and COM components all can be defined in
the Global.asax file using the object tag. The scope can be <b>appinstance</b>, <b>session</b>, or
<b>application</b>. The <b>appinstance</b> scope denotes that the object is specific to one
instance of <b>HttpApplication</b> and is not shared.

<div class="code"><pre>
&lt;object id="id" runat="server" class=".NET Framework class Name" scope="appinstance"/&gt;
&lt;object id="id" runat="server" progid="COM ProgID" scope="session"/&gt;
&lt;object id="id" runat="server" classid="COM ClassID" scope="application"/&gt;
</pre></div>

<p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET Framework applications can define event handlers with application-wide
or session-wide scope in the Global.asax file.
<li>ASP.NET Framework applications can define objects with application-wide
or session-wide scope in the Global.asax file.
</ol>
<p>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->