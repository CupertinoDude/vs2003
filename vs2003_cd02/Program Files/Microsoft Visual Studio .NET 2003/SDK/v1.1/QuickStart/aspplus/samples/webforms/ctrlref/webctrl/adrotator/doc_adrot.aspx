<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>AdRotator</h4>

<div class="indent" style="font-family:Verdana;">
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<span class="subhead">Working with AdRotator</span>
<p>
The <b>AdRotator</b> control presents ad images that, when clicked, navigate to a new Web location.  Each time the page
is loaded into the browser, an ad is randomly selected from a predefined list.  The following sample illustrates using the
<b>AdRotator</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/CS/AdRotator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/AdRotator1.src"
  Icon="/quickstart/aspplus/images/adrotator1.gif"
  Caption="C# AdRotator1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/VB/AdRotator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/AdRotator1.src"
  Icon="/quickstart/aspplus/images/adrotator1.gif"
  Caption="VB AdRotator1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/JS/AdRotator1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/AdRotator/AdRotator1.src"
  Icon="/quickstart/aspplus/images/adrotator1.gif"
  Caption="JScript AdRotator1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The rotation schedule for ads is defined in an XML file. The following example demonstrates a rotation schedule in the file <code>ads.xml</code>.
<div class="code"><pre>
    &lt;Advertisements&gt;
       &lt;Ad&gt;
          &lt;ImageUrl&gt;/quickstart/aspplus/images/banner1.gif&lt;/ImageUrl&gt;
          &lt;NavigateUrl&gt;http://www.microsoft.com&lt;/NavigateUrl&gt;
          &lt;AlternateText&gt;Microsoft.com&lt;/AlternateText&gt;
          &lt;Keyword&gt;Computers&lt;/Keyword&gt;
          &lt;Impressions&gt;80&lt;/Impressions&gt;
       &lt;/Ad&gt;
    &lt;/Advertisements&gt;
</pre></div>
<p>
The rotation file defines the following attributes of each ad.  Except for <b>ImageUrl</b>, these attributes are optional.
<p>

<div class="indent">
<table class="table2">
    <tr>
    <th style="width:25%"><b>Attribute</b></th>
    <th>Description</th>
    </tr>
    <tr>
    <td style="width:25%"><b>ImageUrl</b></td>
    <td>An absolute or relative URL to the ad image file.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>NavigateUrl</b></td>
    <td>The Web location to navigate to when the image is clicked.  If <b>NavigateUrl</b> is not set, the image is not clickable.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>AlternateText</b></td>
    <td>The text to render as the <b>ALT</b> attribute of the image.  When the page is viewed with Microsoft Internet Explorer, this acts as a ToolTip for the ad.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>Keyword</b></td>
    <td>Specifies a category for the ad that the page can filter on.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>Impressions</b></td>
    <td>A number that indicates the "weight" of the ad in the schedule of rotation relative to the other ads in
    the file.  The larger the number, the more often the ad will be displayed.</td>
    </tr>
</table>
</div>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
