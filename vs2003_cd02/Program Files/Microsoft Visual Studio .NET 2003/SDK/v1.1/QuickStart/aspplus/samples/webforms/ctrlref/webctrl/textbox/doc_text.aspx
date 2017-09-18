<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>TextBox</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with TextBox</span>
<p>
The <b>TextBox</b> control enables the user to enter text. By default, the <b>TextMode</b>
of <b>TextBox</b> is SingleLine, but you can modify the behavior of <b>TextBox</b> by setting the <b>TextMode</b> to Password or MultiLine.

<p>The display width of <b>TextBox</b> is determined by its <b>Columns</b> property.  If <b>TextMode</b> is MutliLine, the
display height of <b>TextBox</b> is determined by the <b>Rows</b> property.

<p>The following sample illustrates using the <b>TextBox</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/CS/TextBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/TextBox1.src"
  Icon="/quickstart/aspplus/images/textbox1.gif"
  Caption="C# TextBox1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/VB/TextBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/TextBox1.src"
  Icon="/quickstart/aspplus/images/textbox1.gif"
  Caption="VB TextBox1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/JS/TextBox1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/TextBox/TextBox1.src"
  Icon="/quickstart/aspplus/images/textbox1.gif"
  Caption="JScript TextBox1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
