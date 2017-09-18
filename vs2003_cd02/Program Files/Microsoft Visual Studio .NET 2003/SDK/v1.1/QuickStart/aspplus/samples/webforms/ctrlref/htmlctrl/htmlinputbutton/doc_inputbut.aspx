<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlInputButton</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working with HtmlInputButton (Button)</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#submit">Submit and Reset HtmlInputButtons</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="working">
<span class="subhead">Working with HtmlInputButton (Button)</span>
<p>
The <b>HtmlInputButton</b> control (<b>&lt;Input type=button&gt;</b>) is similar in function to the <a href=
"/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlButton/doc_button.aspx">
&lt;button&gt;</a> tag, except that it can target any browser.</p>

<p>The following sample illustrates using the <b>HtmlInputButton</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/CS/HtmlInputButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton2.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton2.gif"
  Caption="C# HtmlInputButton2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/VB/HtmlInputButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton2.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton2.gif"
  Caption="VB HtmlInputButton2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/JS/HtmlInputButton2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton2.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton2.gif"
  Caption="JScript HtmlInputButton2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!--BEGIN SECTION-->
<a name="submit">
<span class="subhead">Submit and Reset HtmlInputButtons</span>
<p>
The <b>HtmlInputButton</b> control also supports the <b>Reset</b> and <b>Submit</b> button types, which are used only with forms.
<b>Submit</b> submits the form, whereas <b>Reset</b> restores all of the entry fields in a form to their initial values.</p>

<p>The following sample illustrates using <b>Submit</b> and <b>Reset</b> <b>HtmlInputButton</b> controls.

<p>
<!--submit/reset-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/CS/HtmlInputButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton1.gif"
  Caption="C# HtmlInputButton1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/VB/HtmlInputButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton1.gif"
  Caption="VB HtmlInputButton1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/JS/HtmlInputButton1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlInputButton/HtmlInputButton1.src"
  Icon="/quickstart/aspplus/images/htmlinputbutton1.gif"
  Caption="JScript HtmlInputButton1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
