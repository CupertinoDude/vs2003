<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Automatic Pagination</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#WhatIs">What Is Automatic Pagination?</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#HdrFtr">Using Headers and Footers</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#PaginationUI">Customizing Pagination UI</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Custom">Custom Pagination and Chunking</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="WhatIs"></a>
<span class="subhead">What Is Automatic Pagination?</span><br>

<p>

One of the key features of ASP.NET mobile Web Forms is the ability to paginate content
according to the screen size of the target device. 
Pagination of forms is handled through a combination of server-side pagination
and automatic pagination performed on the client.

<p>

Not all forms are good candidates for automatic pagination. In general, forms that
display a large amount of text, or a number of list items, benefit from pagination.
Previous sections contained examples of such forms with pagination enabled.

<p>

To enable pagination for a form, you must set the <b>Paginate</b> property
of the form to <b>true</b>.
The form then automatically paginates its contents and inserts UI elements
that allow the user to browse between pages.
Typically, the form inserts page breaks between controls as required.
However, controls that show a lot of data, such as the <b>List</b> control, allow the 
parent form to insert breaks between individual items. 

<p>

You can control the page breaking rules by using a <b>Panel</b> control. If you place a
panel in a form and add controls to the panel, the <b>Form</b> control will group panel
contents together, if possible.


<p>

<a name="HdrFtr"></a>
<span class="subhead">Using Headers and Footers</span><br>

<p>

When you create a paginated form, you can specify content, such as a title or a page number,
to display at the top or bottom of every form. 
To do this, you can insert the content in a header or footer template. 
Templates are covered in more detail in a later section. Although templates are typically
used for device-specific content, you can also use a template for a device-independent
header or footer, and place mobile Web Forms controls in it.

<p>

The following sample uses a header template to show a title on every form. The 
template is placed inside <b>DeviceSpecific</b> and <b>Choice</b> tags like all other device templates,
but the <b>Choice</b> tag has no attributes, indicating that it is device independent.

<p>

<Acme:SourceRef runat="server" Path="Pagination/Header" />

<p>

<a name="PaginationUI"></a>
<span class="subhead">Customizing Pagination UI</span><br>

<p>

When a form is paginated, it automatically inserts the UI necessary for the user to browse
between pages. By default, this UI consists of links labeled <b>Next</b> and <b>Previous</b>,
which are rendered as appropriate.

<p>

The <b>Form</b> control has a property called <b>PagerStyle</b>, which provides access to the
style object that is used for rendering the pagination UI. By setting properties of a
<b>PagerStyle</b> object, you can control
the text that is rendered and the style properties that are used.

<p>

The following sample shows a paginated form with a custom pagination UI.

<p>

<Acme:SourceRef runat="server" Path="Pagination/PagerStyle" />

<p>

<a name="Custom"></a>
<span class="subhead">Custom Pagination and Chunking</span><br>

<p>

Mobile controls that inherit from the <b>PagedControl</b> base class have additional 
support for pagination. Examples of these controls include the <b>List</b> and <b>ObjectList</b> controls.

<p>

In addition to allowing a form to insert page breaks between items,
a paged control supports a feature called <i>custom pagination</i>,
which allows you to avoid having to provide the control with all the data
at once. Instead, you can access the data in smaller sets.

<p>

To use custom pagination, set the total amount of data available through 
the <b>ItemCount</b> property of the control, but do not add any items to the
control.
Even though the control contains only one page of data at a time, for pagination
purposes, it acts as if it has the total number of items specified.
Whenever the control is ready to access additional items for display, the control calls the 
<b>LoadItems</b> event. 
In response to this event, the control receives the next page of data.

<p>

The following sample demonstrates a <b>List</b> mobile control with custom pagination.
The sample tests all the numbers up to 20,000 for a prime number. However, the control 
calculates only on demand. You can also add code that caches
the pages previously generated for reverse browsing of the list.

<p>

<Acme:SourceRef runat="server" Path="Pagination/Custom" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
