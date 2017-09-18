<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Data Access and Customization</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#templates">Introduction to Templated Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#postback">Handling Postbacks from a Template</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#selectandedit">Using Select and Edit Templates</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#finding">Finding a Control Inside a Template</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><p>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="templates">
<span class="subhead">Introduction to Templated Controls</span>
<p>
While the <b>DataGrid</b> server control demonstrated in the previous section is suitable for many Web application scenarios where a
grid-like representation of data is appropriate, many times the presentation of data needs to be much richer.  ASP.NET offers
two controls, <b>DataList</b> and <b>Repeater</b>, that give you greater flexibility over the rendering of list-like
data.  These controls are template-based, and so have no default rendering of their own.  The way data is rendered is
completely determined by the your implementation of the control's templates, which describe how to present
data items.
<p>
Like the <b>DataGrid</b> control, <b>DataList</b> and <b>Repeater</b> support a <b>DataSource</b> property, which can be set to any <b>ICollection</b>, <b>IEnumerable</b>, or <b>IListSource</b> type.  The data in this
<b>DataSource</b> is bound to the control using its <b>DataBind</b> method.  Once the data is bound, the format of each data item is
described by a template.
<p>
The <b>ItemTemplate</b> property controls the rendering of each item in the DataSource collection.  Inside an <b>ItemTemplate</b>, you can define
any arbitrary presentation code (HTML or otherwise).  Using the ASP.NET data binding syntax, you can insert values from the data bound to
the <b>DataList</b> or <b>Repeater</b> control, as shown in the following example.
<p>

<div class="code"><pre>
&lt;ASP:Repeater id="MyRepeater" runat="server"&gt;

    &lt;ItemTemplate&gt;
        Hello &lt;%# DataBinder.Eval(Container.DataItem, "name") %&gt; !
    &lt;/ItemTemplate&gt;

&lt;/ASP:Repeater&gt;
</pre></div>

<p>
The <b>Container</b> represents the first control in the immediate hierarchy that supports the
<b>System.Web.UI.INamingContainer</b> marker interface.  In this case, the <b>Container</b> resolves to an object of type
<b>System.Web.UI.WebControls.RepeaterItem</b>, which has a <b>DataItem</b> property.  As the <b>Repeater</b> iterates
over the DataSource collection, the <b>DataItem</b> contains the current item in this collection.  For example, if the data source is set to
an <b>ArrayList</b> of Employee objects, the <b>DataItem</b> is of type Employees.  When bound to a <b>DataView</b>, the <b>DataItem</b> is of type
<b>DataRowView</b>.
<p>
The following example demonstrates a <b>Repeater</b> control bound to a <b>DataView</b> (returned from a SQL query).  <b>HeaderTemplate</b>
and <b>FooterTemplate</b> have also been defined and render at the beginning and end of the list, respectively.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist1.src"
  Icon="/quickstart/aspplus/images/datalist1.gif"
  Caption="C# DataList1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist1.src"
  Icon="/quickstart/aspplus/images/datalist1.gif"
  Caption="VB DataList1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist1.src"
  Icon="/quickstart/aspplus/images/datalist1.gif"
  Caption="JScript DataList1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The <b>Repeater</b> control just iterates over the bound data, rendering the <b>ItemTemplate</b> once for each item in the DataSource collection.
It does not render anything besides the elements contained in its templates.  While the <b>Repeater</b> is a general purpose iterator,
the <b>DataList</b> provides some additional features for controlling the layout of the list.  Unlike the <b>Repeater</b>, <b>DataList</b> renders additonal
elements, like table rows and cells and spans containing style attributes, outside of the template definition to enable this richer
formatting.  For example, <b>DataList</b> supports <b>RepeatColumns</b> and <b>RepeatDirection</b> properties that specify whether
data should be rendered in multiple columns, and in which direction (vertical or horizontal) the data items should be rendered.  <b>DataList</b> also
supports style attributes, as shown in the following example.
<p>

<div class="code"><pre>
&lt;ASP:DataList runat="server" DataSource="&lt;%#MyData%&gt;"
    RepeatColumns="2"
    RepeatDirection="Horizontal"
    ItemStyle-Font-Size="10pt"
    ItemStyle-Font-Name="Verdana"
&gt;
    ...
