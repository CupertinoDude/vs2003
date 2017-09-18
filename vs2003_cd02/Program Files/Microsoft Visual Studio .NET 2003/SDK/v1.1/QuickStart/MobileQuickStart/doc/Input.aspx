<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Handling User Input</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Inputs">User Input on a Mobile Web Form</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Passwords">Passwords and Numeric Input</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Select">Using a SelectionList Control</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Validating">Validating Input</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ValidationSummary">Using a Validation Summary</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="Inputs"></a>
<span class="subhead">User Input on a Mobile Web Form</span><br>

<p>

A number of ASP.NET mobile Web Forms controls support user input, including
the <b>TextBox</b> and <b>List</b> controls.

<p>

When constructing a form that allows user input, you can place one or 
more user input controls, along with other mobile controls such as labels,
on the form. Limit the number of controls that you place on a single form,
because you cannot raise an event for any of the controls until the user
completes the entire form.

<p>

For most user input forms, you also need to provide a way for the
user to submit input back to the server.
You usually do this by placing a 
<b>Command</b> control on the form.
All the samples in this section use a <b>Command</b> control.

<p>

<a name="Passwords"></a>
<span class="subhead">Passwords and Numeric Input</span><br>

<p>

By setting the <b>Password</b> or <b>Numeric</b> property of a <b>TextBox</b> mobile control,
you can alter the behavior of the control. Setting the <b>Password</b> property
renders a text box that hides its input. Setting the <b>Numeric</b> property
of the control renders a text box that restricts its input to numeric characters.
The following sample illustrates the use of these properties.

<p>
<div class="indent">
<b>Important:</b> These properties are only advisory. You will only get
the preferred results on target devices that support these properties.
For example, most HTML
browsers cannot restrict input of a text box to numeric characters. However,
the numeric mode is very useful on many cell phones, because the phones
automatically place the keypad in numeric mode when editing a numeric text box.
</div>                
<p>

<Acme:SourceRef runat="server" Path="UserInput/TextBoxes" />

<p>

<a name="Select"></a>
<span class="subhead">Using a SelectionList Control</span><br>

<p>

In a 
<a href="SimpleForms.aspx#Menus">previous example</a>,
you saw how to use a <b>List</b> mobile control as a menu.
Another mobile control, <b>SelectionList</b>, can also be used as part of
an input form. The <b>SelectionList</b> mobile control differs from the <b>List</b>
mobile control in that it:

<ul>
<li>Requires an additional submission mechanism on the form, such as a <b>Command</b> control, 
to send results back to the server.
<li>Does not generate <b>OnItemCommand</b> events.
<li>Maintains state information about one or more currently selected items.
<li>Provides different renderings by using list boxes, drop-down lists, option buttons, and checklists.
</ul>

<p>

The following sample shows a selection list at work. Because state information is
maintained across forms, the second form on the page is data bound to the current selection of the selection list.

<p>

<Acme:SourceRef runat="server" Path="UserInput/SelectionList" />

<p>

<a name="Validating"></a>
<span class="subhead">Validating Input</span><br>

<p>

Microsoft ASP.NET provides a powerful validation mechanism that you can use to check input forms 
for errors and, if necessary, display messages to the user.
ASP.NET mobile Web Forms provide mobile controls that correspond to each of the validation
controls available in ordinary Web Forms pages. Each mobile control wraps the 
corresponding Web Forms validator and provides an identical object model to its peer.
Thus, if you are familiar with the way validation server controls work in Web Forms, 
you are already familiar with how to work with validation in mobile Web Forms pages.

<p>

Mobile validation controls work with a limited subset of mobile controls. For
each control, a specific property contains the value to be validated. The following table shows
the input controls that can be validated.

<p>
<div class="indent">
<table class="table2" width="400" cellpadding="3">
    <tr>
    <th>Control</th>
    <th>Validation property</th>
    </tr>
    <tr>
    <td><b>TextBox</b></td>
    <td><b>Text</b></td>
    </tr>
    <tr>
    <td><b>SelectionList</b></td>
    <td><b>SelectedIndex</b></td>
    </tr>
</table> 
</div>

<p>

The following sample demonstrates how to use the mobile equivalent of the 
<b>CompareValidator</b> control on your mobile Web Forms page. The sample provides a user with a text box. If you enter a 
number greater than 100, the validator displays an error message.

<p>

<Acme:SourceRef runat="server" Path="UserInput/Validation" />

<p>
Note that for validation to occur on a form, the control that causes the form to be
submitted must have its <b>CausesValidation</b> property set to <b>true</b>. The only current
control that this applies to is the <b>Command</b> control, for which the <b>CausesValidation</b>
property is <b>true</b> by default.
<p>

<a name="ValidationSummary"></a>
<span class="subhead">Using a Validation Summary</span><br>

<p>

Instead of showing each validation error separately, you can use the
<b>ValidationSummary</b> mobile control to display a summary of validation errors.
To use a <b>ValidationSummary</b> mobile control, create a separate form on your
page, place the control on it, and set its <b>FormToValidate</b> property
to the form that you want to validate.
Similar to its Web Forms equivalent, the <b>ValidationSummary</b> mobile control polls
each of the validation controls on the given form and displays a summary of
the results.

<p>

The following sample shows an example of the <b>ValidationSummary</b> mobile control. The text box has
three associated validators, and the <b>ValidationSummary</b> control shows a summary of
validation errors in the input.

<p>

<Acme:SourceRef runat="server" Path="UserInput/ValidationSummary" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
