
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Web Forms User Controls</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#intro">Introduction to User Controls</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#properties">Exposing User Control Properties</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#events">Encapsulating Events in a User Control</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#program">Creating User Controls Programmatically</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>


<!--BEGIN SECTION-->
<a name="intro">
<span class="subhead">Introduction to User Controls</span>
<p>
In addition to the built-in server controls provided by ASP.NET, you can easily define your own controls using the same programming
techniques that you have already learned for writing Web Forms pages. In fact, with just a few modifications, almost any Web Forms page
can be reused in another page as a server control (note that a user control is of type <b>System.Web.UI.UserControl</b>, which inherits directly from
<b>System.Web.UI.Control</b>).  A Web Forms page used as a server control is named a user control
for short.  As a matter of convention, the .ascx extension is used to indicate such controls.  This ensures that the user control's file cannot
be executed as a standalone Web Forms page (you will see a little that there are a few, albeit important, differences between
a user control and a Web Forms page).  User controls are included in a Web Forms page using a <b>Register</b>  directive:

<div class="code"><pre>
&lt;%@ Register TagPrefix="Acme" TagName="Message" Src="pagelet1.ascx" %&gt;
</pre></div>

<p>
The <b>TagPrefix</b> determines a unique namespace for the user control (so that multiple user controls with the same name can be differentiated from
each other).  The <b>TagName</b> is the unique name for the user control (you can choose any name).  The <b>Src</b> attribute is the virtual path to the
user control--for example "MyPagelet.ascx" or "/MyApp/Include/MyPagelet.ascx".  After registering the user control, you may place the user control
tag in the Web Forms page just as you would an ordinary server control (including the <b>runat="server"</b> attribute):
<p>

<div class="code"><pre>
&lt;Acme:Message runat="server"/&gt;
</pre></div>

<p>
The following example shows a user control imported into another Web Forms page. Note that the user control in this case is just a simple static file.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet1.src"
  Icon="/quickstart/aspplus/images/pagelet1.gif"
  Caption="C# Pagelet1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet1.src"
  Icon="/quickstart/aspplus/images/pagelet1.gif"
  Caption="VB Pagelet1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet1.src"
  Icon="/quickstart/aspplus/images/pagelet1.gif"
  Caption="JScript Pagelet1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="properties">
<br>
<span class="subhead">Exposing User Control Properties</span>
<p>

When a Web Forms page is treated as a control, the public fields and methods of that Web Form are promoted to public properties (that is, tag
attributes) and methods of the control as well.  The following example shows an extension of the previous user control example that adds
two public <b>String</b> fields.  Notice that these fields can be set either declaratively or programmatically in the containing page.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet2.src"
  Icon="/quickstart/aspplus/images/pagelet2.gif"
  Caption="C# Pagelet2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet2.src"
  Icon="/quickstart/aspplus/images/pagelet2.gif"
  Caption="VB Pagelet2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet2.src"
  Icon="/quickstart/aspplus/images/pagelet2.gif"
  Caption="JScript Pagelet2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In addition to promoting public fields to control properties, the property syntax may be used.  Property syntax has the advantage
of being able to execute code when properties are set or retrieved.  The following example demonstrates an <b>Address</b> user control that wraps the text
properties of <b>TextBox</b> controls within it.  The benefit of doing this is that the control inherits the automatic state management of the <b>TextBox</b> control
for free.
<p>
Notice that there are two <b>Address</b> user controls on the containing Web Forms page that set the 
<b>Caption</b> property to "Billing Address" and "Shipping Address", respectively.  The real power of user controls is in this type of reusability.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet3.src"
  Icon="/quickstart/aspplus/images/pagelet3.gif"
  Caption="C# Pagelet3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet3.src"
  Icon="/quickstart/aspplus/images/pagelet3.gif"
  Caption="VB Pagelet3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet3.src"
  Icon="/quickstart/aspplus/images/pagelet3.gif"
  Caption="JScript Pagelet3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Another useful user control is a <b>Login</b> control for collecting user names and passwords.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet4.src"
  Icon="/quickstart/aspplus/images/pagelet4.gif"
  Caption="C# Pagelet4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet4.src"
  Icon="/quickstart/aspplus/images/pagelet4.gif"
  Caption="VB Pagelet4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet4.src"
  Icon="/quickstart/aspplus/images/pagelet4.gif"
  Caption="JScript Pagelet4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In this example, form validation controls are added to the <b>Login</b> user control.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet5.src"
  Icon="/quickstart/aspplus/images/pagelet5.gif"
  Caption="C# Pagelet5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet5.src"
  Icon="/quickstart/aspplus/images/pagelet5.gif"
  Caption="VB Pagelet5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet5.src"
  Icon="/quickstart/aspplus/images/pagelet5.gif"
  Caption="JScript Pagelet5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<br>