&lt;/ASP:DataList&gt;
</pre></div>

<p>
<b>Note:</b> The remainder of this section concentrates on the many features of the <b>DataList</b> control.  For more information about the
<b>Repeater</b> control, refer to the <a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/repeater/doc_repeater.aspx">Repeater</a>
topic in the <a href="webcontrolsref.aspx">Web Forms Controls Reference</a> section of this tutorial.
<p>

The following sample demonstrates the use of the <b>DataList</b> control.  Note that the look of the data items has been changed
from the previous example, simply by changing the contents of the control's <b>ItemTemplate</b> property.  The <b>RepeatDirection</b> and <b>RepeatColumns</b>
properties determine how the <b>ItemTemplates</b> are laid out.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist2.src"
  Icon="/quickstart/aspplus/images/datalist2.gif"
  Caption="C# Datalist2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist2.src"
  Icon="/quickstart/aspplus/images/datalist2.gif"
  Caption="VB Datalist2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist2.src"
  Icon="/quickstart/aspplus/images/datalist2.gif"
  Caption="JScript Datalist2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The following example further demonstrates the infinite flexibility of templates by changing the <b>ItemTemplate</b> yet again.
This time, one of the <b>DataItem</b> values has been substituted for the "src" attribute of an <b>&lt;img&gt;</b> tag. The <i>format</i> 
<b>String</b> parameter of <b>DataBinder.Eval</b> has also been used to substitute a <b>DataItem</b> value in the query string for a URL.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist3.src"
  Icon="/quickstart/aspplus/images/datalist3.gif"
  Caption="C# Datalist3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist3.src"
  Icon="/quickstart/aspplus/images/datalist3.gif"
  Caption="VB Datalist3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist3.src"
  Icon="/quickstart/aspplus/images/datalist3.gif"
  Caption="JScript Datalist3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="postback">
<br>
<span class="subhead">Handling Postbacks from a Template</span>
<p>
As in the <b>DataGrid</b>, you can fire a command from inside a <b>DataList</b> template that is passed to an event handler wired to the
<b>DataList</b> itself.  For example, a <b>LinkButton</b> inside the <b>ItemTemplate</b> might fire a <b>Select</b> command.  By setting the
<b>OnSelectedIndexChanged</b> property of the <b>DataList</b>, you can call an event handler in response to this command. The following example demonstrates this process.

<p>

<div class="code"><pre>
&lt;ASP:DataList id="MyDataList" OnSelectedIndexChanged="MyDataList_Select" runat="server"&gt;

    &lt;ItemTemplate&gt;

        &lt;asp:linkbutton CommandName="Select" runat="server"&gt;
            &lt;%# DataBinder.Eval(Container.DataItem, "title") %&gt;
        &lt;/asp:linkbutton&gt;

    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</pre></div>

<p>
The following sample demonstrates this code in action.  In the <code>MyDataList_Select</code> event handler, you populate several other server controls
with the details about the particular selected item.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist4.src"
  Icon="/quickstart/aspplus/images/datalist4.gif"
  Caption="C# Datalist4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist4.src"
  Icon="/quickstart/aspplus/images/datalist4.gif"
  Caption="VB Datalist4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist4.src"
  Icon="/quickstart/aspplus/images/datalist4.gif"
  Caption="JScript Datalist4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Note that while the <b>DataList</b> recognizes a few special commands such as <b>Select</b> and <b>Edit/Update/Cancel</b>, the command string fired inside a template
can be any arbitrary string.  For all commands, the <b>DataList</b>'s <b>OnItemCommand</b> is fired.  You can wire this event to a handler
as in the previous example; the following example shows how to do this.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script runat="server"&gt;

    protected void MyDataList_ItemCommand(Object sender, DataListCommandEventArgs e) {
        String command = e.CommandName;

        switch(command) {
          case "Discussions":
            ShowDiscussions((DataRowView)e.Item.DataItem);  break;
          case "Ratings":
            ShowRatings((DataRowView)e.Item.DataItem);  break;
        }
    }

