<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Working with Server Controls</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#declaring">Declaring Server Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#manipulating">Manipulating Server Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#handling">Handling Control Action Events</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#multiple">Handling Multiple Control Action Events</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#navigation1">Performing Page Navigation (Scenario 1)</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#navigation2">Performing Page Navigation (Scenario 2)</a><br>
</div>
</p>

<p>

<hr>

This section of the QuickStart illustrates some common core concepts and common actions
performed by end users when using ASP.NET server controls within a page.

<!--BEGIN SECTION-->
<br>
<a name="declaring">
<br>
<span class="subhead">Declaring Server Controls</span>
<p>

ASP.NET server controls are identified within a page using declarative tags
that contain a <b>runat="server"</b> attribute.  The following example declares three
<b>&lt;asp:label runat="server"&gt;</b> server controls and customizes the text and
style properties of each one individually.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls1.src"
  Icon="/quickstart/aspplus/images/controls1.gif"
  Caption="C# Controls1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls1.src"
  Icon="/quickstart/aspplus/images/controls1.gif"
  Caption="VB Controls1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls1.src"
  Icon="/quickstart/aspplus/images/controls1.gif"
  Caption="JScript Controls1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="manipulating">
<br>
<span class="subhead">Manipulating Server Controls</span>
<p>

You can programmatically identify an individual ASP.NET server control
within a page by providing it with an <b>id</b> attribute.  You
can use this <b>id</b> reference to programmatically manipulate the server control's
object model at run time.  For example, the following sample demonstrates how a page
developer could programmatically set an <b>&lt;asp:label runat="server"&gt;</b> control's
<b>Text</b> property within the <b>Page_Load</b> event.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls2.src"
  Icon="/quickstart/aspplus/images/controls2.gif"
  Caption="C# Controls2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls2.src"
  Icon="/quickstart/aspplus/images/controls2.gif"
  Caption="VB Controls2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls2.src"
  Icon="/quickstart/aspplus/images/controls2.gif"
  Caption="JScript Controls2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="handling">
<br>
<span class="subhead">Handling Control Action Events</span>
<p>

ASP.NET server controls can optionally expose and raise server events, which
can be handled by page developers.  A page developer may accomplish this
by declaratively wiring an event to a control (where the attribute
name of an event wireup indicates the event name and the attribute value
indicates the name of a method to call).  For example, the following code
example demonstrates how to wire an <b>OnClick</b> event to a button control.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls3.src"
  Icon="/quickstart/aspplus/images/controls3.gif"
  Caption="C# Controls3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls3.src"
  Icon="/quickstart/aspplus/images/controls3.gif"
  Caption="VB Controls3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls3.src"
  Icon="/quickstart/aspplus/images/controls3.gif"
  Caption="JScript Controls3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>



<!--BEGIN SECTION-->
<br>
<a name="multiple">
<br>
<span class="subhead">Handling Multiple Control Action Events</span>
<p>


Event handlers provide a clean way for page developers to structure logic
within an ASP.NET page.  For example, the following sample demonstrates how to
wire and handle four button events on a single page.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls4.src"
  Icon="/quickstart/aspplus/images/controls4.gif"
  Caption="C# Controls4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls4.src"
  Icon="/quickstart/aspplus/images/controls4.gif"
  Caption="VB Controls4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls4.src"
  Icon="/quickstart/aspplus/images/controls4.gif"
  Caption="JScript Controls4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="navigation1">
<br>
<span class="subhead">Performing Page Navigation (Scenario 1)</span>
<p>

Page navigation among multiple pages is a common scenario in virtually
all Web applications.  The following sample demonstrates how to use the <b>&lt;asp:hyperlink runat=server&gt;</b> control to navigate
to another page (passing custom query string parameters along the way).  The
sample then demonstrates how to easily get access to these
query string parameters from the target page.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls5.src"
  Icon="/quickstart/aspplus/images/controls5.gif"
  Caption="C# Controls5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls5.src"
  Icon="/quickstart/aspplus/images/controls5.gif"
  Caption="VB Controls5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls5.src"
  Icon="/quickstart/aspplus/images/controls5.gif"
  Caption="JScript Controls5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="navigation2">
<br>
<span class="subhead">Performing Page Navigation (Scenario 2)</span>
<p>


Not all page navigation scenarios are initiated through hyperlinks on the client.
Client-side page redirects or navigations can also be initiated from the
server by an ASP.NET page developer by calling the <b>Response.Redirect(url)</b> method.
This is typically done when server-side validation is required on some client
input before the navigation actually takes place.

<p>The following sample demonstrates how to use the <b>Response.Redirect</b>
 method to pass parameters to another target page.  It also demonstrates how to easily get access to these parameters from the target
page.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/CS/controls6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls6.src"
  Icon="/quickstart/aspplus/images/controls6.gif"
  Caption="C# Controls6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/VB/controls6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls6.src"
  Icon="/quickstart/aspplus/images/controls6.gif"
  Caption="VB Controls6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/controls/JS/controls6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/controls/controls6.src"
  Icon="/quickstart/aspplus/images/controls6.gif"
  Caption="JScript Controls6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->