<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">HTTP Handlers and Factories</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#overview">Overview</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#declaring">Configuring HTTP Handlers and Factories</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#customhandler">Creating a Custom HTTP Handler</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>


<!--BEGIN SECTION-->
<a name="overview">
<span class="subhead">Overview</span>
<p>

ASP.NET provides a low-level request/response API that enables developers to use
.NET Framework classes to service incoming HTTP requests. Developers accomplish
this by authoring classes that support the <b>System.Web.IHTTPHandler</b> interface
and implement the <b>ProcessRequest()</b> method.  Handlers are often useful when
the services provided by the high-level page framework abstraction are not required
for processing the HTTP request.  Common uses of handlers include filters and
CGI-like applications, especially those that return binary data.

<p>
Each incoming HTTP request received by ASP.NET is ultimately processed by a specific
instance of a class that implements <b>IHTTPHandler</b>. <b>IHttpHandlerFactory</b> provides the infrastructure
that handles the actual resolution of URL requests to <b>IHttpHandler</b> instances.
In addition to the default <b>IHttpHandlerFactory</b> classes provided by ASP.NET, developers can optionally create and register
factories to support rich request resolution and activation scenarios.

<!--BEGIN SECTION-->
<br>
<a name="declaring">
<br>
<span class="subhead">Configuring HTTP Handlers and Factories</span>
<p>

HTTP handlers and factories are declared in the ASP.NET configuration as part
of a web.config file. ASP.NET defines an <b>&lt;httphandlers&gt;</b> configuration section
where handlers and factories can be added and removed. Settings for
<b>HttpHandlerFactory</b> and <b>HttpHandler</b> are inherited by subdirectories.
<p>

For example, ASP.NET maps all requests for .aspx files to the <b>PageHandlerFactory</b> class in
the global machine.config file:

<div class="code"><pre>
&lt;httphandlers&gt;
  ...
  &lt;add verb="*" path="*.aspx" type="System.Web.UI.PageHandlerFactory,System.Web" /&gt;
  ...
&lt;/httphandlers&gt;
</pre></div>

<!--BEGIN SECTION-->

<a name="customhandler">

<span class="subhead">Creating a Custom HTTP Handler</span>
<p>

The following sample creates a custom <b>HttpHandler</b>  that handles
all requests to "SimpleHandler.aspx".
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/handler/CS/simplehandler.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/handler/handler.src"
  Icon="/quickstart/aspplus/images/simplehandler.gif"
  Caption="C# SimpleHandler"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/handler/VB/simplehandler.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/handler/handler.src"
  Icon="/quickstart/aspplus/images/simplehandler.gif"
  Caption="VB SimpleHandler"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/handler/JS/simplehandler.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/handler/handler.src"
  Icon="/quickstart/aspplus/images/simplehandler.gif"
  Caption="JScript SimpleHandler"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>


A custom HTTP handler can be created by implementing the <b>IHttpHandler</b>
interface, which contains only two methods. By calling <b>IsReusable</b>, an
HTTP factory can query a handler to determine whether the same instance can be used to service multiple requests. The
<b>ProcessRequest</b> method takes an <b>HttpContext</b> instance as a parameter, which
gives it access to the <b>Request</b> and <b>Response</b> intrinsics.
In the following sample, request data is ignored and a constant
string is sent as a response to the client.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
public class SimpleHandler : IHttpHandler {
  public void ProcessRequest(HttpContext context) {
    context.Response.Write("Hello World!");
  }

  public bool IsReusable {
    get {
      return true;
    }
  } 

}
</Tab>

<Tab Name="VB">
Public Class SimpleHandler : Inherits IHttpHandler
  Public Sub ProcessRequest(context As HttpContext)
    context.Response.Write("Hello World!")
  End Sub

  Public Function IsReusable() As Boolean
    Return(True)
  End Function
End Class
</Tab>

<Tab Name="JScript">
public class SimpleHandler implements IHttpHandler {
  public function ProcessRequest(context:HttpContext) : void {
    context.Response.Write("Hello World!");
  }

  public function IsReusable() : Boolean {
    return true;
  }
}
</Tab>

</Acme:TabControl><p>

After placing the compiled handler assembly in the application's \bin directory,
the handler class can be specified as a target for requests. In this case, all
requests for "SimpleHandler.aspx" will be routed to an instance of the
<b>SimpleHandler</b> class, which lives in the namespace <b>Acme.SimpleHandler</b>.

<div class="code"><xmp>
<httphandlers>
  <add verb="*" path="SimpleHandler.aspx" type="Acme.SimpleHandler,SimpleHandler" />
</httphandlers>
</xmp></div>

<p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>HTTP Handlers and factories are the backbone of the ASP.NET page framework.
<li>Factories assign each request to one handler, which processes the request.
<li>Factories and handlers are defined in the web.config file. Settings for factories
are inherited by subdirectories.
<li>To create a custom handler, implement <b>IHttpHandler</b> and add the class in the
<b>&lt;httphandlers&gt;</b> section of the web.config in the directory.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->














