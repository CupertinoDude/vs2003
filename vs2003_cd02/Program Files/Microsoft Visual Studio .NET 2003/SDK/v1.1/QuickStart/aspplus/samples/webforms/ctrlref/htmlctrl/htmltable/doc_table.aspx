<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>HtmlTable, HtmlTableRow, and HtmlTableCell</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with HtmlTable, HtmlTableRow, and HtmlTableCell</span>
<p>The <b>HtmlTable</b> control lets you build up a table programmatically by adding <b>HtmlTableRow</b> controls
to the table's Rows collection and <b>HtmlTableCell</b> controls to the row's Cells collection.  You can add content to a
table cell programmatically by adding controls to the cell's Controls collection.

<p>The following sample illustrates using the <b>HtmlTable</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/CS/HtmlTable1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/HtmlTable1.src"
  Icon="/quickstart/aspplus/images/htmltable.gif"
  Caption="C# HtmlTable1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/VB/HtmlTable1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/HtmlTable1.src"
  Icon="/quickstart/aspplus/images/htmltable.gif"
  Caption="VB HtmlTable1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/JS/HtmlTable1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/htmlctrl/HtmlTable/HtmlTable1.src"
  Icon="/quickstart/aspplus/images/htmltable.gif"
  Caption="JScript HtmlTable1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