&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" OnItemCommand="MyDataList_ItemCommand" runat="server"&gt;

    &lt;ItemTemplate&gt;

        &lt;asp:linkbutton CommandName="Ratings" runat="server"&gt;
            View Ratings
        &lt;/asp:linkbutton&gt;
        |
        &lt;asp:linkbutton CommandName="Discuss" runat="server"&gt;
            View Discussions
        &lt;/asp:linkbutton&gt;

    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

<Tab Name="VB">
&lt;script runat="server"&gt;

    Protected Sub MyDataList_ItemCommand(Sender As Object, E As DataListCommandEventArgs)
        Dim Command As String = E.CommandName

        Select Case Command
            Case "Discuss"
                ShowDiscussions(E.Item.DataItem)
            Case "Ratings"
                ShowRatings(E.Item.DataItem)
        End Select
    End Sub

&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" OnItemCommand="MyDataList_ItemCommand" runat="server"&gt;

    &lt;ItemTemplate&gt;

        &lt;asp:linkbutton CommandName="Ratings" runat="server"&gt;
            View Ratings
        &lt;/asp:linkbutton&gt;
        |
        &lt;asp:linkbutton CommandName="Discuss" runat="server"&gt;
            View Discussions
        &lt;/asp:linkbutton&gt;

    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

<Tab Name="JScript">
&lt;script runat="server"&gt;

    protected function MyDataList_ItemCommand(sender:Object, e:DataListCommandEventArgs ) : void {
        var command:String = e.CommandName;

        switch(command) {
          case "Discuss":
            ShowDiscussions(DataRowView(e.Item.DataItem));  break;
          case "Ratings":
            ShowRatings(DataRowView(e.Item.DataItem));  break;
        }
    }

&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" OnItemCommand="MyDataList_ItemCommand" runat="server"&gt;

    &lt;ItemTemplate&gt;

        &lt;asp:linkbutton CommandName="Ratings" runat="server"&gt;
            View Ratings
        &lt;/asp:linkbutton&gt;
        |
        &lt;asp:linkbutton CommandName="Discuss" runat="server"&gt;
            View Discussions
        &lt;/asp:linkbutton&gt;

    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

</Acme:TabControl><p>

<p>
Note that because more than one command can fire this event handler, you must employ a switch statement to determine the
particular command that was fired.  The following sample demonstrates this code in action.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist5.src"
  Icon="/quickstart/aspplus/images/datalist5.gif"
  Caption="C# Datalist5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist5.src"
  Icon="/quickstart/aspplus/images/datalist5.gif"
  Caption="VB Datalist5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist5.src"
  Icon="/quickstart/aspplus/images/datalist5.gif"
  Caption="JScript Datalist5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="selectandedit">
<br>
<span class="subhead">Using Select and Edit Templates</span>
<p>

In addition to handling the <b>Select</b> command using a page-level event handler, the <b>DataList</b> can respond to this event internally.  If a
<b>SelectedItemTemplate</b> is defined for the <b>DataList</b>, the <b>DataList</b> renders this template for the item that fired the <b>Select</b>
command.  The following example uses the <b>SelectedItemTemplate</b> to make the title of the selected book bold.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist6.src"
  Icon="/quickstart/aspplus/images/datalist6.gif"
  Caption="C# Datalist6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist6.src"
  Icon="/quickstart/aspplus/images/datalist6.gif"
  Caption="VB Datalist6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist6.src"
  Icon="/quickstart/aspplus/images/datalist6.gif"
  Caption="JScript Datalist6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>DataList</b> also supports an <b>EditItemTemplate</b> for rendering an item whose index is equal to the <b>DataList</b>'s <b>EditItemIndex</b>
property.  For details about how editing and updating works, refer to the <a href="webdataaccess.aspx#update">Updating Data</a>
topic of the <a href="webdataaccess.aspx">Data Access</a> section of this tutorial.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist7.src"
  Icon="/quickstart/aspplus/images/datalist7.gif"
  Caption="C# Datalist7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist7.src"
  Icon="/quickstart/aspplus/images/datalist7.gif"
  Caption="VB Datalist7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist7.src"
  Icon="/quickstart/aspplus/images/datalist7.gif"
  Caption="JScript Datalist7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="finding">
<br>
<span class="subhead">Finding a Control Inside a Template</span>
<p>

