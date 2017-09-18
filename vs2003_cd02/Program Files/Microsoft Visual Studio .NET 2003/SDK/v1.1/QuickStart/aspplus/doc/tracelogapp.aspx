
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Application-level Trace Logging</span>
<p>
In addition to the Page-level Trace funtionality, ASP.NET provides a way to enable trace output for an entire application.  Enabling Trace
at the application level has the effect of enabling Page-level Trace for every page within that application (provided there is no page-level directive to explicitly disable trace).  When application-level
tracing is enabled, the ASP.NET runtime also collects several additional statistics, such as the state of the control hierarchy, the contents of
session and application state, the form and querystring input values, and other characteristics of request's execution.  These statistics
are collected for a specified number of requests as determined by the application's configuration file.  To enable tracing for an
application, place the following in the application's web.config file at the application root directory:
</p>
<p>

<div class="code"><pre>
&lt;configuration&gt;
  &lt;system.web&gt;
    &lt;trace enabled="true"/&gt;
  &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>

<p>
Using the above configuration, each page in the application will run its page-level trace statements to be output in the client browser.  To access the additional page
statistics, request a specially-mapped "trace.axd" URL from the application root.  For example, if the URL to your application
is <span style="color:blue"><u>http://localhost/myapplication</u></span>, you would request the URL
<span style="color:blue"><u>http://localhost/myapplication/trace.axd</u></span> to access the trace statistics for that application.
<p>

<div class="indent">
  <img src="/quickstart/aspplus/images/trace1.gif"><br>
</div>

<p>
By default, trace information will be collected for up to 10 requests (you can use the "clear current trace" link to reset the request
counter).  The trace section of the configuration file also supports an attribute for controlling whether trace statements are output
to the client browser, or whether they are only available from trace.axd.  The attributes supported in the trace configuration section
are listed in the table below:
<p>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th width="150"><b>Value</b></th><th><b>Description</b></th></tr>
<tr><td>enabled</td><td>Set to true | false, indicates whether Tracing is enabled for the application (default is false)</td></tr>
<tr><td>pageOutput</td><td>Set to true | false, indicates whether trace information should be rendered at the end of each page - or only accessible via the trace.axd utility (default is false)</td></tr>
<tr><td>requestLimit</td><td>Number of trace requests to store on the server (default is 10)</td></tr>
<tr><td>traceMode</td><td>Set to SortByTime | SortByCategory, indicates the display order for Trace messages (default is SortByTime)</td></tr>
<tr><td>localOnly</td><td>Set to true | false, indicates whether Tracing is enabled for localhost users or for all users (default is true)</td></tr>
</table>
</div>

<p>
For example, the following configuration collects trace information for up to 40 requests, and prevents
trace statements from being output to the requesting browser (provided there is no page-level directive
to explicitly enable trace).  The messages are displayed in order of category:
<p>

<div class="code"><pre>
&lt;configuration&gt;
  &lt;system.web&gt;
    &lt;trace
      enabled="true"
      traceMode="SortByCategory"
      requestLimit="40"
      pageOutput="false"
      localOnly="true"
    /&gt;
  &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>


<h5>Application Trace Request Details</h5>
After making a series of requests to the application, accessing trace.axd will list those requests in time-order.  You can drill-down into
the details for each request by selecting the "View Details" link.
<p>

<div class="indent">
  <img src="/quickstart/aspplus/images/trace2.gif"><br>
</div>

<p>
The trace application presents the following detailed information for
each request:
<p>

<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Request Detail</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Session Id</td><td>The Session Id for this request</td></tr>
<tr><td>Time of Request</td><td>The time the request was made</td></tr>
<tr><td>Status Code</td><td>The returned status code for this request</td></tr>
<tr><td>Request Type</td><td>GET | POST</td></tr>
<tr><td>Request Encoding</td><td>Encoding for the request</td></tr>
<tr><td>Response Encoding</td><td>Encoding for the response</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Trace Information</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Category</td><td>The category for a Trace statement written to the TraceContext</td></tr>
<tr><td>Message</td><td>The message string for this Trace statement</td></tr>
<tr><td>From First (s) </td><td>Time in seconds from the first Trace statement</td></tr>
<tr><td>From Last (s)</td><td>Time in seconds from the previous Trace statement</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Control Hierarchy</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Control ID</td><td>The ID for the control</td></tr>
<tr><td>Type </td><td>The fully qualified type of the control</td></tr>
<tr><td>Render Size</td><td>The size of the control's rendering in bytes including children</td></tr>
<tr><td>ViewState Size</td><td>The size of the control's viewstate in bytes excluding children</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Session State</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Key</td><td>The key for an object in Session State</td></tr>
<tr><td>Type</td><td>The fully qualified type of the object</td></tr>
<tr><td>Value</td><td>The value of the object</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Application State</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Key</td><td>The key for an object in Application State</td></tr>
<tr><td>Type</td><td>The fully qualified type of the object</td></tr>
<tr><td>Value</td><td>The value of the object</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Cookies Collection</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Name</td><td>The name of the cookie</td></tr>
<tr><td>Value</td><td>The value of the cookie, or sub-keys/values if multi-valued</td></tr>
<tr><td>Size</td><td>The size of the cookie rendering in Bytes</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Headers Collection</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Name</td><td>The name of the header</td></tr>
<tr><td>Value</td><td>The value of the header</td></tr>
</table>
</div>


<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Form Collection</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Name</td><td>The name of the form variable</td></tr>
<tr><td>Value</td><td>The value of the form variable</td></tr>
</table>
</div>

<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>QueryString Collection</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Name</td><td>The name of the querystring variable</td></tr>
<tr><td>Value</td><td>The value of the querystring variable</td></tr>
</table>
</div>


<p>
<div class="indent">
<table class="table" width="90%" cellpadding="3">
<tr><th colspan="2">
<nobr><font size="2" style="text-indent:3;">
<b>Server Variables</b>
</font></nobr>
</th>
</tr>
<tr><td width="150"><b>Value</b></td><td><b>Description</b></td></tr>
<tr><td>Name</td><td>The name for the server variable</td></tr>
<tr><td>Value</td><td>TThe value of the server variable</td></tr>
</table>
</div>

<h4>Section Summary</h4>
<ol>
<li>Application-level Tracing is enabled using a "trace" section in the configuration file at the application root directory.
<li>Application-level Tracing enables trace log output for every page within an application (provided there is no page-level
directive to explicitly disable trace).
<li>After making a series of requests, details for those requests may be accessed by requesting "trace.axd" from the application root.
</ol>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->