
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Server Control Form Validation</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#intro">Introduction to Validation</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#types">Types of Validation Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#client">Client-Side Validation</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#errors">Displaying Validation Errors</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#compare">Working with CompareValidator</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#range">Working with RangeValidator</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#regex">Working with Regular Expressions</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#custom">Performing Custom Validation</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#together">Bringing It All Together</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#endofsection">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="intro">
<span class="subhead">Introduction to Validation</span>
<p>
The Web Forms framework includes a set of validation server controls that provide an easy-to-use but powerful way
to check input forms for errors and, if necessary, display messages to the user.

<p>
Validation controls are added to a Web Forms page like other server controls.  There are controls for specific types of
validation, such as range checking or pattern matching, plus a <b>RequiredFieldValidator</b> that ensures that a user does
not skip an entry field.  You can attach more than one validation control to an input control. For example, you
might specify both that an entry is required and that it must contain a specific range of values.

<p>
Validation controls work with a limited subset of HTML and Web server controls.  For each control, a specific
property contains the value to be validated.  The following table lists the input controls that may be validated.

<p>
<div class="indent">
<table class="table2" width="400" cellpadding="3">
    <tr>
    <th>Control</th>
    <th>Validation Property</th>
    </tr>
    <tr>
    <td><b>HtmlInputText</b></td>
    <td>Value</td>
    </tr>
    <tr>
    <td><b>HtmlTextArea</b></td>
    <td>Value</td>
    </tr>
    <tr>
    <td><b>HtmlSelect</b></td>
    <td>Value</td>
    </tr>
    <tr>
    <td><b>HtmlInputFile</b></td>
    <td>Value</td>
    </tr>
    <tr>
    <td><b>TextBox</b></td>
    <td>Text</td>
    </tr>
    <tr>
    <td><b>ListBox</b></td>
    <td>SelectedItem.Value</td>
    </tr>
    <tr>
    <td><b>DropDownList</b></td>
    <td>SelectedItem.Value</td>
    </tr>
    <tr>
    <td><b>RadioButtonList</b></td>
    <td>SelectedItem.Value</td>
    </tr>
</table>
</div>

<!--BEGIN SECTION-->
<br>
<a name="types">
<br>
<span class="subhead">Types of Validation Controls</span>
<p>
The simplest form of validation is a required field. If the user enters any value in a field, it is valid.
If all of the fields in the page are valid, the page is valid.  The following example illustrates this using the <b>RequiredFieldValidator</b>.

<p>
<!-- server-side required field -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator1.src"
  Icon="/quickstart/aspplus/images/validator1.gif"
  Caption="C# Validator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator1.src"
  Icon="/quickstart/aspplus/images/validator1.gif"
  Caption="VB Validator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator1.src"
  Icon="/quickstart/aspplus/images/validator1.gif"
  Caption="JScript Validator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<p>
There are also validation controls for specific types of validation, such as range checking or pattern matching. The following table lists the validation controls.

<p>
<div class="indent">
<table class="table2" width="80%" cellpadding=3>
    <tr>
    <th>Control Name</th>
    <th>Description</th>
    </tr>
    <tr>
    <td style="width:25%"><b>RequiredFieldValidator</b></td>
    <td>Ensures that the user does not skip an entry.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>CompareValidator</b></td>
    <td>Compares a user's entry with a constant value or a property value of another control using a comparison operator (less than, equal to, greater than, and so on).</td>
    </tr>
    <tr>
    <td style="width:25%"><b>RangeValidator</b></td>
    <td>Checks that a user's entry is between specified lower and upper boundaries. You can check ranges within pairs of numbers, alphabetic characters, or dates. Boundaries can be expressed as constants.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>RegularExpressionValidator</b></td>
    <td>Checks that the entry matches a pattern defined by a regular expression. This type of validation allows you to check for predictable sequences of characters, such as those in social security numbers, e-mail addresses, telephone numbers, postal codes, and so on.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>CustomValidator</b></td>
    <td>Checks the user's entry using validation logic that you code yourself. This type of validation allows you to check for values derived at run time.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>ValidationSummary</b></td>
    <td>Displays the validation errors in summary form for all of the validators on a page.</td>
    </tr>
</table>
</div>


