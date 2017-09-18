<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Page Fragment Caching</span>
<p>
In addition to output caching an entire page, ASP.NET provides a simple way for you to output cache regions of page content, which is appropriately named fragment caching.  You delineate regions of your page with a <a href="webpagelets.aspx">user control</a>, and mark them for caching using the <b>@ OutputCache</b> directive introduced in the previous section.  This directive specifies the duration (in seconds) that the output content of the user control should be cached on the server, as well as any optional conditions by which it should be varied.
</p>
<p>
For example, the following directive instructs ASP.NET to output cache the user control for 120 seconds, and to vary the caching using the "CategoryID" and "SelectedID" querystring or form post parameters.
<p>

<div class="code"><pre>
&lt;%@ OutputCache Duration="120" VaryByParam="CategoryID;SelectedID"%&gt;
</pre></div>

<p>
The <b>VaryByParam</b> attribute is extremely powerful and allows user control authors to instruct ASP.NET to cache/store multiple instances of an output cache region on the server.  For example, the following URLs to the host page of the previous user control cache separate instances of the user control content.
<p>

<div class="indent">
  <u>http://localhost/mypage.aspx?categoryid=foo&selectedid=0</u><br>    <u>http://localhost/mypage.aspx?categoryid=foo&selectedid=1</u>
</div>


<p>
Logic within a user control can then dynamically generate different content (which is cached separately) depending
on the arguments provided.

<p>
In addition to supporting the <b>VaryByParam</b> attribute, fragment caching also supports a <b>VaryByControl</b> attribute. Whereas the
<b>VaryByParam</b> attribute varies cached results based on name/value pairs sent using <b>POST</b> or <b>GET</b>, the <b>VaryByControl</b> attribute varies the
cached fragment by controls within the user control. For example:
<div class="code"><pre>
&lt;%@ OutputCache Duration="120" VaryByParam="none" VaryByControl="Category" %&gt;
</pre></div>
<p>
Note that similar to output-cached pages, explict use of <b>VaryByParam</b> is required even if it is not used.
<p>
If the user control contained a drop-down select box control named Category, the user control's output would vary based on
the selected value within that control.

<p>
Just as it is possible to nest user controls recursively within a page (that is, a user control declared within another server control), it is also possible to nest output-cached user controls recursively.  This provides a powerful composition model that enables cached regions to be composed of further subcached regions.
<p>

The following sample code demonstrates how to cache two menu sections of a page using a declarative user control.
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ Register TagPrefix="Acme" TagName="Menu" Src="Menu.ascx" %&gt;

&lt;html&gt;
  &lt;body&gt;
    &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="LeftMenu" runat=server/&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;h1&gt;Hi, the time is now: &lt;%=DateTime.Now%&gt; &lt;/h1&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="RightMenu" runat=server/&gt;
        &lt;/td&gt;
      &lt;tr&gt;
    &lt;/table&gt;
  &lt;/body&gt;
&lt;/html&gt;
</Tab>
<Tab Name="VB">
&lt;%@ Register TagPrefix="Acme" TagName="Menu" Src="Menu.ascx" %&gt;

&lt;html&gt;
  &lt;body&gt;
    &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="LeftMenu" runat=server/&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;h1&gt;Hi, the time is now: &lt;%=Now%&gt; &lt;/h1&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="RightMenu" runat=server/&gt;
        &lt;/td&gt;
      &lt;tr&gt;
    &lt;/table&gt;
  &lt;/body&gt;
&lt;/html&gt;
</Tab>
<Tab Name="JScript">
&lt;%@ Register TagPrefix="Acme" TagName="Menu" Src="Menu.ascx" %&gt;

&lt;html&gt;
  &lt;body&gt;
    &lt;table&gt;
      &lt;tr&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="LeftMenu" runat=server/&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;h1&gt;Hi, the time is now: &lt;%=DateTime.Now%&gt; &lt;/h1&gt;
        &lt;/td&gt;
        &lt;td&gt;
          &lt;Acme:Menu Category="RightMenu" runat=server/&gt;
        &lt;/td&gt;
      &lt;tr&gt;
    &lt;/table&gt;
  &lt;/body&gt;
&lt;/html&gt;
</Tab>
</Acme:TabControl>

<p>
The following sample code shows the implementation of the "Acme:Menu" user control with caching support.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ OutputCache Duration="120" VaryByParam="none" %&gt;

