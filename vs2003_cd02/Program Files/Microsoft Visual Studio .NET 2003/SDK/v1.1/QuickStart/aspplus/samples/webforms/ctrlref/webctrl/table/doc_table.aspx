<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Table, TableRow, and TableCell</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with Table, TableRow, and TableCell</span>
<p>
The <b>Table</b> control builds up a table programmatically by adding <b>TableRows</b>
to the <b>Rows</b> collection of the table, and <b>TableCells</b> to the <b>Cells</b> collection of the row.  You can add content to a
table cell programmatically by adding controls to the <b>Controls</b> collection of the cell.

<p>The following sample illustrates using the <b>Table</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/CS/Table1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/Table1.src"
  Icon="/quickstart/aspplus/images/table1.gif"
  Caption="C# Table1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/VB/Table1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/Table1.src"
  Icon="/quickstart/aspplus/images/table1.gif"
  Caption="VB Table1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/JS/Table1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Table/Table1.src"
  Icon="/quickstart/aspplus/images/table1.gif"
  Caption="JScript Table1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