<!--BEGIN SECTION-->
<br>
<a name="client">
<br>
<span class="subhead">Client-Side Validation</span>
<p>
The validation controls always perform validation checking in server code. However, if the user is working
with a browser that supports DHTML, the validation controls can also perform validation using client script.
With client-side validation, any errors are detected on the client when the form is submitted to the server.
If any of the validators are found to be in error, the submission of the form to the server is cancelled and
the validator's <b>Text</b> property is displayed.  This permits the user to correct the input before
submitting the form to the server.  Field values are revalidated as soon as the field containing the error
loses focus, thus providing the user with a rich, interactive validation experience.

<p>
Note that the Web Forms page framework always performs validation on the server, even if the validation has
already been performed on the client.  This helps prevent users from being able to bypass validation by
impersonating another user or a preapproved transaction.

<p>
Client-side validation is enabled by default.  If the client is capable, uplevel validation will be performed automatically.
To disable client-side validation, set the page's <b>ClientTarget</b> property to "Downlevel" ("Uplevel" forces client-side validation).

<p>
<!-- client-side required field -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator2.src"
  Icon="/quickstart/aspplus/images/validator2.gif"
  Caption="C# Validator2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator2.src"
  Icon="/quickstart/aspplus/images/validator2.gif"
  Caption="VB Validator2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator2.src"
  Icon="/quickstart/aspplus/images/validator2.gif"
  Caption="JScript Validator2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="errors">
<br>
<span class="subhead">Displaying Validation Errors</span>
<p>
When the user's input is processed (for example, when the form is submitted), the Web Forms page framework passes
the user's entry to the associated validation control or controls. The validation controls test the user's input
and set a property to indicate whether the entry passed the validation test. After all validation controls have
been processed, the <b>IsValid</b> property on the page is set; if any of the controls shows
that a validation check failed, the entire page is set to invalid.
<p>

<p>
If a validation control is in error, an error message may be displayed in the page by that validation control or
in a <b>ValidationSummary</b> control elsewhere on the page.  The <b>ValidationSummary</b> control is displayed
when the <b>IsValid</b> property of the page is false.  It polls each of the validation controls on the page and
aggregates the text messages exposed by each.  The following example illustrates displaying errors with
a <b>ValidationSummary</b> control.

<p>
<!--ValidationSummary-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator3.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="C# Validator3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator3.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="VB Validator3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator3.src"
  Icon="/quickstart/aspplus/images/validator3.gif"
  Caption="JScript Validator3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="compare">
<br>
<span class="subhead">Working with <b>CompareValidator</b></span>
<p>
The <b>CompareValidator</b> server control compares the values of two controls.  <b>CompareValidator</b> uses three key properties to perform its validation.  <b>ControlToValidate</b> and <b>ControlToCompare</b>
contain the values to compare.  <b>Operator</b> defines the type of comparison to perform--for example, Equal or Not
Equal.  <b>CompareValidator</b> performs the validation by evaluating these properties as an expression, as follows:
<xmp>   ( ControlToValidate <Operator> ControlToCompare ) </xmp>

If the expression evaluates true, the validation result is valid.

<p>
The <b>CompareValidator</b> server control could also be used to do Datatype validation.For example, if birth date 
information has to be collected from a user registration page, <b>CompareValidator</b> control could be used to make 
sure that the date is in a recognized format before it is submitted to the database.

<p>
The following sample shows how to use the <b>CompareValidator</b> control.

<p>
<!--CompareVal-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator4.src"
  Icon="/quickstart/aspplus/images/validator4.gif"
  Caption="C# Validator4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator4.src"
  Icon="/quickstart/aspplus/images/validator4.gif"
  Caption="VB Validator4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator4.src"
  Icon="/quickstart/aspplus/images/validator4.gif"
  Caption="JScript Validator4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="range">
<br>
<span class="subhead">Working with <b>RangeValidator</b></span>
<p>
The <b>RangeValidator</b> server control tests whether an input value falls within a given range.
<b>RangeValidator</b> uses three key properties to perform its validation.  <b>ControlToValidate</b> contains the value
to validate.  <b>MinimumValue</b> and <b>MaximumValue</b> define the minimum and maximum values of the valid
range.

<p>
This sample shows how to use the <b>RangeValidator</b> control.

