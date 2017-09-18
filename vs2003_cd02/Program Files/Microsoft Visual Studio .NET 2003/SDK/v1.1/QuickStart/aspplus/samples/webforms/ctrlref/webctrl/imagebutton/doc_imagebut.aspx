<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>ImageButton</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working with ImageButton</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#imagemap">Using ImageButton as an Image Map</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#mouseover">Mouse-Over Effects on ImageButton</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="working">
<span class="subhead">Working with ImageButton</span>
<p>Like the <b>Button</b> control, <b>ImageButton</b> is used to post back to the server. For additional button
examples, see <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/button/doc_button.aspx">
Button</a> and <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/linkbutton/doc_linkbut.aspx">
LinkButton</a>.

<p>The following sample illustrates using the <b>ImageButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/CS/ImageButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton1.src"
  Icon="/quickstart/aspplus/images/imagebutton1.gif"
  Caption="C# ImageButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/VB/ImageButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton1.src"
  Icon="/quickstart/aspplus/images/imagebutton1.gif"
  Caption="VB ImageButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/JS/ImageButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton1.src"
  Icon="/quickstart/aspplus/images/imagebutton1.gif"
  Caption="JScript ImageButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--image map-->
<p>
<a name="imagemap">
<span class="subhead">Using ImageButton as an Image Map</span>
<p>The <b>ImageButton</b> click event also supplies the x/y coordinates of where the user clicked the image.
This provides a means to respond differently depending on what part of the image is clicked.</p>
<p>The following sample illustrates using the <b>ImageButton</b> control as an image map.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/CS/ImageButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton2.src"
  Icon="/quickstart/aspplus/images/imagebutton2.gif"
  Caption="C# ImageButton2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/VB/ImageButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton2.src"
  Icon="/quickstart/aspplus/images/imagebutton2.gif"
  Caption="VB ImageButton2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/JS/ImageButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton2.src"
  Icon="/quickstart/aspplus/images/imagebutton2.gif"
  Caption="JScript ImageButton2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="mouseover">
<span class="subhead">Mouse-Over Effects on ImageButton</span>
<p>
You can hook the client script events <b>onmouseover</b> and <b>onmouseout</b> on an <b>ImageButton</b> control to provide mouse-over
effects such as changing the image source of the button.  Client attributes such as <b>onmouseover</b> are disregarded by ASP.NET
on the server and passed unchanged to the browser.  If your application targets newer browsers that support DHTML, these
events will occur in the browser as the cursor passes over the button.
<p>
<!--rollover-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/CS/ImageButton3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton3.src"
  Icon="/quickstart/aspplus/images/imagebutton3.gif"
  Caption="C# ImageButton3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/VB/ImageButton3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton3.src"
  Icon="/quickstart/aspplus/images/imagebutton3.gif"
  Caption="VB ImageButton3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/JS/ImageButton3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ImageButton/ImageButton3.src"
  Icon="/quickstart/aspplus/images/imagebutton3.gif"
  Caption="JScript ImageButton3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
