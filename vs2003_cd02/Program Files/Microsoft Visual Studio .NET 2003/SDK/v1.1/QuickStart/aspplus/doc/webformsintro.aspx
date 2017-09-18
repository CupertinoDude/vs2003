
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Introducing Web Forms</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#webforms">What is ASP.NET Web Forms?</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#writingforms">Writing Your First Web Forms Page</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#usingasp">Using ASP &lt;%%&gt; Render Blocks</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#serverctrls">Introduction to Server Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#handlingevts">Handling Server Control Events</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#customctrls">Using Custom Server Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#listsanddata">Lists, Data, and Databinding</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#formvalidate">Form Validation Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#codebehind">Code-Behind Web Forms</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="webforms">
<span class="subhead">What is ASP.NET Web Forms?</span>
<p>

The ASP.NET Web Forms page framework is a scalable common language runtime programming model
that can be used on the server to dynamically generate Web pages.

<p>

Intended as a logical evolution of ASP (ASP.NET provides syntax compatibility with
existing pages), the ASP.NET Web Forms framework has been specifically designed to
address a number of key deficiencies in the previous model.  In particular, it provides:

<ul>
  <li>The ability to create and use reusable UI controls that can encapsulate common
    functionality and thus reduce the amount of code that a page developer has to write.
  <li>The ability for developers to cleanly structure their page logic in an orderly
     fashion (not "spaghetti code").
  <li>The ability for development tools to provide strong WYSIWYG design
    support for pages (existing ASP code is opaque to tools).
</ul>

<p>

This section of the QuickStart provides a high-level code walkthrough of some key ASP.NET
Web Forms features. Subsequent sections of the QuickStart drill
down into more specific details.


<!--BEGIN SECTION-->
<br>
<a name="writingforms">
<br>
<span class="subhead">Writing Your First Web Forms Page</span>
<p>

ASP.NET Web Forms pages are text files with an .aspx file name extension.  They can be deployed throughout an IIS
virtual root directory tree.  When a browser client requests .aspx resources, the ASP.NET runtime parses and compiles
the target file into a .NET Framework class.  This class can then be used to dynamically process  incoming requests. (Note that
the .aspx file is compiled only the first time it is accessed; the compiled type instance is then reused across multiple
requests).

<p>

An ASP.NET page can be created simply by taking an existing HTML file and changing its file name extension to .aspx (no
modification of code is required).  For example, the following sample demonstrates a simple HTML page that collects
a user's name and category preference and then performs a form postback to the originating page when a button
is clicked:

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro1.aspx"
      ViewSource="/quickstart/aspplus/samples/webforms/intro/intro1.src"
      Icon="/quickstart/aspplus/images/intro1.gif"
      Caption="C# Intro1.aspx"
      runat="server" />
  </CsTemplate>
  <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro1.aspx"
      ViewSource="/quickstart/aspplus/samples/webforms/intro/intro1.src"
      Icon="/quickstart/aspplus/images/intro1.gif"
      Caption="VB Intro1.aspx"
      runat="server" />
  </VbTemplate>
  <JsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro1.aspx"
      ViewSource="/quickstart/aspplus/samples/webforms/intro/intro1.src"
      Icon="/quickstart/aspplus/images/intro1.gif"
      Caption="JScript Intro1.aspx"
      runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Important:</b> Note that nothing happens yet when you click the Lookup button.  This is because the .aspx file contains
only static HTML (no dynamic content).  Thus, the same HTML is sent back to the client on each trip to the page,
which results in a loss of the contents of the form fields (the text box and drop-down list) between requests.


<!--BEGIN SECTION-->
<br>
<a name="usingasp">
<br>
<span class="subhead">Using ASP &lt;% %&gt; Render Blocks</span>
<p>

ASP.NET provides syntax compatibility with existing ASP pages. This includes support
for &lt;% %&gt; code render blocks that can be intermixed with HTML content within
an .aspx file. These code blocks execute in a top-down manner at page render time.

<p>

The below example demonstrates how &lt;% %&gt; render blocks can be used to loop over an HTML block (increasing
the font size each time):

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro2.src"
  Icon="/quickstart/aspplus/images/intro2.gif"
  Caption="C# Intro2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro2.src"
  Icon="/quickstart/aspplus/images/intro2.gif"
  Caption="VB Intro2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro2.src"
  Icon="/quickstart/aspplus/images/intro2.gif"
  Caption="JScript Intro2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<p>

