<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>RangeValidator</h4>

<div class="indent" style="width:660">
For a detailed discussion of Web Forms validation, see 
<a href="/quickstart/aspplus/doc/webvalidation.aspx">Server Control Form Validation</a>.
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with RangeValidator</span>
<p>
The <b>RangeValidator</b> control tests whether an input value falls within a given range.
<b>RangeValidator</b> uses three key properties to perform its validation:  <b>ControlToValidate</b> contains the value
to validate,  <b>MinimumValue</b> defines the minimum value of the valid range, and <b>MaximumValue</b> defines the maximum value of the valid
range.  These constants are stored as string values, but are converted to the data type defined by <b>Type</b> when
the comparison is performed.

<p>The following sample illustrates the <b>RangeValidator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/CS/RangeValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/RangeValidator1.src"
  Icon="/quickstart/aspplus/images/rangevalidator1.gif"
  Caption="C# RangeValidator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/VB/RangeValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/RangeValidator1.src"
  Icon="/quickstart/aspplus/images/rangevalidator1.gif"
  Caption="VB RangeValidator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/JS/RangeValidator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/RangeValidator/RangeValidator1.src"
  Icon="/quickstart/aspplus/images/rangevalidator1.gif"
  Caption="JScript RangeValidator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
