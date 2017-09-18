<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>DataList</h4>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working With DataList</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#selecting">Selecting Items in DataList</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#editing">Editing DataList Items</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<br>
<a name="working">
<span class="subhead">Working With DataList</span>
<p>The <b>DataList</b> control displays data items in a repeating list, and optionally supports selecting and
editing the items. The content and layout of list items in <b>DataList</b> is defined using templates. At a
minimum, every <b>DataList</b> must define an <b>ItemTemplate</b>; however, several optional templates can be used to
customize the appearance of the list. The following table describes those templates.<p>

<div class="indent">
<table class="table2" width="90%">
    <tr>
    <th width="200"><b>Template Name</b></th>
    <th width="*"><b>Description</b></th>
    </tr>
    <tr>
    <td><b>ItemTemplate</b></td>
    <td>Defines the content and layout of items within the list. Required.</td>
    </tr>
    <tr>
    <td><b>AlternatingItemTemplate</b></td>
    <td>If defined, determines the content and layout of alternating items.  If not defined, <b>ItemTemplate</b> is used.</td>
    </tr>
    <tr>
    <td><b>SeparatorTemplate</b></td>
    <td>If defined, is rendered between items (and alternating items).  If not defined, a separator is not rendered.</td>
    </tr>
    <tr>
    <td><b>SelectedItemTemplate</b></td>
    <td>If defined, determines the content and layout of the selected item.  If not defined, <b>ItemTemplate</b> (<b>AlternatingItemTemplate</b>) is used.</td>
    </tr>
    <tr>
    <td><b>EditItemTemplate</b></td>
    <td>If defined, determines the content and layout of the item being edited.  If not defined, <b>ItemTemplate</b> (<b>AlternatingItemTemplate</b>, <b>SelectedItemTemplate</b>) is used.</td>
    </tr>
    <tr>
    <td><b>HeaderTemplate</b></td>
    <td>If defined, determines the content and layout of the list header.  If not defined, the header is not rendered.</td>
    </tr>
    <tr>
    <td><b>FooterTemplate</b></td>
    <td>If defined, determines the content and layout of the list footer.  If not defined, the footer is not rendered.</td>
    </tr>
</table>
</div>

<p>Templates define the HTML elements and controls that should be displayed for an item, as well as the layout of these
elements.  Style formatting -- font, color, and border attributes -- is set via styles.  Each template has its
own style property.  For example, styles for the <b>EditItemTemplate</b> are set through the <b>EditItemStyle</b> property.

<p>A third set of properties affect the overall rendering of <b>DataList</b>.  By default, <b>DataList</b> items render within a
table as a single vertical column.  Setting the <b>RepeatLayout</b> property to <b>Flow</b> removes the HTML table
structure from the rendering of the list.

<p><b>DataList</b> supports directional rendering through the <b>RepeatDirection</b> property,
meaning it can render its items horizontally or vertically.  Since page width is the dimension that the developer
must control in Web user interface, <b>DataList</b> permits the developer to control the number of "columns" that are rendered
(<b>RepeatColumns</b>), regardless of whether the items are rendered horizontally or vertically.

<p>If <b>RepeatDirection</b> is <b>Horizontal</b> and <b>RepeatColumns</b> is <b>five</b>, the items are rendered in rows containing five columns.<p>

<div class="indent">
<table class="code" width="400">
<tr>
    <td width="20%">1</td>
    <td width="20%">2</td>
    <td width="20%">3</td>
    <td width="20%">4</td>
    <td width="20%">5</td>
</tr><tr>
    <td>6</td>
    <td>7</td>
    <td>8</td>
    <td>9</td>
    <td>10</td>
</tr><tr>
    <td>11</td>
    <td>12</td>
    <td>13</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
</table>
</div>

<p>If <b>RepeatDirection</b> is <b>Vertical</b>, and <b>RepeatColumns</b> remains set to <b>five</b>, the items are rendered
in five columns, each equal in length to the total number of items divided by five.<p>

<div class="indent">
<table class="code" width="400">
<tr>
    <td width="20%">1</td>
    <td width="20%">4</td>
    <td width="20%">7</td>
    <td width="20%">10</td>
    <td width="20%">13</td>
</tr><tr>
    <td>2</td>
    <td>5</td>
    <td>8</td>
    <td>11</td>
    <td>&nbsp;</td>
</tr><tr>
    <td>3</td>
    <td>6</td>
    <td>9</td>
    <td>12</td>
    <td>&nbsp;</td>
</tr>
</table>
</div>


<p>The following sample illustrates using a simple <b>DataList</b> control.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/CS/DataList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList1.src"
  Icon="/quickstart/aspplus/images/ref_datalist1.gif"
  Caption="C# DataList1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/VB/DataList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList1.src"
  Icon="/quickstart/aspplus/images/ref_datalist1.gif"
  Caption="VB DataList1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/JS/DataList1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList1.src"
  Icon="/quickstart/aspplus/images/ref_datalist1.gif"
  Caption="JScript DataList1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<p>
