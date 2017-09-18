<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Localizing ASP.NET Applications</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#copy">Copy and Translate</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#embed">Localization and Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>


<!--BEGIN SECTION-->
<a name="copy">
<span class="subhead">Copy and Translate</span>
<p>

The easiest way to localize a Web page is usually
to create a copy and translate it to the target language.
This works well for static content that does not require
a lot of maintenance. To support this model for ASP.NET pages, you can set
the <b>Culture</b> attribute using the
<b>Page</b> directive. All locale-dependent methods pick
up the value of the <b>Culture</b> attribute.
<p>
The following sample shows how to do this for three independent,
localized versions of a page.
The <b>Culture</b> property is set on each page to determine
the format of the date:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@Page Culture="de-DE" Language="C#" %&gt;
...
&lt;%=DateTime.Now.ToString("f", null)%&gt;
</Tab>

<Tab Name="VB">
&lt;%@Page Culture="de-DE" Language="VB" %&gt;
...
&lt;%=DateTime.Now.ToString("f", Nothing)%&gt;
</Tab>

<Tab Name="JScript">
&lt;%@Page Culture="de-DE" Language="JScript" %&gt;
...
&lt;%=DateTime.Now.ToString("f", null)%&gt;
</Tab>

</Acme:TabControl><p>

<p>

<table>
<tr>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/CS/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="C# news-en-us.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/VB/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="VB news-en-us.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/JS/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="JScript news-en-us.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/CS/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="C# news-de.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/VB/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="VB news-de.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/JS/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="JScript news-de.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/CS/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="C# news-ja.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/VB/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="VB news-ja.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize1/JS/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize1/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="JScript news-ja.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr>
</table>




<!--BEGIN SECTION-->
<br>
<a name="embed">
<br>
<span class="subhead">Localization and Controls</span>
<p>

An improvement over the simple copy-and-translate approach is to
use controls to pick up the culture of the main page. In the following sample,
the image of the flag and the search bar are controls. Depending
on the culture of the hosting page, they render different content.
To support this, the <b>UICulture</b> attribute is also added to each page:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@Page Culture="de-DE" UICulture="de-DE" Language="C#" %&gt;
</Tab>

<Tab Name="VB">
&lt;%@Page Culture="de-DE" UICulture="de-DE" Language="VB" %&gt;
</Tab>

<Tab Name="JScript">
&lt;%@Page Culture="de-DE" UICulture="de-DE" Language="JScript" %&gt;
</Tab>

</Acme:TabControl><p>

<p>
The flag control (Flag.ascx), for example, just uses the culture name to build the
<b>Src</b> attribute of an <b>&lt;img&gt;</b> tag:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@Import Namespace="System.Globalization"%&gt;

&lt;script runat="Server" Language="C#"&gt;
override protected void Render(HtmlTextWriter writer) {
    FlagImage.Src = "../../flags/" + CultureInfo.CurrentCulture + ".jpg";
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName;
    base.Render(writer);
}
&lt;/script&gt;

&lt;img runat="server" id="FlagImage" /&gt;
</Tab>

<Tab Name="VB">
&lt;%@Import Namespace="System.Globalization"%&gt;

&lt;script runat="Server" Language="VB"&gt;
Overrides Protected Sub Render(writer As HtmlTextWriter)
    FlagImage.Src = "../../flags/" & CultureInfo.CurrentCulture.Name & ".jpg"
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName
    MyBase.Render(writer)
End Sub
&lt;/script&gt;

&lt;img runat="server" id="FlagImage" /&gt;
</Tab>

<Tab Name="JScript">
&lt;%@Import Namespace="System.Globalization"%&gt;

&lt;script runat="Server" Language="JScript"&gt;
override protected function Render(writer:HtmlTextWriter) : void {
    FlagImage.Src = "../../flags/" + CultureInfo.CurrentCulture + ".jpg";
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName;
    base.Render(writer);
}
&lt;/script&gt;

&lt;img runat="server" id="FlagImage" /&gt;
</Tab>

</Acme:TabControl><p>

<p>

The search control (Search.ascx) uses a switch statement to initialize the
values of a label and a text box, but the culture name could also be the
parameter for a database query:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
void LocalizeSearchText() {
  switch(String.Intern(CultureInfo.CurrentUICulture.Name)) {
    case "en-US":
      SearchText.Text = "Clinton";
      SearchButton.Text = "Search";
      break;
    case "de-DE":
      ...
    case "ja-JP":
      ...
    default:
      SearchButton.Text = "Search";
  }
}
</Tab>

<Tab Name="VB">
Sub LocalizeSearchText()
  Select Case String.Intern(CultureInfo.CurrentUICulture.Name))
    Case "en-US"
      SearchText.Text = "Clinton"
      SearchButton.Text = "Search"

    Case "de-DE"
      ...
    Case "ja-JP"
      ...
    Case Else
      SearchButton.Text = "Search"
  End Select
End Sub
</Tab>

<Tab Name="JScript">
public function LocalizeSearchText() : void {
  switch(String.Intern(CultureInfo.CurrentUICulture.Name)) {
    case "en-US":
      SearchText.Text = "Clinton";
      SearchButton.Text = "Search";
      break;
    case "de-DE":
      ...
    case "ja-JP":
      ...
    default:
      SearchButton.Text = "Search";
  }
}
</Tab>

</Acme:TabControl><p>

<table>
<tr>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/CS/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="C# news-en-us.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/VB/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="VB news-en-us.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/JS/news-en-us.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-en-us.src"
  Icon="/quickstart/aspplus/samples/localize/flags/en-US.jpg"
  Caption="JScript news-en-us.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/CS/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="C# news-de.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/VB/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="VB news-de.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/JS/news-de.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-de.src"
  Icon="/quickstart/aspplus/samples/localize/flags/de-DE.jpg"
  Caption="JScript news-de.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/CS/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="C# news-ja.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/VB/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="VB news-ja.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/localize/localize2/JS/news-ja.aspx"
  ViewSource="/quickstart/aspplus/samples/localize/localize2/news-ja.src"
  Icon="/quickstart/aspplus/samples/localize/flags/ja-JP.jpg"
  Caption="JScript news-ja.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr>
</table>


<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET pages support <b>Culture</b> and <b>UICulture</b> attributes to support independent localized pages.
<li>Controls on pages can pick the culture of the page and can render culture-dependent content.
</ol>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->





