<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Application Overview</span>
<p>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#what">What is an ASP.NET Application?</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#creating">Creating an Application</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#lifetime">Lifetime of an Application</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#multiplethreads">A Note on Multiple Threads</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>

</p>
<p>
<hr>

<!--BEGIN SECTION-->
<a name="what">
<span class="subhead">What is an ASP.NET Application?</span>

<p>
ASP.NET defines an application as the sum of all files, pages, handlers, modules, 
and executable code that can be invoked or run in the scope of a given virtual 
directory (and its subdirectories) on a Web application server.  For example, 
an "order" application might be published in the "/order" virtual directory on a 
Web server computer. For IIS the virtual directory can be set up in the Internet
Services Manager; it contains all subdirectories, unless the subdirectories are
virtual directories themselves.
</p>

<p>
Each ASP.NET Framework application on a Web server is executed within 
a unique .NET Framework
application domain, which guarantees class isolation (no versioning or naming conflicts),
security sandboxing (preventing access to certain machine or network resources), 
and static variable isolation.
</p>

<p>
ASP.NET maintains a pool of <b>HttpApplication</b> instances over the course of a Web 
application's lifetime. ASP.NET automatically assigns one of these instances to
process each incoming HTTP request that is received by the application.  
The particular <b>HttpApplication</b> instance assigned is responsible for managing
the entire lifetime of the request and is reused only after the request has
been completed. This means that user code within the <b>HttpApplication</b> does not
need to be reentrant.
</p>

<p>
<!--BEGIN SECTION-->
<a name="creating">
<span class="subhead">Creating an Application</span>
</p>

<p>
To create an ASP.NET Framework application you can use an existing virtual directory or 
create a new one. For example, if you installed Windows 2000 Server including 
IIS, you probably have a directory C:\InetPub\WWWRoot. You can configure IIS
using the Internet Services Manager, available under 
Start <nobr>-></nobr> Programs <nobr>-></nobr> Administrative Tools. 
Right-click on an existing directory and choose either New (to create a new
virtual directory) or Properties (to promote an existing regular directory).
</p>

<p>
By placing a simple .aspx page like the following in the virtual 
directory and accessing it with the browser, you trigger
the creation of the ASP.NET application.
</p>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@Page Language="C#"%&gt;
&lt;html&gt;
&lt;body&gt;
&lt;h1&gt;hello world, &lt;% Response.Write(DateTime.Now.ToString()); %&gt;&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>

<Tab Name="VB">
&lt;%@Page Language="VB"%&gt;
&lt;html&gt;
&lt;body&gt;
&lt;h1&gt;hello world, &lt;% Response.Write(DateTime.Now.ToString()) %&gt;&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>

<Tab Name="JScript">
&lt;%@Page Language="JScript"%&gt;
&lt;html&gt;
&lt;body&gt;
&lt;h1&gt;hello world, &lt;% Response.Write(DateTime.Now.ToString()); %&gt;&lt;/h1&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>

</Acme:TabControl>
</p>

<p>
Now you can add appropriate code to use
the <a href="stateoverview.aspx">Application</a> object--to store
objects with application scope, for example. By creating a 
<a href="globalasax.aspx">global.asax</a> file you also can 
define various event handlers--
for the <b>Application_Start</b> event, for example.
</p>

<p>
<!--BEGIN SECTION-->
<a name="lifetime">
<span class="subhead">Lifetime of an Application</span>
</p>

<p>
An ASP.NET Framework application is created the first time a 
request is made to the server; before
that, no ASP.NET code executes. When the first request is made, 
a pool of <b>HttpApplication</b>
instances is created and the <b>Application_Start</b> event 
is raised. The <b>HttpApplication</b> 
instances process this and subsequent requests, until the 
last instance exits and the 
<b>Application_End</b> event is raised.
</p>

<p>
Note that the <b>Init</b> and <b>Dispose</b> methods of 
<b>HttpApplication</b> are called per instance and
thus can be called several times between <b>Application_Start</b> 
and <b>Application_End</b>. Only
these events are shared among all instances of <b>HttpApplication</b> 
in one ASP.NET application.
</p>

<p>
<!--BEGIN SECTION-->
<a name="multiplethreads">
<span class="subhead">A Note on Multiple Threads</span>
</p>

<p>
If you use objects with application scope, you should be aware that
ASP.NET processes requests concurrently and that the <b>Application</b> object can be 
accessed by multiple threads. Therefore the following code is dangerous and might
not produce the expected result, if the page is repeatedly requested by
different clients at the same time.
</p>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%
Application["counter"] = (Int32)Application["counter"] + 1;
%&gt;
</Tab>

<Tab Name="VB">
&lt;%
Application("counter") = CType(Application("counter"), Int32) + 1
%&gt;
</Tab>

<Tab Name="JScript">
&lt;%
Application("counter") = Int32(Application("counter")) + 1;
%&gt;
</Tab>

</Acme:TabControl>
</p>

<p>
To make this code thread safe, serialize the access to the 
<b>Application</b> object using
the <b>Lock</b> and <b>UnLock</b> methods. However, doing so 
also means accepting a considerable 
performance hit:
</p>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%
Application.Lock();
Application["counter"] = (Int32)Application["counter"] + 1;
Application.UnLock();
%&gt;
</Tab>

<Tab Name="VB">
&lt;%
Application.Lock()
Application("counter") = CType(Application("counter"), Int32) + 1
Application.UnLock()
%&gt;
</Tab>

<Tab Name="JScript">
&lt;%
Application.Lock();
Application("counter") = Int32(Application("counter")) + 1;
Application.UnLock();
%&gt;
</Tab>

</Acme:TabControl>
</p>

<p>
Another solution is to make the object stored with an application scope
thread safe. For example, note that the collection classes 
in the <b>System.Collections</b> namespace
are not thread safe for performance reasons.
</p>

<p>
<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET Framework applications consist of everything under one 
virtual directory of the Web server.</li>
<li>You create an ASP.NET Framework application by adding files to 
a virtual directory on the Web server.</li>
<li>The lifetime of an ASP.NET Framework application is marked by 
<b>Application_Start</b> and <b>Application_End</b> events.</li>
<li>Access to application-scope objects must be safe for multithreaded access.</li>
</ol>
</p>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->