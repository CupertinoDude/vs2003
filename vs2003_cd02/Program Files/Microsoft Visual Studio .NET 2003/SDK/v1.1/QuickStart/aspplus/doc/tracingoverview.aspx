
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Tracing Overview</span>
<p>
When you are developing an application, it is often helpful to be able to insert debugging print statements
 into your code to output variables or structures, assert whether a condition is met, or just generally trace through
the execution path of the application.  ASP.NET provides two levels of tracing services that make it easy to do just that.
</p>
<p>

<ul>
<li><b>Page-level Tracing</b>: At the page level, developers can use the <b>TraceContext</b>
intrinsic to write custom debugging statements that appear at the end of the client output
delivered to the requesting browser.  ASP.NET also inserts some helpful statements regarding
the start/end of lifecycle methods, like <b>Init</b>, <b>Render</b>, and <b>PreRender</b>, in addition to
the inputs and outputs to a page, such as form and <b>QueryString</b> variables or headers, and
important statistics about the page's execution (control hierarchy, session state, and application
state).  Because tracing can be explicitly enabled or disabled for a page, these statements
can be left in the production code for a page with no impact to the page's performance.  Each
statement can be associated with a user-defined category for organizational purposes, and timing
information is automatically collected by the ASP.NET runtime.  The resulting output can be
ordered by either time or category.
<p>

<li><b>Application-level Tracing</b>: Application-level tracing provides a view of several requests
to an application's pages at once.  Like page-level tracing, it also displays inputs and outputs to a page, such as form and <b>QueryString</b> variables or headers, as well as some important statistics (control hierarchy, session state, and application state).  Application-level tracing is enabled through the <a href="configoverview.aspx">ASP.NET
configuration system</a>, and accessed as a special mapped URL into that application (Trace.axd).  When application tracing is
enabled, page-level tracing is automatically enabled for all pages in that application (provided there is no page-level directive to explicitly disable trace).
</ul>

<p>
To learn more about how the Trace feature works, read the following two sections: <a href="tracelogpage.aspx">Trace Logging to Page Output</a> and <a href="tracelogapp.aspx">Application-level Trace Logging</a>.
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->