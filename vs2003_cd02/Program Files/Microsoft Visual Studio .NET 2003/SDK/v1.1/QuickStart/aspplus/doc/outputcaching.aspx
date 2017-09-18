<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Page Output Caching</span>
<!--BEGIN SUB SECTION-->
<p>
Output caching is a powerful technique that increases request/response throughput by caching the content generated from dynamic pages.  Output caching is enabled by default, but output from any given response is not cached unless explicit action is taken to make the response cacheable.
</p>
<p>
To make a response eligible for output caching, it must have a valid expiration/validation
policy and public cache visibility. This can be done using either the low-level <b>OutputCache</b> API or the high-level <b>@ OutputCache</b> directive.

When output caching is enabled, an output cache entry is created on the first <b>GET</b> request to the page.  Subsequent
<b>GET</b> or <b>HEAD</b> requests are served from the output cache entry until the cached request expires.
<p>
The output cache also supports variations of cached <b>GET</b> or <b>POST</b> name/value pairs.
<p>
The output cache respects the expiration and validation policies for pages.  If a page is in the output cache and has been marked with an expiration policy that indicates that the page expires 60 minutes from the time it is cached, the page is removed from the output cache after 60 minutes.  If another request is received after that time, the page code is executed and the page can be cached again.  This type of expiration policy is called absolute expiration - a page is valid until a certain time.

<p>
The following example demonstrates a simple way to output cache responses using the <b>@ OutputCache</b> directive.  The example simply displays the time when the response was generated.  To see output caching in action, invoke the page and note the time at which the response was generated.  Then refresh the page and note that the time has not changed, indicating that the second response is being served from the output cache.
<p>

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/outputcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache1.src"
  Icon="/quickstart/aspplus/images/outputcache1.gif"
  Caption="C# Outputcache1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/outputcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache1.src"
  Icon="/quickstart/aspplus/images/outputcache1.gif"
  Caption="VB Outputcache1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/outputcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache1.src"
  Icon="/quickstart/aspplus/images/outputcache1.gif"
  Caption="JScript Outputcache1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>
The following directive activates output caching on the response:
<div class="code"><pre>
&lt;%@ OutputCache Duration="60" VaryByParam="none"%&gt;
</pre></div>
This directive simply indicates that the page should be cached for 60 seconds and that the page does not vary by any <b>GET</b> or <b>POST</b> parameters.  Requests received while the
page is still cached are satisfied from the cache.  After 60 seconds, the page is removed
from the cache; the next request is handled explicitly and caches the page again.
<p>
Of course, in the previous example, very little work is saved by output caching.  The
following example shows the same technique for output caching, but queries a database
and displays the results in a grid.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/outputcache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache2.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="C# Outputcache2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/outputcache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache2.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="VB Outputcache2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/outputcache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache2.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="JScript Outputcache2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In the final example, the application is modified slightly to allow the user to selectively
query for authors in various states.  This example demonstrates caching requests varying by the
name/value pairs in the query string using the <b>VaryByParam</b> attribute of the <b>@ OutputCache</b> directive.
<div class="code"><pre>
&lt;%@ OutputCache Duration="60" VaryByParam="state" %&gt;
</pre></div>
For each state in the data set, there is a link that passes the desired state as part of the query
string.  The application then constructs the appropriate database query and shows authors belonging
only to the selected state.
<p>
Note that the first time you click the link for a given state, it generates a new timestamp
at the bottom of the page.  Thereafter, whenever a request for that state is resubmitted within a
minute, you get the original timestamp indicating that the request has been cached.
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/outputcache3.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache3.src"
  Icon="/quickstart/aspplus/images/outputcache3.gif"
  Caption="C# Outputcache3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/outputcache3.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache3.src"
  Icon="/quickstart/aspplus/images/outputcache3.gif"
  Caption="VB Outputcache3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/outputcache3.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/outputcache3.src"
  Icon="/quickstart/aspplus/images/outputcache3.gif"
  Caption="JScript Outputcache3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Applications that want more control over the HTTP headers related to caching can use the functionality
provided by the <b>System.Web.HttpCachePolicy</b> class.  The following example shows the code equivalent
to the page directives used in the previous samples.
<p><Acme:TabControl runat="server">
<Tab Name="C#">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
Response.Cache.SetCacheability(HttpCacheability.Public);
</Tab>

<Tab Name="VB">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60))
Response.Cache.SetCacheability(HttpCacheability.Public)
</Tab>

<Tab Name="JScript">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
Response.Cache.SetCacheability(HttpCacheability.Public);
</Tab>

</Acme:TabControl><p>
<p>
To make this a sliding expiration policy, where the expiration time out resets each time the page is
requested, set the <b>SlidingExpiration</b> property as shown in the following code.
<p><Acme:TabControl runat="server">
<Tab Name="C#">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
Response.Cache.SetCacheability(HttpCacheability.Public);
Response.Cache.SetSlidingExpiration(true);
</Tab>

<Tab Name="VB">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60))
Response.Cache.SetCacheability(HttpCacheability.Public)
Response.Cache.SetSlidingExpiration(True)
</Tab>

<Tab Name="JScript">
Response.Cache.SetExpires(DateTime.Now.AddSeconds(60));
Response.Cache.SetCacheability(HttpCacheability.Public);
Response.Cache.SetSlidingExpiration(true);
</Tab>

</Acme:TabControl><p>

<p>
<b>Note:</b> When sliding expiration is enabled (<b>SetSlidingExpiration(true)</b>), a request made to the origin server
 always generates a response. Sliding expiration is useful in scenarios where there are downstream caches that
can satisfy client requests, if the content has not expired yet, without requesting the content from the origin server.

<p>
Applications being ported from ASP may already be setting cache policy using the ASP properties; for example:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
Response.CacheControl = "Public";
Response.Expires = 60;
</Tab>

<Tab Name="VB">
Response.CacheControl = "Public"
Response.Expires = 60
</Tab>

<Tab Name="JScript">
Response.CacheControl = "Public";
Response.Expires = 60;
</Tab>

</Acme:TabControl><p>
These properties are supported by ASP.NET and have the same effect as the other examples that have been shown.


<h4>Section Summary</h4>
<ol>
<li>Output caching caches the content generated by ASP.NET pages.
<li>Pages are not placed in the output cache unless they have a valid expiration or validation policy and public cache visibility.
</ol>
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->