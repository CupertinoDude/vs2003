<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Repeater</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<br>
<a name="working">
<span class="subhead">Working With Repeater</span>
<p>The <b>Repeater</b> control displays data items in a repeating list.  Similar to
<a href="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/datalist/doc_datalist.aspx">DataList</a>,
the content and layout of list items in <b>Repeater</b> is defined using <b>templates</b>.
At a minimum, every <b>Repeater</b> must define an <b>ItemTemplate</b>; however, the following optional templates may be used to
customize the appearance of the list.<p>

<div class="indent">
<table class="table2" width="90%">
    <tr>
    <th width="200"><b>Template Name</b></th>
    <th><b>Description</b></th>
    </tr>
    <tr>
    <td><b>ItemTemplate</b></td>
    <td>Defines the content and layout of items within the list.  <b>Required</b>.</td>
    </tr>
    <tr>
    <td><b>AlternatingItemTemplate</b></td>
    <td>If defined, the <b>AlternatingItemTemplate</b> determines the content and layout of alternating items.  If not defined, <b>ItemTemplate</b> is used.</td>
    </tr>
    <tr>
    <td><b>SeparatorTemplate</b></td>
    <td>If defined, the <b>SeparatorTemplate</b> is rendered between items (and alternating items).  If not defined, a separator is not rendered.</td>
    </tr>
    <tr>
    <td><b>HeaderTemplate</b></td>
    <td>If defined, the <b>HeaderTemplate</b> determines the content and layout of the list header.  If not defined, header is not rendered.</td>
    </tr>
    <tr>
    <td><b>FooterTemplate</b></td>
    <td>If defined, the <b>FooterTemplate</b> determines the content and layout of the list footer.  If not defined, footer is not rendered.</td>
    </t>
</table>
</div>

<p>Unlike <b>DataList</b>, <b>Repeater</b> has no built-in layout or styles. You must explicitly declare all
HTML layout, formatting, and style tags within the templates of the control.  For example, to create a list within an
HTML table, you might declare the &lt;table&gt; tag in the <b>HeaderTemplate</b>, a table row (&lt;tr&gt; tags, &lt;td&gt; tags,
and data-bound items) in the <b>ItemTemplate</b>, and the &lt;/table&gt; tag in the <b>FooterTemplate</b>.

<p>The following sample illustrates using a simple <b>Repeater</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/CS/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/Repeater1.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Repeater1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/VB/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/Repeater1.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Repeater1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/JS/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Repeater/Repeater1.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="JScript Repeater1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
