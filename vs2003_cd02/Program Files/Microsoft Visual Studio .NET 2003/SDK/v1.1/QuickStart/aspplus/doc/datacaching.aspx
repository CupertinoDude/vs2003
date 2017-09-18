<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Page Data Caching</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#intro">Introduction to Data Caching</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#samples">Using the Data Cache</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<a name="intro">
<span class="subhead">Introduction to Data Caching</span>
<p>

ASP.NET provides a full-featured cache engine that can be used by pages to store and retrieve arbitrary objects across HTTP requests.  The ASP.NET cache is private to each application and stores objects in memory.  The lifetime of the cache is equivalent to the lifetime of the application; that is, when the application is restarted, the cache is recreated.
<p>
The cache provides a simple dictionary interface that allows programmers to easily place objects in and retrieve them from the cache.  In the simplest case, placing an item in the cache is just like adding an item to a dictionary:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
Cache["mykey"] = myValue;
</Tab>

<Tab Name="VB">
Cache("mykey") = myValue
</Tab>

<Tab Name="JScript">
Cache("mykey") = myValue;
</Tab>

</Acme:TabControl><p>

Retrieving the data is just as simple. The existence of the object should be checked before retrieving the data from the cache as shown in the example below:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
myValue = Cache["mykey"];
if(myValue != null ) {
    DisplayData(myValue);
}
</Tab>

<Tab Name="VB">
myValue = Cache("mykey")
If Not (myValue Is Nothing) Then
    DisplayData(myValue)
End If
</Tab>

<Tab Name="JScript">
myValue = Cache("mykey");
if(myValue != null ) {
    DisplayData(myValue);
}
</Tab>

</Acme:TabControl><p>

For applications that need more sophisticated functionality, the ASP.NET cache supports scavenging, expiration, and file and key dependencies.
<p>
<ul>
<li>Scavenging means that the cache attempts to remove infrequently used or unimportant items if memory becomes scarce.  Programmers who want to control how scavenging occurs can provide hints to the scavenger when items are inserted into the cache that indicate the relative cost of creating the item and the relative rate at which the item must be accessed to remain useful.
<p>
<li>Expiration allows programmers to give cache items lifetimes, which can be explicit (for example, expire at 6:00) or can be relative to an item's last use (for example, expire 20 minutes after the item was last accessed).  After an item has expired, it is removed from the cache and future attempts to retrieve it return the null value unless the item is reinserted into the cache.
<p>
<li>File and key dependencies allow the validity of a cache item to be based on an external file or on another cache item.  If a dependency changes, the cache item is invalidated and removed from the cache.  For an example of how you might use this functionality, consider the following scenario: an application reads financial information from an XML file that is periodically updated.  The application processes the data in the file and creates a graph of objects that represent that data in a consumable format.  The application caches that data and inserts a dependency on the file from which the data was read. When the file is updated, the data is removed from the cache and the application can reread it and reinsert the updated copy of the data.
</ul>

<a name="samples">
<span class="subhead">Using the Data Cache</span>
<p>
The following sample shows a simple use of the cache.  It executes a database query and caches the result, which it continues to use for the lifetime of the application. When you run the sample, note the message at the bottom of the page.  When first requested, it indicates that the data was explicitly retrieved from the database server.  After refreshing the page, the page  notes that the cached copy was used.
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/datacache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache1.src"
  Icon="/quickstart/aspplus/images/datacache1.gif"
  Caption="C# Datacache1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/datacache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache1.src"
  Icon="/quickstart/aspplus/images/datacache1.gif"
  Caption="VB Datacache1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/datacache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache1.src"
  Icon="/quickstart/aspplus/images/datacache1.gif"
  Caption="JScript Datacache1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The next example shows a cache item that depends on an XML file.  It is similar to the first example, although in this case the data is retrieved from an XML data source instead of a database server.  When the data is cached, the XML file is added as a dependency.
<p>
When a new record is added using the form at the bottom of the page, the XML file is updated and the cached item must be recreated.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/datacache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache2.src"
  Icon="/quickstart/aspplus/images/datacache2.gif"
  Caption="C# Datacache2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/datacache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache2.src"
  Icon="/quickstart/aspplus/images/datacache2.gif"
  Caption="VB Datacache2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/datacache2.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/datacache2.src"
  Icon="/quickstart/aspplus/images/datacache2.gif"
  Caption="JScript Datacache2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>
Note that a file dependency is added by using <b>Cache.Insert</b> and supplying a <b>CacheDependency</b> object referencing the XML file.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
Cache.Insert("MyData", Source,
         new CacheDependency(Server.MapPath("authors.xml")));
</Tab>

<Tab Name="VB">
Cache.Insert("MyData", Source, _
         New CacheDependency(Server.MapPath("authors.xml")))
</Tab>

<Tab Name="JScript">
Cache.Insert("MyData", Source,
         new CacheDependency(Server.MapPath("authors.xml")));
</Tab>

</Acme:TabControl><p>

A cache item can depend on a single or multiple files or keys.  As mentioned previously, an application can also set expiration policy on a cache item.  The following code sets an absolute cache expiration time.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
Cache.Insert("MyData", Source, null,
             DateTime.Now.AddHours(1), TimeSpan.Zero);
</Tab>

<Tab Name="VB">
Cache.Insert("MyData", Source, Nothing, _
             DateTime.Now.AddHours(1), TimeSpan.Zero)
</Tab>

<Tab Name="JScript">
Cache.Insert("MyData", Source, null,
             DateTime.Now.AddHours(1), TimeSpan.Zero);
</Tab>

</Acme:TabControl><p>

The relevant parameter is the call to <b>DateTime.Now.AddHours(1)</b>, which indicates that the item expires 1 hour from the time it is inserted.  The final argument, <b>TimeSpan.Zero</b> indicates that there is no relative expiration policy on this item.
<p>
The following code shows how to set a relative expiration policy.  It inserts an item that expires 20 minutes after it is last accessed.  Note the use of <b>DateTime.MaxValue</b>, which indicates that there is no absolute expiration policy on this item.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
Cache.Insert("MyData", Source, null, DateTime.MaxValue,
             TimeSpan.FromMinutes(20));
</Tab>

<Tab Name="VB">
Cache.Insert("MyData", Source, Nothing, DateTime.MaxValue, _
             TimeSpan.FromMinutes(20))
</Tab>

<Tab Name="JScript">
Cache.Insert("MyData", Source, null, DateTime.MaxValue,
             TimeSpan.FromMinutes(20));
</Tab>

</Acme:TabControl><p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>Data caching allows arbitrary objects to be cached programmatically.
<li>The ASP.NET cache supports expiration and dependencies.
<li>The cache is scoped to an application and its lifetime is equivalent to the lifetime of the application.
</ol>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->