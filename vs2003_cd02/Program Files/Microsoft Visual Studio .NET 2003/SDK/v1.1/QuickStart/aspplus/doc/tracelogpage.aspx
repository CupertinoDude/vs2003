<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Trace Logging to Page Output</span>
<p>
Page-level tracing enables you to write debugging statements directly to a page's output, and conditionally run
debugging code when tracing is enabled.  To enable tracing for a page, include the following directive at the top of the page code:
</p>
<p>

<div class="code"><pre>
&lt;%@ Page Trace="true"%&gt;
</pre></div>

Trace statements can also be organized by category, using the <b>TraceMode</b> attribute of the <b>Page</b> directive.
If no <b>TraceMode</b> attribute is defined, the default value is <b>SortByTime</b>.

<div class="code"><pre>
&lt;%@ Page Trace="true" TraceMode="SortByCategory" %&gt;
</pre></div>

<p>
The following example shows the default output when page-level tracing is enabled.  Note that ASP.NET inserts timing information for
important places in the page's execution lifecycle:
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/CS/trace1.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace1.src"
  Icon="/quickstart/aspplus/images/pagetrace1.gif"
  Caption="C# Trace1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/VB/trace1.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace1.src"
  Icon="/quickstart/aspplus/images/pagetrace1.gif"
  Caption="VB Trace1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/JS/trace1.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace1.src"
  Icon="/quickstart/aspplus/images/pagetrace1.gif"
  Caption="JScript Trace1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The page exposes a <b>Trace</b> property (of type <b>TraceContext</b>), which can be used to
output debugging statements to the page output, provided tracing is enabled.  Using <b>TraceContext</b>, you can write debugging statements using the <b>Trace.Write</b> and
<b>Trace.Warn</b> methods, which each take a message string or a category and message
string.  <b>Trace.Warn</b> statements are identical to <b>Trace.Write</b>
statements, except they are output in <span style="color:red">red</span>.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
// Trace(Message)
Trace.Write("Begging User Code...");
...
Trace.Warn("Array count is null!");
// Trace(Category, Message)
Trace.Write("Custom Trace","Beginning User Code...");
...
Trace.Warn("Custom Trace","Array count is null!");
</Tab>

<Tab Name="VB">
' Trace(Message)
Trace.Write("Begging User Code...")
...
Trace.Warn("Array count is Nothing!")
' Trace(Category, Message)
Trace.Write("Custom Trace","Beginning User Code...")
...
Trace.Warn("Custom Trace","Array count is null!")
</Tab>

<Tab Name="JScript">
// Trace(Message)
Trace.Write("Begging User Code...");
...
Trace.Warn("Array count is null!");
// Trace(Category, Message)
Trace.Write("Custom Trace","Beginning User Code...");
...
Trace.Warn("Custom Trace","Array count is null!");
</Tab>

</Acme:TabControl><p>

<p>
When tracing is disabled (that is, when <b>Trace="false"</b> on the <b>Page</b> directive, or is not present), these statements do not run and no Trace output
appears in the client browser.  This makes it possible to keep debugging statements in production code and enable them conditionally
at a later time.

<p>
Often you might need to run additional code to construct the statements to pass to the <b>Trace.Write</b> or <b>Trace.Warn</b> methods, where this
code should only run if tracing is enabled for the page.  To support this, <b>Page</b> exposes a Boolean property,
<b>Trace.IsEnabled</b>, which returns true only if tracing is enabled for the page.  You should check this property first to guarantee that your
debugging code can only run when tracing is on.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
if (Trace.IsEnabled) {
    for (int i=0; i&lt;ds.Tables["Categories"].Rows.Count; i++) {
        Trace.Write("ProductCategory",ds.Tables["Categories"].Rows[i][0].ToString());
    }
}
</Tab>

<Tab Name="VB">
If Trace.IsEnabled Then
    For i=0 To ds.Tables("Categories").Rows.Count-1
        Trace.Write("ProductCategory",ds.Tables("Categories").Rows(i)(0).ToString())
    Next
End if
</Tab>

<Tab Name="JScript">
if (Trace.IsEnabled) {
    for (var i:int =0; i&lt;ds.Tables["Categories"].Rows.Count; i++) {
        Trace.Write("ProductCategory",ds.Tables["Categories"].Rows[i][0].ToString());
    }
}
</Tab>

</Acme:TabControl><p>

<p>
The following example shows the use of <b>Trace.Write</b> and <b>Trace.Warn</b> to output debugging statements.  Also note the use of the <b>Trace.IsEnabled</b>
property to conditionally run extra debugging code.  In this example, the trace information has been sorted by category.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/CS/trace2.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace2.src"
  Icon="/quickstart/aspplus/images/pagetrace2.gif"
  Caption="C# Trace2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/VB/trace2.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace2.src"
  Icon="/quickstart/aspplus/images/pagetrace2.gif"
  Caption="VB Trace2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/trace/JS/trace2.aspx"
  ViewSource="/quickstart/aspplus/samples/trace/trace2.src"
  Icon="/quickstart/aspplus/images/pagetrace2.gif"
  Caption="JScript Trace2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
ASP.NET also provides a way to enable tracing for the entire application, not just a single page.  For more about application-level
tracing, click <a href="tracelogapp.aspx">here</a>.

<h4>Section Summary</h4>
<ol>
<li>Page-level tracing is enabled using a <b>Trace="true"</b> attribute on the top-level <b>Page</b> directive.
<li>Page-level tracing enables you to write debugging statements as part of a page's client output.  Trace statements are output using the <b>Trace.Write</b> and <b>Trace.Warn</b> methods, passing a category and message for each statement.
<li>Debugging code can be conditionally run, depending on whether tracing is enabled for the page.  Use the <b>Trace.IsEnabled</b> property of the page to determine whether tracing is enabled.
</ol>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->