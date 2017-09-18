<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Syntax and Semantics</span>
<p>
ASP.NET is fully API-compatible with traditional ASP, with the following three exceptions:
</p>
<p>
<ul>
  <li><b>Request()</b>: ASP returns an array of strings; ASP.NET returns a string.
  <li><b>Request.QueryString()</b>: ASP returns an array of strings; ASP.NET returns a string.
  <li><b>Request.Form()</b>: ASP returns an array of strings; ASP.NET returns a string.
</ul>
<p>
In ASP, the <b>Request</b>, <b>Request.QueryString</b>, and <b>Request.Form</b> collections return string arrays from lookups.  For example, in traditional ASP the query string values from a request to <nobr><u>http://localhost/test/Test.asp?values=45&values=600</u></nobr> would be accessed as follows:
<p>

<div class="code"><pre>
&lt;%
    ' Below line outputs: "45, 600"
    Response.Write Request.QueryString("values")

    ' Below line outputs: "45"
    Response.Write Request.QueryString("values")(1)
%&gt;
</pre></div>
<p>

In ASP.NET, these collections require an explicit method to get array access.  These arrays are also now 0-index based.  For example, in ASP.NET the query string values from a request to <nobr><u>http://localhost/test/Test.aspx?values=45&values=600</u></nobr> would be accessed as follows:
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%
    // Below line outputs: "45, 600"
    Response.Write(Request.QueryString["values"]);

    // Below line outputs: "45"
    Response.Write(Request.QueryString.GetValues("values")[0]);
%&gt;
</Tab>
<Tab Name="VB">
&lt;%
    ' Below line outputs: "45, 600"
    Response.Write(Request.QueryString("values"))

    ' Below line outputs: "45"
    Response.Write(Request.QueryString.GetValues("values")(0))
%&gt;
</Tab>
<Tab Name="JScript">
&lt;%
    // Below line outputs: "45, 600"
    Response.Write(Request.QueryString["values"]);

    // Below line outputs: "45"
    Response.Write(Request.QueryString.GetValues("values")[0]);
%&gt;
</Tab>
</Acme:TabControl>
<p>
These arrays are most commonly used when form values are posted from multiselect list boxes (&lt;select multiple&gt;) or when multiple check boxes have the same name.
<p>

<h5>Semantic Differences Between ASP.NET and ASP</h5>
ASP.NET pages also have several semantic changes from existing ASP pages.  The following issues are the ones most likely to affect you:
<p>
<ul>
  <li><b>ASP.NET pages only support one language on a single page.</b>

<p>
ASP allowed multiple languages to be used on a single page, which was useful for script library
scenarios.  Because of ASP.NET's compiled nature, it supports only a single language on a page.
However, it is still possible to have multiple pages, each with a separate language, within a single application.  User Controls might also have a different language from the page that contains them. This enables you to integrate functionality written in different languages in a single page.  This is an adequate substitute for the multiple-language Include files that are prevalent in traditional ASP applications.
<p>


  <li><b>ASP.NET page functions must be declared in &lt;script runat=server&gt; blocks.</b>
<p>
In ASP, page functions could be declared within &lt;% %&gt; blocks:

<div class="code"><pre>
&lt;%
    Sub DoSomething()
        Response.Write "Hello World!"
    End Sub

    DoSomething
%&gt;
</pre></div>
<p>
In ASP.NET, page functions must be declared in &lt;script runat=server&gt; blocks:
<p>

<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat=server&gt;

    void DoSomething() {
        Response.Write("Hello World!");
    }

&lt;/script&gt;

&lt;%
    DoSomething();
%&gt;
</Tab>
<Tab Name="VB">
&lt;script language="VB" runat=server&gt;

    Sub DoSomething()
        Response.Write ("Hello World!")
    End Sub

&lt;/script&gt;

&lt;%
    DoSomething()
%&gt;
</Tab>
<Tab Name="JScript">
&lt;script language="JScript" runat=server&gt;

    function DoSomething() : void {
        Response.Write("Hello World!");
    }

&lt;/script&gt;

&lt;%
    DoSomething();
%&gt;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>

<p>

  <li><b>ASP.NET does not support page-render functions.</b>

<p>
In ASP, page-render functions could be declared with &lt;% %&gt; blocks:
<p>

<div class="code"><pre>
&lt;% Sub RenderSomething() %&gt;
       &lt;font color="red"&gt; Here is the time: &lt;%=Now %&gt; &lt;/font&gt;
&lt;% End Sub %&gt;

&lt;%
   RenderSomething
   RenderSomething
%&gt;
</pre></div>

<p>
In ASP.NET, this must be rewritten:
<p>

<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat=server&gt;

     void RenderSomething() {
        Response.Write("&lt;font color=red&gt; ");
        Response.Write("Here is the time: " + DateTime.Now);
     }

&lt;/script&gt;

&lt;%
   RenderSomething();
   RenderSomething();
%&gt;
</Tab>
<Tab Name="VB">
&lt;script language="VB" runat=server&gt;

     Sub RenderSomething()
        Response.Write("&lt;font color=red&gt; ")
        Response.Write("Here is the time: " & Now)
     End Sub

&lt;/script&gt;

&lt;%
   RenderSomething()
   RenderSomething()
%&gt;
</Tab>
<Tab Name="JScript">
&lt;script language="JScript" runat=server&gt;

     function RenderSomething() : void {
        Response.Write("&lt;font color=red&gt; ");
        Response.Write("Here is the time: " + DateTime.Now);
     }

&lt;/script&gt;

&lt;%
   RenderSomething();
   RenderSomething();
%&gt;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>

</ul>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>With three exceptions, ASP.NET is 100% API-compatible with traditional ASP.  The API changes are that, now, 
<b>Request()</b>, <b>Request.QueryString()</b>, and <b>Request.Form()</b> all return individual strings, rather than string arrays.
<li>ASP.NET pages support only a single language.
<li>ASP.NET page functions must be declared in &lt;script runat=server&gt; blocks.
<li>Page-render functions are not supported.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