Sometimes it is necessary to locate a control contained inside a template.  If a control is given an ID in a template, that control can be
retrieved from its container (the first control in the parent hierarchy that supports <b>INamingContainer</b>).  In this case, the
container is the <b>DataListItem</b> control.  Note that even though there are several controls with the same ID (by virtue of the <b>DataList</b>'s
repetition), each is contained logically in the namespace of the <b>DataListItem</b> container control.

<p>
You can go through the <b>DataList</b>'s <b>Items</b> collection to retrieve the <b>DataListItem</b> for a given index, and then call
the <b>DataListItem</b>'s <b>FindControl</b> method (inherited from the base <b>Control</b> class) to retrieve a control with a particular ID.
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script runat="server"&gt;

    public void Page_Load(Object sender, EventArgs E)) {
        // set datasource and call databind here

        for (int i=0; i&lt;MyDataList.Items.Count; i++) {
           String isChecked = ((CheckBox) MyDataList.Items[i].FindControl("Save")).Checked.ToString();
           If (isChecked == "True") {
             ...
           }
        }
    }
&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" runat="server"&gt;

    &lt;ItemTemplate&gt;
         &lt;asp:CheckBox id="Save" runat="server"/&gt; &lt;b&gt;Save to Favorites&lt;/b&gt;
    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

<Tab Name="VB">
&lt;script runat="server"&gt;

    Public Sub Page_Load(sender As Object, E As EventArgs))
        ' set datasource and call databind here

        For I=0 To MyDataList.Items.Count-1
           Dim IsChecked As String =  MyDataList.Items(i).FindControl("Save").Checked.ToString()
           If IsChecked = "True" Then
             ...
           End If
        Next
    End Sub
&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" runat="server"&gt;

    &lt;ItemTemplate&gt;
         &lt;asp:CheckBox id="Save" runat="server"/&gt; &lt;b&gt;Save to Favorites&lt;/b&gt;
    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

<Tab Name="JScript">
&lt;script runat="server"&gt;

    public function Page_Load(sender:Object, E:EventArgs)) : void {
        // set datasource and call databind here

        for (var i:int=0; i&lt;MyDataList.Items.Count; i++) {
           var isChecked:String = (CheckBox(MyDataList.Items[i].FindControl("Save"))).Checked.ToString();
           If (isChecked == "True") {
             ...
           }
        }
    }
&lt;/script&gt;

&lt;ASP:DataList id="MyDataList" runat="server"&gt;

    &lt;ItemTemplate&gt;
         &lt;asp:CheckBox id="Save" runat="server"/&gt; &lt;b&gt;Save to Favorites&lt;/b&gt;
    &lt;/ItemTemplate&gt;

&lt;/ASP:DataList&gt;
</Tab>

</Acme:TabControl><p>

<p>
The following sample demonstrates this code in action.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/datalist8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist8.src"
  Icon="/quickstart/aspplus/images/datalist8.gif"
  Caption="C# Datalist8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/datalist8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist8.src"
  Icon="/quickstart/aspplus/images/datalist8.gif"
  Caption="VB Datalist8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/datalist8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/datalist8.src"
  Icon="/quickstart/aspplus/images/datalist8.gif"
  Caption="JScript Datalist8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>The <b>DataList</b> and <b>Repeater</b> controls provide developers fine-tuned control over the rendering of data-bound lists.
<li>Rendering of bound data is controlled using a template, such as the <b>HeaderTemplate</b>, <b>FooterTemplate</b>, or <b>ItemTemplate</b>.
<li>The <b>Repeater</b> control is a general-purpose iterator, and does not insert anything in its rendering that is not contained in a template.
<li>The <b>DataList</b> control offers more control over the layout and style of items, and outputs its own rendering code for formatting.
<li>The <b>DataList</b> supports the <b>Select</b>, <b>Edit/Update/Cancel</b>, and <b>Item</b> <b>Command</b> events, which can be handled at the page level by
wiring event handlers to the <b>DataList</b>'s <b>Command</b> events.
<li><b>DataList</b> supports a <b>SelectedItemTemplate</b> and <b>EditItemTemplate</b> for control over the rendering of a selected or editable item.
<li>Controls can be programmatically retrieved from a template using the <b>Control.FindControl</b> method.  This should be called on
a <b>DataListItem</b> retrieved from the <b>DataList</b>'s Items collection.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->