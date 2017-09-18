<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>RequiredFieldValidator</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, see
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with RequiredFieldValidator</span>
<p>
The <b>RequiredFieldValidator</b> control ensures that the user does not skip an entry.
The control fails validation if the value it contains does not change from its initial value when validation is performed. 
If all the fields in the page are valid, the page is valid.

<p>The following sample illustrates using the <b>RequiredFieldValidator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/CS/ReqFieldValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/ReqFieldValidator1.src"
  Icon="/quickstart/aspplus/images/reqfieldvalidator1.gif"
  Caption="C# ReqFieldValidator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/VB/ReqFieldValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/ReqFieldValidator1.src"
  Icon="/quickstart/aspplus/images/reqfieldvalidator1.gif"
  Caption="VB ReqFieldValidator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/JS/ReqFieldValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/ReqFieldValidator/ReqFieldValidator1.src"
  Icon="/quickstart/aspplus/images/reqfieldvalidator1.gif"
  Caption="JScript ReqFieldValidator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
