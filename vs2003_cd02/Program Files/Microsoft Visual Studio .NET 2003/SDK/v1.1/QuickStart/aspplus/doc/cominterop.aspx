<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">COM Interoperability</span>
<p>
The common language runtime enables .NET objects to interoperate seamlessly 
with traditional COM components.  ASP.NET exposes the familiar 
<b>Server.CreateObject(ProgId)</b> API to developers for creating late-bound 
references to COM.  
</p>

<div class="code"><pre>
Dim myConn
myConn = Server.CreateObject("ADODB.Connection");
</pre></div>

<p>
You can also use early-bound, traditional COM components by creating 
runtime callable wrappers (RCWs), which optimize the performance of 
calls between unmanaged and managed code.  You can create an RCW using the 
Tlbimp.exe utility included in the .NET Framework SDK.  For more 
information on Tlbimp.exe, see the <a 
target="_top" href="/QuickStart/howto/default.aspx?
url=/quickstart/howto/doc/Interop/Interop_Overview.aspx">Interoperability</a> 
section of the Common Tasks QuickStart.  The 
<a href="perfoverview.aspx">ASP.NET Performance</a> section contains more 
information comparing late binding with early binding.
</p>

<p>
Like ASP, you can also create traditional COM components using the 
<code>&lt;object&gt;</code> tag with either a <code>progid</code> 
or a <code>classid</code> attribute.  In addition to using the 
<code>&lt;object&gt;</code> tag in pages, you can also use it in the 
Global.asax file for the application. In this case, the object is 
added to the <b>Page.Application.StaticObjects</b> collection and 
exposed as a property with the same name as the object's id to all 
the pages in that application. Note that you cannot create 
single-threaded apartment (STA) objects statically in the Global.asax 
file because doing so generates a runtime error, as it does in ASP.
</p>

<p>
ASP.NET also continues to support the existing ASP intrinsic 
interfaces <b>GetObjectContext</b> and <b>OnStartPage</b>/<b>OnEndPage</b>. 
Supporting these interfaces means that you can use existing 
components (Commerce Server, Exchange, and so on) in ASP.NET pages.  
These interfaces are not enabled by default but are explicitly 
turned on using the following page directive:

<div class="code"><pre>
&lt;%@ Page ASPCompat="true" %&gt;
</pre></div>
</p>

<p>
This directive causes ASP.NET to create unmanaged ASP intrinsic 
objects and pass them to COM components used in the page.  It also 
runs the page in an STA thread pool. See the following section 
for information.
</p>

<h5>Performance Considerations</h5>

In ASP.NET, the thread pool is a multithreaded apartment (MTA) 
by default, which can affect the performance of traditional 
apartment-threaded Visual Basic 5 and Visual Basic 6 components. 
The <code>ASPCompat="true"</code> attribute enables an STA thread 
pool to address performance with existing Visual Basic components 
on a per-page basis. 
</p>

<p>
Calling between managed and unmanaged components also incurs a 
marshaling cost, which can impede the performance of your pages.  
Every scenario yields different performance characteristics, so it 
is important to test adequately before deciding whether 
interoperability is the right choice for your application.  However, 
in nearly all scenarios, rewriting your COM components in managed 
code provides performance benefits.  See the 
<a href="perfoverview.aspx">ASP.NET Performance</a> section for more 
information and important tips.
</p>

<h4><a name="summary">Section Summary</a></h4>

<ol>
<li>ASP.NET exposes the familiar <b>Server.CreateObject</b> API to 
developers for creating late-bound references to COM.  
<li>You can also use early-bound, traditional COM components by 
creating runtime callable wrappers, which optimize the performance 
of calls between unmanaged and managed code.
<li>ASP.NET continues to support the existing ASP intrinsic 
interfaces <b>GetObjectContext</b> and <b>OnStartPage</b>/<b>OnEndPage</b>.  
These interfaces are explicitly enabled using the page 
directive <code> &lt;%@ Page ASPCompat="true" %&gt;</code>.
<li>The <code>ASPCompat="true"</code> attribute enables STA thread 
pools on a per-page basis to address performance with 
existing Visual Basic components.
<li>In nearly all scenarios, rewriting your COM components in 
managed code provides performance benefits.  
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