&lt;script language="C#" runat=server&gt;

    public String Category;

    void Page_Load(Object sender, EventArgs e)  {

        AdoConnection conn = new AdoConnection("MyDSN");

        MyMenu.DataSource = conn.Execute("select * from menu where category=" + Category );
        MyMenu.DataBind();
    }

&lt;/script&gt;

&lt;asp:datagrid id="MyMenu" runat=server/&gt;
</Tab>
<Tab Name="VB">
&lt;%@ OutputCache Duration="120" VaryByParam="none" %&gt;

&lt;script language="VB" runat=server&gt;

    Public Category As String;

    Sub Page_Load(sender As Object, e As EventArgs)

        Dim conn As AdoConnection = New AdoConnection("MyDSN")

        MyMenu.DataSource = conn.Execute("select * from menu where category=" & Category)
        MyMenu.DataBind()
    End Sub

&lt;/script&gt;

&lt;asp:datagrid id="MyMenu" runat=server/&gt;
</Tab>
<Tab Name="JScript">
&lt;%@ OutputCache Duration="120" VaryByParam="none" %&gt;

&lt;script language="JScript" runat=server&gt;

    public var Category:String;

    function Page_Load(sender:Object, e:EventArgs) : void {

        var conn:AdoConnection = new AdoConnection("MyDSN");

        MyMenu.DataSource = conn.Execute("select * from menu where category=" + Category );
        MyMenu.DataBind();
    }

&lt;/script&gt;

&lt;asp:datagrid id="MyMenu" runat=server/&gt;
</Tab>
</Acme:TabControl>
<p>

Note that this example output caches the response of each user control for a period of 120
seconds.  All logic necessary to recreate each menu user control in the event of a cache miss
(either because 120 seconds has expired or because memory conditions on the server have become
scarce) is encapsulated cleanly within the user control.
<p>

The following example shows simple fragment caching.  The sample caches the output from a control that
retrieves data from an SQL Server database, while keeping the dynamic properties of the parent page.
You can see that the page is dynamic because the time is updated with every refresh, while the control
is only updated every 60 seconds.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/CS/fragmentcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/fragmentcache1.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="C# FragmentCache1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/VB/fragmentcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/fragmentcache1.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="VB FragmentCache1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/cache/JS/fragmentcache1.aspx"
  ViewSource="/quickstart/aspplus/samples/cache/fragmentcache1.src"
  Icon="/quickstart/aspplus/images/outputcache2.gif"
  Caption="JScript FragmentCache1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<h5>Caveats</h5>

<p>
<b>Note:</b> Attempts to programmatically manipulate an output-cached control from its containing
page result in an error.  For example, attempts to use a declarative data binding
expression on the user control tag generates parser errors, as shown in the following code.

<p>
<div class="code"><pre>
&lt;!-- The following tags generate parser errors. --&gt;
&lt;Acme:Menu Category='&lt;%# Container.DataItem("Category")'  runat="server"/&gt;
</pre></div>
<p>

The reason for this is simple. In cases when the content of a user control is output cached, an instance of the control
is created only on the first request; thus, once cached, the control is no longer available.  Instead, you should encapsulate
all the logic necessary to create the content of a user control directly within the control itself; this is typically done
within the user control's <b>Page_Load</b> event or <b>Page_PreRender</b> event.

<p>

You can declare and use other declarative property parameters to customize the control. For example, the previous
user control can be customized as follows:

<p>
<div class="code"><pre>
&lt;Acme:Menu Category="LeftMenu" runat=server/&gt;
&lt;Acme:Menu Category="RightMenu" runat=server/&gt;
</pre></div>
<p>

These declarations cause the appropriate code to be generated and executed by the page compiler in the event that the control is created as a result of a cache miss.  User control developers can then access these settings just as they would in a non-cached user control scenario.

<h4>Section Summary</h4>
<ol>
<li>In addition to output caching an entire page, ASP.NET provides a simple way for you to output cache regions of page content, which is appropriately named fragment caching.
<li>You delineate regions of your page with a user control and mark them for caching using the <b>@ OutputCache</b> directive introduced in the previous section.
<li>Just as it is possible to nest user controls recursively within a page (that is, a user control declared within another server control), it is also possible to nest output-cached user controls recursively.
<li>Attempts to programmatically manipulate an output-cached control from its containing page  result in an error.  Instead, you should encapsulate all the logic necessary to create the content of a user control directly within the control itself, typically within the user control's <b>Page_Load</b> event or <b>Page_PreRender</b> event.
<li>It is possible to declare and use other declarative property parameters to customize the control.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
