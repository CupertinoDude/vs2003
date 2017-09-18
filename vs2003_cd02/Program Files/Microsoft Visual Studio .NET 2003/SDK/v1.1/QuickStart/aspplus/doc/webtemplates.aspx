
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Applying Styles to Controls</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#htmlstyles">Applying Styles to HTMLControls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#webstyles">Applying Styles to Web Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

The Web is a flexible environment for user interfaces, with extreme variations in the look and feel of different Web sites.  The
widespread adoption of cascading style sheets (CSS) is largely responsible for the rich designs encountered on the Web.  All of ASP.NET's HTML server controls and Web server controls
have been designed to provide first-class support for CSS styles. This section discusses how to use 
styles in conjunction with server controls and demonstrates the very fine control over the look and feel of your Web Forms that they provide.

<!--BEGIN SECTION-->
<br>
<a name="htmlstyles">
<br>
<span class="subhead">Applying Styles to HTML Controls</span>
<p>

Standard HTML tags support CSS through a style attribute, which can be set to a semicolon-delimited list of attribute/value pairs.
For more information about the CSS attributes supported by the Internet Explorer browser, see
MSDN Web Workshop's <a target="_blank" href="http://msdn.microsoft.com/workshop/author/css/reference/attributes.asp">CSS Attributes Reference</a> page.
All of the ASP.NET HTML server controls can accept styles in exactly the same manner as standard HTML tags.  The following example
illustrates a number of styles applied to various HTML server controls.  If you view the source code on the page returned to the client, you will see that these styles are passed along to the browser in the control's rendering.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style1.src"
  Icon="/quickstart/aspplus/images/style1.gif"
  Caption="C# Style1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style1.src"
  Icon="/quickstart/aspplus/images/style1.gif"
  Caption="VB Style1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style1.src"
  Icon="/quickstart/aspplus/images/style1.gif"
  Caption="JScript Style1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<p>
CSS also defines a class attribute, which can be set to a CSS style definition contained in a &lt;style&gt;...&lt;/style&gt; section of
the document.  The class attribute makes it easy to define styles once and apply them to several tags without having to redefine the
style itself.  Styles on HTML server controls also can be set in this manner, as demonstrated in the following sample.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style2.src"
  Icon="/quickstart/aspplus/images/style2.gif"
  Caption="C# Style2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style2.src"
  Icon="/quickstart/aspplus/images/style2.gif"
  Caption="VB Style2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style2.src"
  Icon="/quickstart/aspplus/images/style2.gif"
  Caption="JScript Style2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
When an ASP.NET page is parsed, the style information is populated into a <b>Style</b> property (of type <b>CssStyleCollection</b>)
on the <b>System.Web.UI.HtmlControls.HtmlControl</b> class.  This property is essentially a dictionary  that exposes the control's
styles as a string-indexed collection of values for each style-attribute key.  For example, you could use the following code to set and
subsequently retrieve the <b>width</b> style attribute on an <b>HtmlInputText</b> server control.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server" &gt;

    void Page_Load(Object sender, EventArgs E) {
        MyText.Style["width"] = "90px";
        Response.Write(MyText.Style["width"]);
    }

&lt;/script&gt;

&lt;input type="text" id="MyText" runat="server"/&gt;
</Tab>

<Tab Name="VB">
&lt;script language="VB" runat="server" &gt;

    Sub Page_Load(Sender As Object, E As EventArgs)
        MyText.Style("width") = "90px"
        Response.Write(MyText.Style("width"))
    End Sub

&lt;/script&gt;

&lt;input type="text" id="MyText" runat="server"/&gt;
</Tab>

<Tab Name="JScript">
&lt;script language="JScript" runat="server" &gt;

    function Page_Load(sender : Object, E : EventArgs) : void {
        MyText.Style("width") = "90px";
        Response.Write(MyText.Style("width"));
    }

&lt;/script&gt;

&lt;input type="text" id="MyText" runat="server"/&gt;
</Tab>
</Acme:TabControl>

<p>
This next sample shows how you can programmatically manipulate the style for an HTML server control using this <b>Style</b> collection
property.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style3.src"
  Icon="/quickstart/aspplus/images/style3.gif"
  Caption="C# Style3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style3.src"
  Icon="/quickstart/aspplus/images/style3.gif"
  Caption="VB Style3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style3.src"
  Icon="/quickstart/aspplus/images/style3.gif"
  Caption="JScript Style3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="webstyles">
