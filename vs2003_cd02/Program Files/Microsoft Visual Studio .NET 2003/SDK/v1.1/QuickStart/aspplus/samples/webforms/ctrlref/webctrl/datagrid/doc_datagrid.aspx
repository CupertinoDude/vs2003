<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>DataGrid</h4>

<div class="indent" style="width:660">
These samples illustrate using the <b>DataGrid</b> control.  These examples use sample data rather than data from a real
database.  Please see the <a href="/quickstart/aspplus/doc/webdataaccess.aspx">Server-Side Data Access</a> section for
examples of <b>DataGrid</b> bound to live data.
</div>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working With DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#columns">Defining Columns in DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#editing">Editing Data in DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#hiding">Hiding Columns in DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#sorting">Sorting Columns in DataGrid</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#paging">Paging in DataGrid</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<br>
<a name="working">
<span class="subhead">Working With DataGrid</span>
<p>The <b>DataGrid</b> control displays tabular data and optionally supports selecting, sorting, paging, and
editing the data.  By default, <b>DataGrid</b> generates a <b>BoundColumn</b> for each field in the data source (<b>AutoGenerateColumns</b>=<b>true</b>).
Each field in the data is rendered in a separate column, in the order it occurs in the data.  Field names appear in the grid's
column headers, and values are rendered in text labels.  A default format is applied to non-string values.

<p>The following sample illustrates using a simple <b>DataGrid</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid1.src"
  Icon="/quickstart/aspplus/images/ref_datagrid1.gif"
  Caption="C# DataGrid1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid1.src"
  Icon="/quickstart/aspplus/images/ref_datagrid1.gif"
  Caption="VB DataGrid1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid1.src"
  Icon="/quickstart/aspplus/images/ref_datagrid1.gif"
  Caption="JScript DataGrid1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="columns">
<span class="subhead">Defining Columns in DataGrid</span>
<p>You can control the order, behavior, and rendering of individual columns by directly manipulating the grid's
Columns collection.  The standard column type -- <b>BoundColumn</b> -- renders the values in text labels.
The grid also supports other column types that render differently.  Any of the column types can be used together
with the Columns collection of a <b>DataGrid</b>.<p>

<p>Note that you can use explicitly-declared columns together with auto-generated columns (<b>AutoGenerateColumns</b>=<b>true</b>).
When used together, the explicitly-declared columns in the Columns collection are rendered first, and then the
auto-generated columns are rendered.  The auto-generated columns are not added to the Columns collection.</p>

<div class="indent">
<table class="table2" width="75%">
    <tr>
    <th style="width:25%"><b>Column Name</b></th>
    <th>Description</th>
    </tr>
    <tr>
    <td style="width:25%"><b>BoundColumn</b></td>
    <td>Lets you control the order and rendering of the columns.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>HyperLinkColumn</b></td>
    <td>Presents the bound data in <b>HyperLink</b> controls.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>ButtonColumn</b></td>
    <td>Bubbles a user command from within a row to an event handler on the grid.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>TemplateColumn</b></td>
    <td>Lets you control which controls are rendered in the column.</td>
    </tr>
    <td style="width:25%"><b>EditCommandColumn</b></td>
    <td>Displays Edit, Update, and Cancel links in response to changes in the <b>DataGrid</b> control's <b>EditItemIndex</b> property.</td>
    </tr>
</table>
</div>

<!--BoundColumn-->
<p>By explicitly creating a <b>BoundColumn</b> in the grid's Columns collection, you can control the order
and rendering of each column.  The following example shows how to use <b>BoundColumn</b>.<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid2.src"
  Icon="/quickstart/aspplus/images/ref_datagrid2.gif"
  Caption="C# DataGrid2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid2.src"
  Icon="/quickstart/aspplus/images/ref_datagrid2.gif"
  Caption="VB DataGrid2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid2.src"
  Icon="/quickstart/aspplus/images/ref_datagrid2.gif"
  Caption="JScript DataGrid2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--HyperLinkColumn-->
<p>A <b>HyperLinkColumn</b> presents the bound data in <b>HyperLink</b> controls.  This is typically used to navigate
from an item in the grid to a Details view on another page. In the following example, the value <b>IntegerValue</b> data field
is passed as an argument in the URL to another page, and the <b>StringValue</b> data field is used as the display text
of the hyperlink.
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid3.src"
  Icon="/quickstart/aspplus/images/ref_datagrid3.gif"
  Caption="C# DataGrid3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid3.src"
  Icon="/quickstart/aspplus/images/ref_datagrid3.gif"
  Caption="VB DataGrid3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid3.src"
  Icon="/quickstart/aspplus/images/ref_datagrid3.gif"
  Caption="JScript DataGrid3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--ButtonColumn-->