<b>Important:</b> Unlike with ASP, the code used within the above &lt;% %&gt; blocks is actually compiled--not interpreted using a script engine.  This
results in improved runtime execution performance.

<p>

ASP.NET page developers can utilize &lt;% %&gt; code blocks to dynamically modify HTML
output much as they can today with ASP. For example, the following sample demonstrates
how &lt;% %&gt; code blocks can be used to interpret results posted back from a client.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro3.src"
  Icon="/quickstart/aspplus/images/intro3.gif"
  Caption="C# Intro3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro3.src"
  Icon="/quickstart/aspplus/images/intro3.gif"
  Caption="VB Intro3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro3.src"
  Icon="/quickstart/aspplus/images/intro3.gif"
  Caption="JScript Intro3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Important:</b> While &lt;% %&gt; code blocks provide a powerful way to custom
manipulate the text output returned from an ASP.NET page, they do not 
provide a clean HTML programming model.  As the sample above illustrates, developers using
only &lt;% %&gt; code blocks must custom manage page state between round trips and custom
interpret posted values.

<!--BEGIN SECTION-->
<br>
<a name="serverctrls">
<br>
<span class="subhead">Introduction to ASP.NET Server Controls</span>
<p>

In addition to (or instead of) using &lt;% %&gt; code blocks to program dynamic content, ASP.NET
page developers can use ASP.NET server controls to program Web pages.  Server
controls are declared within an .aspx file using custom tags or intrinsic HTML tags that contain
a <b>runat="server"</b> attribute value.  Intrinsic HTML tags are handled by one of the controls
in the <b>System.Web.UI.HtmlControls</b> namespace.  Any tag that doesn't explicitly map to one of
the controls is assigned the type of <b>System.Web.UI.HtmlControls.HtmlGenericControl</b>.

<p>

The following sample uses four server controls: <b>&lt;form runat=server&gt;</b>, <b>&lt;asp:textbox runat=server&gt;</b>,
<b>&lt;asp:dropdownlist runat=server&gt;</b>, and <b>&lt;asp:button runat=server&gt;</b>.  At run time these server controls
automatically generate HTML content.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro4.src"
  Icon="/quickstart/aspplus/images/intro4.gif"
  Caption="C# Intro4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro4.src"
  Icon="/quickstart/aspplus/images/intro4.gif"
  Caption="VB Intro4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro4.src"
  Icon="/quickstart/aspplus/images/intro4.gif"
  Caption="JScript Intro4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Important:</b> Note that these server controls automatically maintain any client-entered values between round trips
to the server.  This control state is not stored on the server (it is instead stored within an
<b>&lt;input type="hidden"&gt;</b> form field that is round-tripped between requests).  Note also that no client-side script is
required.

<p>

In addition to supporting standard HTML input controls, ASP.NET enables developers to utilize richer custom controls on their
pages.  For example, the following sample demonstrates how the <b>&lt;asp:adrotator&gt;</b> control can be used to dynamically
display rotating ads on a page.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro5.src"
  Icon="/quickstart/aspplus/images/intro5.gif"
  Caption="C# Intro5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro5.src"
  Icon="/quickstart/aspplus/images/intro5.gif"
  Caption="VB Intro5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro5.src"
  Icon="/quickstart/aspplus/images/intro5.gif"
  Caption="JScript Intro5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Important:</b> A detailed listing of all built-in server controls can
be found in the <a href="webcontrolsref.aspx">Web Forms Control Reference</a> section of
this QuickStart.

<!--BEGIN SECTION-->
<br>
<a name="handlingevts">
<br>
<span class="subhead">Handling Server Control Events</span>

<p>

Each ASP.NET server control is capable of exposing an object model containing properties, methods, and events.  ASP.NET developers can
use this object model to cleanly modify and interact with the page.

<p>

The following example demonstrates how an ASP.NET page developer can handle the <b>OnClick</b>
event from the <b>&lt;asp:button runat=server&gt;</b> control to manipulate the <b>Text</b> property
of the <b>&lt;asp:label runat=server&gt;</b> control.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro6.src"
  Icon="/quickstart/aspplus/images/intro6.gif"
  Caption="C# Intro6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro6.src"
  Icon="/quickstart/aspplus/images/intro6.gif"
  Caption="VB Intro6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro6.src"
  Icon="/quickstart/aspplus/images/intro6.gif"
  Caption="JScript Intro6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