<br>
<span class="subhead">Applying Styles to Web Server Controls</span>
<p>

Web server controls provide an additional level of support for styles by adding several strongly typed properties for commonly used
style settings, such as background and foreground color, font name and size, width, height, and so on.  These style properties represent a
subset of the style behaviors available in HTML and are represented as "flat" properties exposed directly on the
<b>System.Web.UI.WebControls.WebControl</b> base class.  The advantage of using these properties is that they provide
compile-time type checking and statement completion in development tools such as Microsoft Visual Studio .NET.
<p>
The following sample shows a <b>WebCalendar</b> control with several styles applied to it (a calendar without styles applied is included for
contrast).  Note that when setting a property that is a class type, such as <b>Font</b>, you need to use the subproperty syntax
 <i>PropertyName-SubPropertyName</i> .
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style4.src"
  Icon="/quickstart/aspplus/images/style4.gif"
  Caption="C# Style4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style4.src"
  Icon="/quickstart/aspplus/images/style4.gif"
  Caption="VB Style4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style4.src"
  Icon="/quickstart/aspplus/images/style4.gif"
  Caption="JScript Style4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The <b>System.Web.UI.WebControls</b> namespace includes a <b>Style</b> base class that encapsulates common style
attributes (additional style classes, such as <b>TableStyle</b> and <b>TableItemStyle</b>, inherit from
this common base class).  Many Web server controls expose properties of this type for specifying the style of individual rendering
elements of the control.  For example, the <b>WebCalendar</b> exposes many such style properties: <b>DayStyle</b>,
<b>WeekendDayStyle</b>, <b>TodayDayStyle</b>, <b>SelectedDayStyle</b>, <b>OtherMonthDayStyle</b>,
and <b>NextPrevStyle</b>.  You can set individual properties of these styles using the subproperty syntax
<i>PropertyName-SubPropertyName</i>, as the following sample demonstrates.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style5.src"
  Icon="/quickstart/aspplus/images/style5.gif"
  Caption="C# Style5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style5.src"
  Icon="/quickstart/aspplus/images/style5.gif"
  Caption="VB Style5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style5.src"
  Icon="/quickstart/aspplus/images/style5.gif"
  Caption="JScript Style5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
A slightly different syntax allows each <b>Style</b> property to be declared as a child element nested within Web server control tags.

<p>
<div class="code"><pre>
&lt;ASP:Calendar ... runat="server"&gt;
    &lt;TitleStyle BorderColor="darkolivegreen" BorderWidth="3"
            BackColor="olivedrab" Height="50px" /&gt;
&lt;/ASP:Calendar&gt;
</pre></div>
<p>

The following sample shows alternative syntax but is functionally equivalent to the preceding one.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style6.src"
  Icon="/quickstart/aspplus/images/style6.gif"
  Caption="C# Style6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style6.src"
  Icon="/quickstart/aspplus/images/style6.gif"
  Caption="VB Style6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style6.src"
  Icon="/quickstart/aspplus/images/style6.gif"
  Caption="JScript Style6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
As with HTML server controls, you can apply styles to Web server controls using a CSS class definition. The <b>WebControl</b> base class exposes a <b>String</b> property named <b>CssClass</b> for setting the style class:
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style7.src"
  Icon="/quickstart/aspplus/images/style7.gif"
  Caption="C# Style7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style7.src"
  Icon="/quickstart/aspplus/images/style7.gif"
  Caption="VB Style7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style7.src"
  Icon="/quickstart/aspplus/images/style7.gif"
  Caption="JScript Style7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
If an attribute is set on a server control that does not correspond to any strongly typed property on the control, the attribute
and value are populated in the <b>Attributes</b> collection of the control.  By default, server controls will render these attributes
unmodified in the HTML returned to the requesting browser client.  This means that the style and class attributes can be
set on Web server controls directly instead of using the strongly typed properties. While this requires some understanding of the actual
rendering of the control, it can be a flexible way to apply styles as well.  It is especially useful for the standard form input controls,
as illustrated in the following sample.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style8.src"
  Icon="/quickstart/aspplus/images/style8.gif"
  Caption="C# Style8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style8.src"
  Icon="/quickstart/aspplus/images/style8.gif"
  Caption="VB Style8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style8.src"
  Icon="/quickstart/aspplus/images/style8.gif"
  Caption="JScript Style8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Web server control styles can also be set programmatically, using the <b>ApplyStyle</b> method of the base <b>WebControl</b> class, as in the following code.
