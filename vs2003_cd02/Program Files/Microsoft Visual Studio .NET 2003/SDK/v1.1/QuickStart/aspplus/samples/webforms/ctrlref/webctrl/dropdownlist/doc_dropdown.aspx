<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>DropDownList</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with DropDownList</span>
<p>The <b>DropDownList</b> control provides a single-select drop-down list.  The following sample illustrates using a simple <b>DropDownList</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/CS/DropDownList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList1.src"
  Icon="/quickstart/aspplus/images/dropdownlist1.gif"
  Caption="C# DropDownList1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/VB/DropDownList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList1.src"
  Icon="/quickstart/aspplus/images/dropdownlist1.gif"
  Caption="VB DropDownList1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/JS/DropDownList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList1.src"
  Icon="/quickstart/aspplus/images/dropdownlist1.gif"
  Caption="JScript DropDownList1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<p>The following sample illustrates using data binding with a <b>DropDownList</b> control.

<p>
<!--databinding-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/CS/DropDownList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList2.src"
  Icon="/quickstart/aspplus/images/dropdownlist2.gif"
  Caption="C# DropDownList2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/VB/DropDownList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList2.src"
  Icon="/quickstart/aspplus/images/dropdownlist2.gif"
  Caption="VB DropDownList2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/JS/DropDownList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DropDownList/DropDownList2.src"
  Icon="/quickstart/aspplus/images/dropdownlist2.gif"
  Caption="JScript DropDownList2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
