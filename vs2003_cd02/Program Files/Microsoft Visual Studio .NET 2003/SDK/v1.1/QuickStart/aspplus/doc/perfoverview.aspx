<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Performance Overview</span>
<p>
Feature-rich web applications are not very useful if they cannot perform well.  The demands of the Web are so great that code is expected to do more in less time than ever before.  This section describes some key principles of Web application performance, tips for writing code that performs well, and tools for measuring performance.
</p>
<p>
ASP.NET provides a number of built-in performance enhancements.  For example, pages are compiled only once and cached for subsequent requests. Because these compiled pages are saved to disk, even a complete server restart does not invalidate them.  ASP.NET also caches internal objects, such as server variables, to speed user code access.  Further, ASP.NET benefits from all of the performance enhancements to the common language runtime: just-in-time compiling, a fine-tuned common language runtime for both single- and multiprocessor computers, and so on.  

<p>However, all of these enhancements cannot protect you from writing code that does not perform well.  Ultimately, you must ensure that your application can meet the demands of its users.  The next section describes a few of the common ways to avoid performance bottlenecks. However, first you need to understand the following metrics:
<p>
<ul>
<li><b>Throughput</b>: The number of requests a Web application can serve per unit of time, often measured in requests/second.  Throughput can vary, depending on the load (number of client threads) applied to the server.  This is usually considered the most important performance metric to optimize.
<p>
<li><b>Response Time</b>: The length of time between the issuance of a request and the first byte returned to the client from the server.  This is often the most perceptable aspect of performance to the client user.  If an application takes a long time to respond, the user can become impatient and go to another site.  The response time of an application can vary independently of (even inversely to) the rate of throughput.
<p>
<li><b>Execution Time</b>: The time it takes to process a request, usually measured between the first byte and the last byte returned to the client from the server.  Execution time directly affects the throughput calculation.
<p>
<li><b>Scalability</b>: The measurement of an application's ability to perform better as more resources (memory, processors, or computers) are allocated to it.  Often, it is a measurement of the rate of change of throughput with respect to the number of processors.
</ul>
<p>
Writing applications that perform well is all about striking a balance between these metrics.  No single measurement can characterize how your application will behave under varying circumstances, but several measurements taken together can paint a reasonable picture of an application's performance.

<p>
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