<p>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server"&gt;
    void Page_Load(Object Src, EventArgs E ) {
        Style style = new Style();
        style.BorderColor = Color.Black;
        style.BorderStyle = BorderStyle.Dashed;
        style.BorderWidth = 1;

        MyLogin.ApplyStyle (style);
        MyPassword.ApplyStyle (style);
        MySubmit.ApplyStyle (style);
    }
&lt;/script&gt;

Login: &lt;ASP:TextBox id="MyLogin" runat="server" /&gt;/&lt;p/&gt;
Password: &lt;ASP:TextBox id="MyPassword" TextMode="Password" runat="server" /&gt;
View:  &lt;ASP:DropDownList id="MySelect" runat="server"&gt;  ...  &lt;/ASP:DropDownList&gt;
</Tab>

<Tab Name="VB">
&lt;script language="VB" runat="server"&gt;
    Sub Page_Load(Src As Object, E As EventArgs)
        Dim MyStyle As New Style
        MyStyle.BorderColor = Color.Black
        MyStyle.BorderStyle = BorderStyle.Dashed
        MyStyle.BorderWidth = New Unit(1)

        MyLogin.ApplyStyle (MyStyle)
        MyPassword.ApplyStyle (MyStyle)
        MySubmit.ApplyStyle (MyStyle)
    End Sub
&lt;/script&gt;

Login: &lt;ASP:TextBox id="MyLogin" runat="server" /&gt;/&lt;p/&gt;
Password: &lt;ASP:TextBox id="MyPassword" TextMode="Password" runat="server" /&gt;
View:  &lt;ASP:DropDownList id="MySelect" runat="server"&gt;  ...  &lt;/ASP:DropDownList&gt;
</Tab>

<Tab Name="JScript">
&lt;script language="JScript" runat="server"&gt;
    function Page_Load(sender : Object, E : EventArgs) : void {
        Style style = new Style();
        style.BorderColor = Color.Black;
        style.BorderStyle = BorderStyle.Dashed;
        style.BorderWidth = 1;

        MyLogin.ApplyStyle (style);
        MyPassword.ApplyStyle (style);
        MySubmit.ApplyStyle (style);
    }
&lt;/script&gt;

Login: &lt;ASP:TextBox id="MyLogin" runat="server" /&gt;/&lt;p/&gt;
Password: &lt;ASP:TextBox id="MyPassword" TextMode="Password" runat="server" /&gt;
View:  &lt;ASP:DropDownList id="MySelect" runat="server"&gt;  ...  &lt;/ASP:DropDownList&gt;
</Tab>

</Acme:TabControl>

<p>
The following sample demonstrates the code above.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/CS/style9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style9.src"
  Icon="/quickstart/aspplus/images/style9.gif"
  Caption="C# Style9.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/VB/style9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style9.src"
  Icon="/quickstart/aspplus/images/style9.gif"
  Caption="VB Style9.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/customize/JS/style9.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/customize/style9.src"
  Icon="/quickstart/aspplus/images/style9.gif"
  Caption="JScript Style9.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>ASP.NET's HTML server control and Web server control families provide first-class support for CSS styles.
<li>Styles may be applied by setting either the style or the class attributes of a control.  These settings are accessible
programmatically through the control's <b>Attributes</b> collection.  In the case of HTML server controls, individual values for style-attribute
keys can be retrieved from the control's <b>Style</b> collection.
<li>Most commonly used style settings are exposed on Web server controls as strongly typed properties of the control itself.
<li>The <b>System.Web.UI.WebControls</b> namespace includes a <b>Style</b> base class that encapsulates common style
attributes.  Many Web server controls expose properties of this type to control individual rendering elements.
<li>Styles may be set programmatically on Web server controls using the <b>ApplyStyle</b> method of the <b>WebControl</b> base class.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->