<p>
<!-- RangeVal -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator5.src"
  Icon="/quickstart/aspplus/images/validator5.gif"
  Caption="C# Validator5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator5.src"
  Icon="/quickstart/aspplus/images/validator5.gif"
  Caption="VB Validator5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator5.src"
  Icon="/quickstart/aspplus/images/validator5.gif"
  Caption="JScript Validator5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="regex">
<br>
<span class="subhead">Working with Regular Expressions</span>
<p>
The <b>RegularExpressionValidator</b> server control checks that the entry matches a pattern defined by a
regular expression. This type of validation allows you to check for predictable sequences of characters,
such as those in social security numbers, e-mail addresses, telephone numbers, postal codes, and so on.

<p>
<b>RegularExpressionValidator</b> uses two key properties to perform its validation.  <b>ControlToValidate</b> contains
the value to validate.  <b>ValidationExpression</b> contains the regular expression to match.

<p>
These samples illustrates using the RegularExpressionValidator control.

<p>
<!-- regex -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator6.src"
  Icon="/quickstart/aspplus/images/validator6.gif"
  Caption="C# Validator6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator6.src"
  Icon="/quickstart/aspplus/images/validator6.gif"
  Caption="VB Validator6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator6.src"
  Icon="/quickstart/aspplus/images/validator6.gif"
  Caption="JScript Validator6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<!-- more regex-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator7.src"
  Icon="/quickstart/aspplus/images/validator7.gif"
  Caption="C# Validator7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator7.src"
  Icon="/quickstart/aspplus/images/validator7.gif"
  Caption="VB Validator7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator7.src"
  Icon="/quickstart/aspplus/images/validator7.gif"
  Caption="JScript Validator7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="custom">
<br>
<span class="subhead">Performing Custom Validation</span>
<p>
The <b>CustomValidator</b> server control calls a user-defined function to perform validations that the standard
validators can't handle.  The custom function can execute on the server or in client-side script, such as JScript or VBScript.
For client-side custom validation, the name of the custom function must be identified in the <b>ClientValidationFunction</b>
property.  The custom function must have the form <xmp>   function myvalidator(source, arguments)</xmp>
Note that <b>source</b> is the client-side <b>CustomValidator</b> object, and <b>arguments</b> is an object with two properties,
<b>Value</b> and <b>IsValid</b>.  The <b>Value</b> property is the value to be validated and the <b>IsValid</b> property is a
Boolean used to set the return result of the validation.

<p>

For server-side custom validation, place your custom validation in the validator's <b>OnServerValidate</b>
delegate.

<p>
The following sample shows how to use the <b>CustomValidator</b> control.


<p>
<!-- custom -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator8.src"
  Icon="/quickstart/aspplus/images/validator8.gif"
  Caption="C# Validator8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator8.src"
  Icon="/quickstart/aspplus/images/validator8.gif"
  Caption="VB Validator8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator8.src"
  Icon="/quickstart/aspplus/images/validator8.gif"
  Caption="JScript Validator8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="together">
<br>
<span class="subhead">Bringing It All Together</span>
<p>
This sample shows a typical registration form, using the variations of validation controls discussed in this topic.
<p>
<!-- summary -->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/CS/validator9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator9.src"
  Icon="/quickstart/aspplus/images/validator9.gif"
  Caption="C# Validator9.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/VB/validator9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator9.src"
  Icon="/quickstart/aspplus/images/validator9.gif"
  Caption="VB Validator9.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/validate/JS/validator9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/validate/validator9.src"
  Icon="/quickstart/aspplus/images/validator9.gif"
  Caption="JScript Validator9.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>



<!--BEGIN SECTION-->
<a name="endofsection">

<h4>Section Summary</h4>
<ol>
<li>Validator controls can be used to validate input on any Web Forms page.
<li>More than one control can be used on a given input field.
<li>Client-side validation may be used in addition to server validation to improve form usability.
<li>The <b>ValidationSummary</b> control can be used to provide centralized error feedback by
    querying all validation controls for error messages</li>
<li>Simple validation can be performed using the <b>CompareValidator</b> and <b>RangeValidator</b>
    classes.  These are commonly used on numeric data.</li>
<li>Complex pattern validation can be performed using the <b>RegularExpressionValidator</b>.  Pattern
    validation is useful for strings like names, address, phone numbers, and email addresses.</li>
<li>The <b>CustomValidator</b> control lets the user define custom validation criteria.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->




