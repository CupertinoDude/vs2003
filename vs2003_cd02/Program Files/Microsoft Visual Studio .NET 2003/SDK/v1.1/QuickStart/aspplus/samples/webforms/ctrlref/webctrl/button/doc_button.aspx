<%@ Page Language="C#" %>
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Button</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#postback">PostBack Using Button</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#command">Bubbling Button Clicks Within a List</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#mouseover">Mouse-Over Effects on Button</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="postback">
<span class="subhead">Postback Using Button</span>
<p>
The <b>Button</b> control provides a command button-style control that is used to post a Web Forms page back to the server.
The following sample illustrates using a simple <b>Button</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/CS/Button1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button1.src"
  Icon="/quickstart/aspplus/images/button1.gif"
  Caption="C# Button1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/VB/Button1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button1.src"
  Icon="/quickstart/aspplus/images/button1.gif"
  Caption="VB Button1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/JS/Button1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button1.src"
  Icon="/quickstart/aspplus/images/button1.gif"
  Caption="JScript Button1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="command">
<span class="subhead">Bubbling Button Clicks Within a List</span>
<p>
When used in a templated list such as a <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/repeater/doc_repeater.aspx">Repeater</a>, <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datalist/doc_datalist.aspx">DataList</a>, or <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/doc_datagrid.aspx">DataGrid</a>, many <b>Button</b> controls might be
rendered as the list iterates over its data source. For more information, see the <a href="/quickstart/aspplus/doc/webdatabinding.aspx">Data Binding</a> section.  Because each of these <b>Button</b> controls shares the same ID, you cannot simply bind an event handler to each <b>Button</b> control's <b>OnClick</b> event to determine the particular <b>Button</b> that was clicked.  To solve this, you use event bubbling to  fire an event on the container control (in this case, the <b>Repeater</b>, <b>DataList</b>, or <b>DataGrid</b>), and let the container impart additional information to the event handler about the item that raised the event.
<p>
These events can be raised from a <b>Button</b> by specifying a <b>CommandName</b> property with the name of the event.  When the <b>Button</b> is clicked, the command "bubbles" to the container control (such as <b>Repeater</b>), which fires its own event. The arguments for this event might contain additional information, such as a custom string or the index of the item that raised the event.
<p>
The following sample illustrates how a <b>Button</b> control's commands can bubble to the <b>OnItemCommand</b> event of a list.  The <b>Button</b> control's <b>CommandName</b> and <b>CommandArgument</b> strings are passed to the <b>OnItemCommand</b> event, permitting the sample code to distinguish which button was clicked.

<!--command button-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/CS/Button2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button2.src"
  Icon="/quickstart/aspplus/images/button2.gif"
  Caption="C# Button2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/VB/Button2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button2.src"
  Icon="/quickstart/aspplus/images/button2.gif"
  Caption="VB Button2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/JS/Button2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button2.src"
  Icon="/quickstart/aspplus/images/button2.gif"
  Caption="JScript Button2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="mouseover">
<span class="subhead">Mouse-Over Effects on Button</span>
<p>
You can hook the client script events <b>onmouseover</b> and <b>onmouseout</b> on a <b>Button</b> control to provide mouse-over
effects such as changing the font or color of the button.  Client attributes such as <b>onmouseover</b> are disregarded by ASP.NET
on the server, and passed "as is" to the browser.  If your application targets newer browsers that support DHTML, these
events will fire in the browser as the cursor passes over the button. The following sample demonstrates buttons with mouse-over effects.
<p>

<!--rollover-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/CS/Button3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button3.src"
  Icon="/quickstart/aspplus/images/button3.gif"
  Caption="C# Button3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/VB/Button3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button3.src"
  Icon="/quickstart/aspplus/images/button3.gif"
  Caption="VB Button3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/JS/Button3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Button/Button3.src"
  Icon="/quickstart/aspplus/images/button3.gif"
  Caption="JScript Button3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