<a name="events">
<br>
<span class="subhead">Encapsulating Events in a User Control</span>
<p>

User controls participate in the complete execution lifecycle of the request, much the way ordinary server controls do.  This means that
a user control can handle its own events, encapsulating some of the page logic from the containing Web Forms page.  The following example demonstrates
a product-listing user control that internally handles its own postbacks.  Note that the user control itself
has no wrapping <b>&lt;form runat="server"&gt;</b> control.  Because only one form control may be present on a page (ASP.NET does not
allow nested server forms), it is left to the containing Web Forms page to define this.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet6.src"
  Icon="/quickstart/aspplus/images/pagelet6.gif"
  Caption="C# Pagelet6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet6.src"
  Icon="/quickstart/aspplus/images/pagelet6.gif"
  Caption="VB Pagelet6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet6.src"
  Icon="/quickstart/aspplus/images/pagelet6.gif"
  Caption="JScript Pagelet6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="program">
<br>
<span class="subhead">Creating User Controls Programmatically</span>
<p>

Just as ordinary server controls can be created programmatically, so user controls can be. The page's <b>LoadControl</b> method is used to
load the user control, passing the virtual path to the user control's source file: <p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Control c1 = LoadControl("pagelet7.ascx");
((Pagelet7CS)c1).Category = "business";
Page.Controls.Add(c1);
</Tab>

<Tab Name="VB">
Dim c1 As Control = LoadControl("pagelet7.ascx")
CType(c1, (Pagelet7VB)).Category = "business"
Page.Controls.Add(c1)
</Tab>

<Tab Name="JScript">
var c1:Control = LoadControl("pagelet7.ascx");
(Pagelet7JS(c1)).Category = "business";
Page.Controls.Add(c1);
</Tab>

</Acme:TabControl><p>

The type of the user control is determined by a <b>ClassName</b> attribute on the <b>Control</b> directive.  For
example, a user control saved with the file name "pagelet7.ascx" is assigned the strong type "Pagelet7CS"
as follows:

<div class="code"><pre>
&lt;%@ Control ClassName="Pagelet7CS" %&gt;
</pre></div>

<p>
Because the <b>LoadControl</b> method returns a type of <b>System.Web.UI.Control</b>, it must be cast to the
appropriate strong type in order to set individual properties of the control.  Finally, the user
control is added to the base page's <b>ControlCollection</b>.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/CS/Pagelet7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet7.src"
  Icon="/quickstart/aspplus/images/pagelet7.gif"
  Caption="C# Pagelet7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/VB/Pagelet7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet7.src"
  Icon="/quickstart/aspplus/images/pagelet7.gif"
  Caption="VB Pagelet7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/pagelets/JS/Pagelet7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/pagelets/Pagelet7.src"
  Icon="/quickstart/aspplus/images/pagelet7.gif"
  Caption="JScript Pagelet7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>Important</b>  The strong type for a user control is available to the containing Web Forms page only if a <b>Register</b> directive is included for
the user control (even if there are no user control tags actually declared).

<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>User controls allow developers to easily define custom controls using the same programming techniques as for writing Web Forms pages.
<li>As a matter of convention, an .ascx file name extension is used to indicate such controls.  This ensures that a user control file cannot
be executed as a standalone Web Forms page.
<li>User controls are included into another Web Forms page using a <b>Register</b> directive, which specifies a <b>TagPrefix</b>, <b>TagName</b>, and <b>Src location</b>.
<li>After the user control has been registered, a user control tag may be placed in a Web Forms page as an ordinary server control (including the <b>runat="server"</b> attribute).
<li>The public fields, properties, and methods of a user control are promoted to public properties (tag attributes) and methods of the
control in the containing Web Forms page.
<li>User controls participate in the complete execution lifecycle of every request and can handle their own events, encapsulating some of the
page logic from the containing Web Forms page.
<li>User controls should not contain any form controls but should instead rely on their containing Web Forms page to include one if necessary.
<li>User controls may be created programmatically using the <b>LoadControl</b> method of the <b>System.Web.UI.Page</b> class.  The type of the user control is
determined by the ASP.NET runtime, following the convention <i>filename</i>_<i>extension</i>.
<li>The strong type for a user control is available to the containing Web Forms page only if a <b>Register</b> directive is included for
the user control (even if there are no user control tags actually declared).
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->