<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>List Controls</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Simple">A List Control</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ListStyles">List Styles</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#SelectionList">Selection Lists</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#SelectionListStyles">SelectionList Styles</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Databinding">Data Binding a List</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Paginating">Paginating a List</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ObjectList">Object Lists</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ContextMenu">Object List Context Menus</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="Simple"></a>
<span class="subhead">A List Control</span><br>

<p>

The <b>List</b> mobile control is a versatile control that supports 
several modes of input and display. It also supports list items that are added 
declaratively as <b>&lt;Item&gt;</b> elements, programmatically by calling the
<b>Items.Add</b> method, or through data binding to a collection.

<p>

The following sample demonstrates how to render
a small static list using a <b>List</b> mobile control.

<p>

<Acme:SourceRef runat="server" Path="ListControls/Simple" />

<p>

<a name="ListStyles"></a>
<span class="subhead">List Styles</span><br>

<p>

The <b>List</b> mobile control offers several rendering styles for target devices 
that support richer environments. The rendering style is set by using the <b>Decoration</b> property.
Valid settings for this property come from the <b>ListDecoration</b> enumeration,
and include the following.

<p>
<div class="indent">
<table class="table2" width="400" cellpadding="3">
    <tr>
    <th>Decoration<br>(ListDecoration enumeration)</th>
    <th>Description</th>
    </tr>
    <tr>
    <td><b>None</b></td>
    <td>Each list item is shown as is.</td>
    </tr>
    <tr>
    <td><b>Bulleted</b></td>
    <td>Each list item is bulleted.</td>
    </tr>
    <tr>
    <td><b>Numbered</b></td>
    <td>Each list item is numbered.</td>
    </tr>
</table> 
</div>

<p>

The following sample allows you to see all the supported rendering styles interactively.
This sample works only on HTML browsers. (Other browsers do not currently support these styles.)

<p>

<Acme:SourceRef runat="server" Path="ListControls/ListStyles" />

<p>

<a name="SelectionList"></a>
<span class="subhead">Selection Lists</span><br>

<p>

The data features of the <b>SelectionList</b> control are very similar to the <b>List</b> control.
However, the <b>SelectionList</b> control differs in that it is used exclusively to represent
selection in a form, and requires another control, such as a <b>Command</b> control, to submit the
selection.
In addition to single selection, the <b>SelectionList</b> control supports multiple selection,
rendering a UI appropriate for the device.

<p>

The following sample demonstrates using a <b>SelectionList</b> control in multiselect mode,
and shows how to use the selection information.

<p>

<Acme:SourceRef runat="server" Path="ListControls/SelectionList" />

<p>

<a name="SelectionListStyles"></a>
<span class="subhead">SelectionList Styles</span><br>

<p>

Similar to a <b>List</b> control, the <b>SelectionList</b> control offers several rendering styles for devices 
that support these rendering styles. The rendering style, found through the <b>SelectType</b> property,
also affects whether or not the control uses single or multiple selection.
Valid settings for this property come from the <b>ListSelectType</b> enumeration,
and include the following.

<p>
<div class="indent">
<table class="table2" width="400" cellpadding="3">
    <tr>
    <th>Type<br>(ListSelectType enumeration)</th>
    <th>Selection type</th>
    <th>Description</th>
    </tr>
    <tr>
    <td><b>DropDown</b></td>
    <td>Single</td>
    <td>The list is shown as a drop-down list box.</td>
    </tr>
    <tr>
    <td><b>ListBox</b></td>
    <td>Single</td>
    <td>The list is shown as a list box.</td>
    </tr>
    <tr>
    <td><b>Radio</b></td>
    <td>Single</td>
    <td>The list is shown as a set of option buttons.</td>
    </tr>
    <tr>
    <td><b>MultiSelectListBox</b></td>
    <td>Multiple</td>
    <td>The list is shown as a list box.</td>
    </tr>
    <tr>
    <td><b>CheckBox</b></td>
    <td>Multiple</td>
    <td>The list is shown as a set of check boxes.</td>
    </tr>
</table> 
</div>

<p>

The following sample allows you to see all of these supported rendering styles interactively.

<p>

<Acme:SourceRef runat="server" Path="ListControls/SelectionListStyles" />

<p>

<a name="Databinding"></a>
<span class="subhead">Data Binding a List</span><br>

<p>

A <b>List</b> or <b>SelectionList</b> control can be data-bound to a collection of objects. 
Data binding a list to a collection, requires you to set the <b>DataSource</b>
property of the control and call the <b>DataBind</b> method. By
setting the <b>DataTextField</b> or <b>DataValueField</b> properties of
the list, you can control how the list binds each item to the
properties of the corresponding source object.

<p>

The following sample demonstrates a data-bound list. The <b>DataTextField</b>
and <b>DataValueField</b> properties are set to bind the text and value of
each item to the <b>CityName</b> and <b>Report</b> properties of the data object, respectively.

<p>

<Acme:SourceRef runat="server" Path="ListControls/DataBinding" />

<p>

<a name="Paginating"></a>
<span class="subhead">Paginating a List</span><br>

<p>

When displaying a large number of list items on a mobile device, it is recommended that you paginate the list into small pages.
By setting the <b>Paginate</b> property of the form,
you can let the form automatically paginate its contents according to the target
device, and provide UI for the user to browse between pages.
Pagination is typically used only for forms that contain a <b>List</b> control; if you paginate
a form by using the <b>SelectionList</b> control, you may get unexpected results, because the control
may be split up across two pages.

<p>

The following sample shows a paginated list. This feature, called
<i>Automatic Pagination</i>, is covered in more detail in a later section.

<p>

<Acme:SourceRef runat="server" Path="ListControls/Pagination" />

<p>

<a name="ObjectList"></a>
<span class="subhead">Object Lists</span><br>

<p>

If you want to display a list of objects and their properties, and you want 
to allow the user to perform commands on those objects, you can use the 
<b>ObjectList</b> mobile control. Similar to the <b>List</b> control, the <b>ObjectList</b> 
control supports data binding to collections. However, the <b>ObjectList</b> control allows you to define the individual fields that you want to render for each 
object, and it also allows you to define the commands that you want to provide to the user for each object.
The <b>ObjectList</b> control provides rendering for
browsing the list, viewing item fields, and triggering commands.

<p>

The following sample shows a fairly complex object list. The object list has
several item fields declared through the <b>&lt;Field&gt;</b> element, and
a command declared through the <b>&lt;Command&gt;</b> element. The sample
also shows how you can handle item commands triggered by the user.

<p>

<Acme:SourceRef runat="server" Path="ListControls/ObjectList" />

<p>

<a name="ContextMenu"></a>
<span class="subhead">Object List Context Menus</span><br>

<p>

You can use the <b>ObjectList</b> mobile control to modify the set of commands before
they are displayed for a single item. By using the <b>OnShowItemCommands</b>
event, you can alter the set of commands to provide an item-specific 
context menu. The following sample demonstrates this concept.

<p>

<Acme:SourceRef runat="server" Path="ListControls/ContextMenu" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
