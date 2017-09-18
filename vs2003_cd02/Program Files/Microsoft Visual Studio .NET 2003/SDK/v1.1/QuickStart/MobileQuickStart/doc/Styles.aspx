<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Styles and Style Sheets</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Styles">Applying Style Properties</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#BuiltIn">Built-in Styles</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#StyleSheets">Using a Style Sheet</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ExtStyleSheets">External Style Sheets</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="Styles"></a>
<span class="subhead">Applying Style Properties</span><br>

<p>

To support richer rendering, mobile Web Forms controls expose a set of style properties. 
Style properties allow you to control visual aspects such as text font or colors.
Any style property is advisory, and is honored only on target devices that support it.

<p>

The style properties available are limited compared to the cascading style sheets (CSS)
standard, which is HTML specific. However, the style properties observe similar rules of cascading and inheritance.

<p>

The following sample is an updated version of a sample shown in an earlier section, with 
new style properties defined for mobile controls. The results are clearest on richer devices,
such as HTML browsers.

<p>

<Acme:SourceRef runat="server" Path="Styles/Styles" />

<p>

<a name="BuiltIn"></a>
<span class="subhead">Built-in Styles</span><br>

<p>

ASP.NET Mobile Web Forms pages support a set of built-in styles. You can make a mobile control
refer to a built-in style by setting its <b>StyleReference</b> property to the name of the style.
By referring to a built-in style, you can get a reasonable rendering for the control on any device.
The following built-in styles are currently supported, and apply primarily to the <b>Label</b> control.

<p>
<div class="indent">
<table class="table2" width="400" cellpadding="3">
    <tr>
    <th>Style</th>
    <th>Description</th>
    </tr>
    <tr>
    <td><b>Title</b></td>
    <td>The control is rendered as a title, with emphasis.</td>
    </tr>
    <tr>
    <td><b>Error</b></td>
    <td>The control is rendered as an error message.</td>
    </tr>
    <tr>
    <td><b>Subcommand</b></td>
    <td>The control is rendered as a subcommand, with a smaller font.</td>
    </tr>
</table> 
</div>

<p>

The following sample shows how you can use these styles.

<p>

<Acme:SourceRef runat="server" Path="Styles/BuiltIn" />

<p>

<a name="StyleSheets"></a>
<span class="subhead">Using a Style Sheet</span><br>

<p>

If you are using a number of common style properties for your controls, you can group them
together into styles. To do this, you place a mobile control called a <b>StyleSheet</b> control on your page, and
add <b>&lt;Style&gt;</b> elements that define the common styles. 
    
<p>
    
Each style in a <b>StyleSheet</b> object is identified by a unique <b>name</b>.
By setting the <b>StyleReference</b> property of a control to the name of a style in a style sheet, 
you can make it refer to the style properties defined in the control. 
    
<p>
    
Style sheets also allow you to:

<ul>
<li>Build styles to inherit from other styles, by setting the <b>StyleReference</b> property of the
child style.
<li>Override built-in styles by defining a style with the same name.
</ul>

<p>

The following sample demonstrates all these concepts. It is identical to the Applying Style Properties
sample shown previously, but it uses style sheets instead of individual style properties.

<p>

<Acme:SourceRef runat="server" Path="Styles/StyleSheet" />

<p>

<a name="ExtStyleSheets"></a>
<span class="subhead">External Style Sheets</span><br>

<p>

With style sheets, you can consolidate common
style definitions in a single place and use them across multiple
controls. However, these style definitions span only a single mobile
page.

<p>

External style sheets allow you to define a <b>StyleSheet</b> control in a separate
file as a <a href="WritingControls.aspx#User">user control</a>, and reference that
file from multiple mobile pages on a site or a project. This allows site-wide consolidation
of styles into a single definition.

<p>

The following sample demonstrates the use of an external
style sheet. It is identical to the Style Sheet sample shown previously, but it
uses an external style sheet rather than one contained directly in the page.
The code defines a <b>StyleSheet</b> object with a <b>ReferencePath</b> attribute that points to the file containing the external style sheet.

<p>

<Acme:SourceRef runat="server" Path="Styles/ExternalStyleSheet" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