This simple sample is functionally equivalent to the "Intro3" sample demonstrated earlier in this section.  Note, however,
how much cleaner and easier the code is in this new server-control-based version.


<!--BEGIN SECTION-->
<br>
<a name="customctrls">
<br>
<span class="subhead">Using Custom Server Controls</span>
<p>

ASP.NET ships with 45 built-in server controls that can be used out of the box (for details, see <a href="webcontrolsref.aspx">Web Forms Controls Reference</a>).  In addition to using the built-in ASP.NET controls, developers also can use controls developed
by third-party vendors.

<p>

The following sample shows a simple calendar control.  The <b>Calendar</b> control is declared within the page
using an <b>&lt;acme:calendar runat=server&gt;</b> tag.  Note that the <b>&lt;% Register %&gt;</b> directive at the top of the page is
responsible for registering the "Acme" XML tag prefix with the "Acme" code namespace of the control implementation.  The
ASP.NET page parser will then utilize this namespace to load the <b>Calendar</b> control class instance at run time.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro7.src"
  Icon="/quickstart/aspplus/images/intro7.gif"
  Caption="C# Intro7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro7.src"
  Icon="/quickstart/aspplus/images/intro7.gif"
  Caption="VB Intro7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro7.src"
  Icon="/quickstart/aspplus/images/intro7.gif"
  Caption="JScript Intro7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

The <b>Calendar</b> control in this sample has been designed to perform "uplevel-like" processing on
Internet Explorer 5.5 or higher and "downlevel" processing on all other browsers.  This browser sniffing is nowhere near
as complex as that provided by the ASP.NET built-in server controls.  For Internet Explorer 5.5 or higher browsers it
generates DHTML output.  This DHTML output does not require round trips back to the server when doing day
selections and month navigations.  For all other browsers the control generates standard HTML
3.2.  This HTML 3.2 does require round trips back to the server to handle client-side user
interactions.

<p>

<b>Important:</b> The code that a page developer writes is identical regardless of whether an "uplevel" or "downlevel" browser is
used to access the page.  The <b>Calendar</b> control itself encapsulates all of the logic required to handle the two
scenarios.

<!--BEGIN SECTION-->
<br>
<a name="listsanddata">
<br>
<span class="subhead">Lists, Data, and Data Binding</span>
<p>

ASP.NET ships with a built-in set of data grid and list controls.  These can be used to provide custom UI driven from
queries against a database or other data source.  For example, the following sample demonstrates how a
<b>&lt;asp:datagrid runat=server&gt;</b> control can be used to databind book information collected using a SQL database
query.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/Intro8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro8.src"
  Icon="/quickstart/aspplus/images/Intro8.gif"
  Caption="C# Intro8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/Intro8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro8.src"
  Icon="/quickstart/aspplus/images/Intro8.gif"
  Caption="VB Intro8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
																																																													
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/Intro8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro8.src"
  Icon="/quickstart/aspplus/images/Intro8.gif"
  Caption="JScript Intro8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

The <b>&lt;asp:datagrid runat=server&gt;</b> control provides an easy way to quickly display data results using
a traditional grid-control UI.  Alternatively, ASP.NET developers can use the <b>&lt;asp:DataList runat=server&gt;</b> control
and a custom <b>ItemTemplate</b> template to customize data information, as in the following sample.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/Intro9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro9.src"
  Icon="/quickstart/aspplus/images/Intro9.gif"
  Caption="C# Intro9.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/Intro9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro9.src"
  Icon="/quickstart/aspplus/images/Intro9.gif"
  Caption="VB Intro9.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/Intro9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro9.src"
  Icon="/quickstart/aspplus/images/Intro9.gif"
  Caption="JScript Intro9.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

Note that the <b>&lt;asp:datalist runat=server&gt;</b> control enables end users to exactly control the structure
and layout of each item within the list (using the <b>ItemTemplate</b> template property).  The control also
automatically handles the two-column wrapping of content (users can control the number of columns using
the <b>RepeatColumns</b> property on the data list).

<p>