<p>A <b>ButtonColumn</b> is used to bubble a user command from within a row to an event handler on the grid.
In the following example, the "Add To Cart" and "Remove From Cart" commands cause the item from the row where
the button was clicked to be added or removed from a simple shopping cart.<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid4.src"
  Icon="/quickstart/aspplus/images/ref_datagrid4.gif"
  Caption="C# DataGrid4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid4.src"
  Icon="/quickstart/aspplus/images/ref_datagrid4.gif"
  Caption="VB DataGrid4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid4.src"
  Icon="/quickstart/aspplus/images/ref_datagrid4.gif"
  Caption="JScript DataGrid4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--TemplateColumn-->
<p>With a <b>TemplateColumn</b>, you completely control which controls are rendered in the column, and which data fields
are bound to the controls.  The following example includes two <b>TemplateColumn</b> objects.  The first column renders two <b>LinkButton</b> controls.
These bubble commands to the grid's <b>ItemCommand</b>, just as a <b>ButtonColumn</b> does. The last column binds the
<b>true/false</b> value to a read-only <b>CheckBox</b>.<p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid5.src"
  Icon="/quickstart/aspplus/images/ref_datagrid5.gif"
  Caption="C# DataGrid5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid5.src"
  Icon="/quickstart/aspplus/images/ref_datagrid5.gif"
  Caption="VB DataGrid5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid5.src"
  Icon="/quickstart/aspplus/images/ref_datagrid5.gif"
  Caption="JScript DataGrid5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--EditCommandColumn-->
<p>The <b>EditCommandColumn</b> is a special column type that supports in-place editing of the data in one row in the grid.
<b>EditCommandColumn</b> interacts with another property of the grid: <b>EditItemIndex</b>.  By default the value of
<b>EditItemIndex</b> is -1, meaning none of the rows (items) in the grid is being edited.  If <b>EditItemIndex</b> is -1, an
"edit" button is displayed in the <b>EditCommandColumn</b> for each of the rows in the grid.<p>

When the "edit" button is clicked, the grid's <b>EditCommand</b> event is thrown.  It's up to you to handle this event
in your code.  The typical logic sets <b>EditItemIndex</b> to the selected row, and then rebinds the data to the grid.<p>

When <b>EditItemIndex</b> is set to a particular row, the <b>EditCommandColumn</b> displays "update" and "cancel" buttons for
that row ("edit" is still displayed for the other rows).  These buttons cause the <b>UpdateCommand</b> and <b>CancelCommand</b>
event to be thrown, respectively. The following sample demonstrates this functionality.<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid6.src"
  Icon="/quickstart/aspplus/images/ref_datagrid6.gif"
  Caption="C# DataGrid6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid6.src"
  Icon="/quickstart/aspplus/images/ref_datagrid6.gif"
  Caption="VB DataGrid6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid6.src"
  Icon="/quickstart/aspplus/images/ref_datagrid6.gif"
  Caption="JScript DataGrid6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="editing">
<span class="subhead">Editing Data in DataGrid</span>
<p>In the previous example, the <b>EditCommandColumn</b> was used to support in-place editing of a single row of data.  When
you use <b>EditItemIndex</b>, the grid automatically inserts the values to be edited into <b>TextBox</b> and <b>CheckBox</b> controls.

<p>By using <b>TemplateColumn</b> objects for the fields you want to edit, you can precisely control how the data is edited.
In the following example, the Quantity and Gift Wrap fields are editable in all rows.  When the "Update Totals" button
is clicked, the grid's Items collection is traversed to extract the current values for these fields, and the data
source is updated.

<!--editing data-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid13.src"
  Icon="/quickstart/aspplus/images/ref_datagrid13.gif"
  Caption="C# DataGrid13.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid13.src"
  Icon="/quickstart/aspplus/images/ref_datagrid13.gif"
  Caption="VB DataGrid13.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid13.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid13.src"
  Icon="/quickstart/aspplus/images/ref_datagrid13.gif"
  Caption="JScript DataGrid13.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="hiding">
<span class="subhead">Hiding Columns in DataGrid</span>
<p>Each column in the grid has a <b>Visible</b> property.  Setting <b>Visible</b> to <b>false</b> hides a column.
<!--controlling visibility of a column-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid7.src"
  Icon="/quickstart/aspplus/images/ref_datagrid7.gif"
  Caption="C# DataGrid7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid7.src"
  Icon="/quickstart/aspplus/images/ref_datagrid7.gif"
  Caption="VB DataGrid7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid7.src"
  Icon="/quickstart/aspplus/images/ref_datagrid7.gif"
  Caption="JScript DataGrid7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="sorting">
<span class="subhead">Sorting Columns in DataGrid</span>
<p>Data in a grid is commonly sorted by clicking the header of the column you wish to sort.  You can enable
sorting in <b>DataGrid</b> by setting <b>AllowSorting</b> to <b>true</b>.  When enabled, the grid renders <b>LinkButton</b> controls
in the header for each column.  When the button is clicked, the grid's <b>SortCommand</b> event is thrown.  It's up
to you to handle this event in your code.  Because <b>DataGrid</b> always displays the data in the same order it occurs
in the data source, the typical logic sorts the data source, and then rebinds the data to the grid.<p>