<a name="selecting">
<span class="subhead">Selecting Items in DataList</span>
<p>You can customize the content and appearance of the selected item through the <b>SelectedItemTemplate</b>
property.  The <b>SelectedItemTemplate</b> is controlled by the <b>SelectedIndex</b> property.  By default the value of
<b>SelectedIndex</b> is -1, meaning none of the items in the list is selected.  When <b>SelectedIndex</b> is set to a
particular item, that item is displayed using the <b>SelectedItemTemplate</b>.<p>

<p>The following sample illustrates using a <b>SelectedItemTemplate</b> in <b>DataList</b>.

<p>
<!--selected item-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/CS/DataList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList2.src"
  Icon="/quickstart/aspplus/images/ref_datalist2.gif"
  Caption="C# DataList2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/VB/DataList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList2.src"
  Icon="/quickstart/aspplus/images/ref_datalist2.gif"
  Caption="VB DataList2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/JS/DataList2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList2.src"
  Icon="/quickstart/aspplus/images/ref_datalist2.gif"
  Caption="JScript DataList2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<p>
<a name="editing">
<span class="subhead">Editing DataList Items</span>
<p>The <b>DataList</b> control supports in-place editing of the data in an item through its <b>EditItemTemplate</b>
property.  The <b>EditItemTemplate</b> defines the content and appearance of the item when it is being edited.  For
example, the following template includes a text box, an &quot;Update&quot; button and a &quot;Cancel&quot; button.<p>

<div class="code">
&lt;EditItemTemplate&gt;<br>
Item: &lt;asp:TextBox id=&quot;Text1&quot; runat=&quot;server&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;Text='&lt;%# ((DataRowView)Container.DataItem)[&quot;Item&quot;]  %&gt;'<br>
&nbsp;&nbsp;&nbsp;&nbsp;/>&lt;br&gt;<br>
&lt;asp:LinkButton id=&quot;button1&quot; runat=&quot;server&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;Text=&quot;Update&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;CommandName=&quot;update&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;/&gt;<br>
&lt;asp:LinkButton id=&quot;button2&quot; runat=&quot;server&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;Text=&quot;Cancel&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;CommandName=&quot;cancel&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;/&gt;<br>
&lt;/EditItemTemplate&gt;<br>
</div>

<p>The <b>EditItemTemplate</b> interacts with another property: <b>EditItemIndex</b>.  By default, the value of
<b>EditItemIndex</b> is -1, meaning none of the items in the list is being edited.  When <b>EditItemIndex</b> is set to a
particular item, that item is displayed using the <b>EditItemTemplate</b>.<p>

<p>The <b>DataList</b> also supplies three events that can be used to support editing.  <b>EditCommand</b> is thrown
when an &quot;edit&quot; command button control is clicked within the list's <b>ItemTemplate</b>.  It's up to you to handle this event
in your code.  The typical logic sets <b>EditItemIndex</b> to the selected item, and then rebinds the data to the <b>DataList</b> as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void DataList_EditCommand(object Source, DataListCommandEventArgs e) {
    DataList1.EditItemIndex = (int)e.Item.ItemIndex;
    BindList();
}
</Tab>

<Tab Name="VB">
Protected Sub DataList_EditCommand(Source As Object, e As DataListCommandEventArgs)
    DataList1.EditItemIndex = CType(e.Item.ItemIndex, Integer)
    BindList()
End Sub
</Tab>

<Tab Name="JScript">
protected function DataList_EditCommand(Source:Object, e:DataListCommandEventArgs) : void {
    DataList1.EditItemIndex = int(e.Item.ItemIndex);
    BindList();
}
</Tab>

</Acme:TabControl><p>

The <b>EditItemTemplate</b> typically contains &quot;update&quot; and &quot;cancel&quot; command buttons.  These buttons cause the
<b>UpdateCommand</b> and <b>CancelCommand</b> events to be thrown, respectively.  It's up to you to handle these events
in your code.  The typical logic for &quot;cancel&quot; sets <b>EditItemIndex</b> to -1, and then rebinds the data to the <b>DataList</b> as shown in the following example.<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void DataList_CancelCommand(object Source, DataListCommandEventArgs e) {
    DataList1.EditItemIndex = -1;
    BindList();
}
</Tab>

<Tab Name="VB">
Protected Sub DataList_CancelCommand(Source As Object, e As DataListCommandEventArgs)
    DataList1.EditItemIndex = -1
    BindList()
End Sub
</Tab>

<Tab Name="JScript">
protected function DataList_CancelCommand(Source:Object, e:DataListCommandEventArgs) : void {
    DataList1.EditItemIndex = -1;
    BindList();
}
</Tab>

</Acme:TabControl><p>

<p>The typical logic for &quot;update&quot; updates the data source, sets <b>EditItemIndex</b> to -1, and then rebinds the data to the
<b>DataList</b>.  The following sample illustrates editing items in <b>DataList</b>.

<p>
<!--edit item-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/CS/DataList3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList3.src"
  Icon="/quickstart/aspplus/images/ref_datalist3.gif"
  Caption="C# DataList3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/VB/DataList3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList3.src"
  Icon="/quickstart/aspplus/images/ref_datalist3.gif"
  Caption="VB DataList3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/JS/DataList3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/DataList/DataList3.src"
  Icon="/quickstart/aspplus/images/ref_datalist3.gif"
  Caption="JScript DataList3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