The following sample provides an alternate view of the <b>&lt;asp:datalist runat=server&gt;</b> control. 
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/Intro10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro10.src"
  Icon="/quickstart/aspplus/images/Intro10.gif"
  Caption="C# Intro10.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/Intro10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro10.src"
  Icon="/quickstart/aspplus/images/Intro10.gif"
  Caption="VB Intro10.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/Intro10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro10.src"
  Icon="/quickstart/aspplus/images/Intro10.gif"
  Caption="JScript Intro10.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

Note that the control, data model, and page user in this example are exactly the same as those in the previous sample.  The
only difference is that, here, alternative templates are declaratively supplied to the code.

<!--BEGIN SECTION-->
<br>
<a name="formvalidate">
<br>
<span class="subhead">Form Validation Controls</span>
<p>

The ASP.NET Web Forms page framework provides a set of validation server controls that provide an easy-to-use
but powerful way to check input forms for errors, and, if necessary, display messages to the user.

<p>

Validation controls are added to an ASP.NET page like other server controls. There are
controls for specific types of validation, such as range checking or pattern matching,
plus a <b>RequiredFieldValidator</b> that ensures that a user does not skip an entry field.

<p>

The following example demonstrates how to use two <b>&lt;asp:requiredfieldvalidator runat=server&gt;</b> controls 
on a page to validate the contents of the <b>TextBox</b> and <b>DropDownList</b> controls.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/Intro11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro11.src"
  Icon="/quickstart/aspplus/images/Intro11.gif"
  Caption="C# Intro11.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/Intro11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro11.src"
  Icon="/quickstart/aspplus/images/Intro11.gif"
  Caption="VB Intro11.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/Intro11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro11.src"
  Icon="/quickstart/aspplus/images/Intro11.gif"
  Caption="JScript Intro11.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

Note that the validation controls have both uplevel and downlevel client support.  Uplevel
browsers perform validation on the client (using JavaScript and DHTML) and on the server.  Downlevel
browsers perform the validation only on the server.  The programming model for the two scenarios
is identical.

<p>

Note that ASP.NET page developers can optionally check the <b>Page.IsValid</b> property at run time to determine whether <u>all</u>
validation server controls on a page are currently valid.  This provides a simple way to determine
whether or not to proceed with business logic.  For example, the following sample performs a <b>Page.IsValid</b> check before
executing a database lookup on the specified category.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/Intro12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro12.src"
  Icon="/quickstart/aspplus/images/Intro12.gif"
  Caption="C# Intro12.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/Intro12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro12.src"
  Icon="/quickstart/aspplus/images/Intro12.gif"
  Caption="VB Intro12.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/Intro12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/Intro12.src"
  Icon="/quickstart/aspplus/images/Intro12.gif"
  Caption="JScript Intro12.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="codebehind">
<br>
<span class="subhead">Code-Behind Web Forms</span>
<p>

ASP.NET supports two methods of authoring dynamic pages.  The first is the method shown in the preceding samples, where the page code is physically declared within the originating .aspx file.  An alternative approach--known as the code-behind method--enables the page code to be more cleanly separated from the HTML content
into an entirely separate file. 

<p>

The following sample demonstrates the use of the code-behind method of writing ASP.NET page code.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/CS/intro13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro13.src"
  Icon="/quickstart/aspplus/images/intro13.gif"
  Caption="C# Intro13.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/VB/intro13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro13.src"
  Icon="/quickstart/aspplus/images/intro13.gif"
  Caption="VB Intro13.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/intro/JS/intro13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/intro/intro13.src"
  Icon="/quickstart/aspplus/images/intro13.gif"
  Caption="JScript Intro13.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li> ASP.NET Web Forms provide an easy and powerful way to build dynamic Web UI.
<li> ASP.NET Web Forms pages can target any browser client (there are no script library or cookie requirements).
<li> ASP.NET Web Forms pages provide syntax compatibility with existing ASP pages.
<li> ASP.NET server controls provide an easy way to encapsulate common functionality.
<li> ASP.NET ships with 45 built-in server controls.  Developers can also use controls built by third parties.
<li> ASP.NET server controls can automatically project both uplevel and downlevel HTML.
<li> ASP.NET templates provide an easy way to customize the look and feel of list server controls.
<li> ASP.NET validation controls provide an easy way to do declarative client or server data validation.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->