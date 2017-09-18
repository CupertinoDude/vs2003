

<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Measuring Performance</span>
<p>
Measuring Web server performance is a skill that can only be refined by repeated experience and experimentation.  There are many variables at play, such as the number of clients, speed of client connections, server resources, application code, and so on.  It helps to have good tools at your disposal, and fortunately those are available.
</p>
<p>
Microsoft provides the Web Application Stress (WAS) tool, which simulates multiple HTTP clients hitting your Web site.  You can control the client load, number of connections, format of cookies, headers, and several other parameters from the tool's graphical interface.  After a test run, WAS provides you with reports containing performance metrics such as response time, throughput, and performance counter data relevant to your application.  The goal is simple: to maximize throughput and CPU utilization under high degrees of load.  WAS is available from the <i>Microsoft Internet Information Server Resource Kit</i> and is also downloadable separately from <a target="_top" href="http://webtool.rte.microsoft.com">http://webtool.rte.microsoft.com</a>.
<p>
ASP.NET also exposes a number of performance counters that can be used to track the execution of your applications.  Unlike traditional ASP, most of these performance counters are exposed per-application, instead of globally for the entire machine.  The per-application counters are available under the ASP.NET Framework applications performance object, and you need to select a particular application instance when selecting a counter to monitor.  Of course, you can still see the counter values for all applications using a special "__Total__" application instance in System Monitor.  ASP.NET also exposes global-only counters which are not bound to a particular application instance.  These counters are located under the ASP.NET System performance object.  To view all available counters for ASP.NET (on Windows 2000 systems):

<ol>
<li>Select <b>Start</b>-><b>Programs</b>-><b>Administrative Tools</b>-><b>Performance</b>.
<li>Click the <b>View Report</b> button in System Monitor.
<li>Click the <b>Add</b> button.
<li>Select <b>ASP.NET Applications</b>, then choose the <b>All counters</b> radio button. Click <b>OK</b>.
<li>Select <b>ASP.NET</b>, then choose the <b>All counters</b> radio button. Click <b>OK</b>.
</ol>



<p>
The ASP.NET Trace feature is also useful for identifying performance bottlenecks in your code.  It can show you important timing information between successive trace output statements, as well as information about the server control heierarchy, the amount of viewstate used, and the render size of controls on your page.  For more information about the Trace feature, refer to the <a href="tracingoverview.aspx">Tracing</a> section of this tutorial.

<p>
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->