The following example shows how to implement simple sorting in <b>DataGrid</b>.
<!--sorting 1-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid8.src"
  Icon="/quickstart/aspplus/images/ref_datagrid8.gif"
  Caption="C# DataGrid8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid8.src"
  Icon="/quickstart/aspplus/images/ref_datagrid8.gif"
  Caption="VB DataGrid8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid8.src"
  Icon="/quickstart/aspplus/images/ref_datagrid8.gif"
  Caption="JScript DataGrid8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--sorting 2-->
<p>You can customize the grid's sorting behavior by creating the Columns collection and manipulating the <b>SortExpression</b>
for each column.  (For auto-generated columns, the <b>SortExpression</b> is the same as the data field.)  Omitting <b>SortExpression</b> on
a column disables sorting by that column.<p>

You can also create an Outlook-style sort button by using a <b>TemplateColumn</b>.  Note that the button must also specify the "sort"
<b>CommandName</b>.  Additionally, it must pass the field by which to sort as a <b>CommandArgument</b>, as shown in the following sample.<p>
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid9.src"
  Icon="/quickstart/aspplus/images/ref_datagrid9.gif"
  Caption="C# DataGrid9.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid9.src"
  Icon="/quickstart/aspplus/images/ref_datagrid9.gif"
  Caption="VB DataGrid9.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid9.src"
  Icon="/quickstart/aspplus/images/ref_datagrid9.gif"
  Caption="JScript DataGrid9.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="paging">
<span class="subhead">Paging in DataGrid</span>
<p>The <b>DataGrid</b> provides the means to display a group of records from the data source (for example, the
first 10), and then navigate to the "page" containing the next 10 records, and so on through the data.

<p>You enable paging in <b>DataGrid</b> by setting <b>AllowPaging</b> to <b>true</b>.  When enabled, the grid will display page
navigation buttons either as "next/previous" buttons or as numeric buttons.  When a page navigation button is clicked, the <b>PageIndexChanged</b> event is thrown. It's up to you to handle this event in your code. The most basic logic assigns the <b>CurrentPageIndex</b> to the event argument's <b>NewPageIndex</b> property and then rebinds the data source, as shown in the following example.<p>

<!--Paging 1-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid10.src"
  Icon="/quickstart/aspplus/images/ref_datagrid10.gif"
  Caption="C# DataGrid10.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid10.src"
  Icon="/quickstart/aspplus/images/ref_datagrid10.gif"
  Caption="VB DataGrid10.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid10.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid10.src"
  Icon="/quickstart/aspplus/images/ref_datagrid10.gif"
  Caption="JScript DataGrid10.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>The <b>DataGrid</b> has a built-in page navigation control, called the "pager," which displays either as "next/previous"
buttons or as a set of numeric page buttons.  You can hide the built-in pager user interface and supply your own paging UI.<p>

To change the page, you must set the <b>CurrentPageIndex</b> to the desired page (base 0), and rebind the
data source to the grid.<p>

<!--Providing Alternate Paging UI-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid11.src"
  Icon="/quickstart/aspplus/images/ref_datagrid11.gif"
  Caption="C# DataGrid11.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid11.src"
  Icon="/quickstart/aspplus/images/ref_datagrid11.gif"
  Caption="VB DataGrid11.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid11.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid11.src"
  Icon="/quickstart/aspplus/images/ref_datagrid11.gif"
  Caption="JScript DataGrid11.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>For very large data models, it is expensive to load the entire data source each time the grid is paged.  A
common alternative is to retrieve the data in page-size chunks, rather than retrieving all of
the data and then stepping into the current row.<p>

The <b>DataGrid</b> supports chunking through the <b>AllowCustomPaging</b> and <b>VirtualItemCount</b> properties.  If
<b>AllowCustomPaging</b> is <b>true</b>, the <b>DataGrid</b> does not calculate a starting display position in the data model based
on <b>CurrentPageIndex</b>.  Instead, <b>DataGrid</b> displays all of the data in the data model, while its pager
reports the current position as page <b>CurrentPageIndex</b> of <code>(VirtualItemCount+PageSize-1)/PageSize</code>. The following example demonstrates this functionality.<p>
<!--Custom Paging-->
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/CS/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid12.src"
  Icon="/quickstart/aspplus/images/ref_datagrid12.gif"
  Caption="C# DataGrid12.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/VB/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid12.src"
  Icon="/quickstart/aspplus/images/ref_datagrid12.gif"
  Caption="VB DataGrid12.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/JS/datagrid12.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datagrid/datagrid12.src"
  Icon="/quickstart/aspplus/images/ref_datagrid12.gif"
  Caption="JScript DataGrid12.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
