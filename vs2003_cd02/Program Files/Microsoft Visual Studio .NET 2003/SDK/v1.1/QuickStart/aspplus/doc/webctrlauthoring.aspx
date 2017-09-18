<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Authoring Custom Controls</span>
<p>

<!-- #include virtual="/quickstart/aspplus/include/wftoc7.inc" -->
<p>
<hr>

This section of the QuickStart demonstrates how advanced developers can write their own
ASP.NET server controls that work within the ASP.NET page framework. By writing your own
custom ASP.NET server controls, you can encapsulate custom user interface and other 
functionality in controls that can be reused on ASP.NET pages. The QuickStart provides an introduction to authoring custom controls through hands-on examples. For more 
information about control authoring, see Developing ASP.NET Server Controls in the Microsoft 
.NET Framework SDK documentation.
<p>
<b>Note:</b>  The controls described in this section might not work correctly at design time in a forms designer such as Microsoft Visual Studio .NET, although they work properly at run time on ASP.NET pages.
To work in a designer, a control needs to apply design-time attributes not described here. For details about the design-time attributes you need to apply, see Design-Time Attributes for Components in the SDK documentation.
<p>

<!--BEGIN SECTION-->
<a name="simplectrl">
<span class="subhead">Developing a Simple Custom Control</span>
<p>

It is easy to start authoring your own ASP.NET server controls. To create a simple custom
control, all you have to do is to define a class that derives from <b>System.Web.UI.Control</b>
and override its <b>Render</b> method. The <b>Render</b> method takes one argument of type
<b>System.Web.UI.HtmlTextWriter</b>. The HTML that your control wants to send to the
client is passed as a string argument to the <b>Write</b> method of <b>HtmlTextWriter</b>.
<p>
The following example demonstrates a simple control that renders a message string.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/CS/Simple.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/Simple.src"
  Icon="/quickstart/aspplus/images/ctrlauth1.gif"
  Caption="C# Simple.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/VB/Simple.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/Simple.src"
  Icon="/quickstart/aspplus/images/ctrlauth1.gif"
  Caption="VB Simple.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/JS/Simple.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/Simple.src"
  Icon="/quickstart/aspplus/images/ctrlauth1.gif"
  Caption="JScript Simple.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="properties">
<br>
<span class="subhead">Defining Simple Properties</span>
<p>

Properties are like "smart" fields that have accessor methods. You should expose
properties instead of public fields from your controls because properties allow
data hiding, can be versioned, and are supported by visual designers. Properties
have get/set accessor methods that set and retrieve properties, and allow
additional program logic to be performed if needed.
<p>
The following sample shows how to add simple properties that correspond to primitive
data types such as integer, Boolean, and string. The sample defines three properties
- <code>Message</code> is of type string, <code>MessageSize</code>  is of type enumeration,
and <code>Iterations</code> is of type integer. Note the page syntax for setting simple and enumeration
properties.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/CS/SimpleProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth2.gif"
  Caption="C# SimpleProperty.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/VB/SimpleProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth2.gif"
  Caption="VB SimpleProperty.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/JS/SimpleProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth2.gif"
  Caption="JScript SimpleProperty.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="classprops">
<br>
<span class="subhead">Defining Class Properties</span>
<p>

If a class A has a property whose type is class B, then the properties of B (if any) are
called subproperties of A. The following sample defines a custom control <code>SimpleSubProperty</code> 
that has a property of type <code>Format</code>. <code>Format</code> is a class that has two primitive properties
- <code>Color</code> and <code>Size</code>, which in turn become subproperties of <code>SimpleSubProperty</code>.
<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/CS/SimpleSubProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleSubProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth3.gif"
  Caption="C# SimpleSubProperty.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/VB/SimpleSubProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleSubProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth3.gif"
  Caption="VB SimpleSubProperty.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/JS/SimpleSubProperty.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleSubProperty.src"
  Icon="/quickstart/aspplus/images/ctrlauth3.gif"
  Caption="JScript SimpleSubProperty.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Note that ASP.NET has a special syntax for setting subproperties. The following code example shows how to
declaratively set the <code>Format.Color</code> and <code>Format.Size</code> subproperties on <code>SimpleSubProperty</code>.
The "-" syntax denotes a subproperty.
<p>
<code>
&lt;SimpleControlSamples:SimpleSubProperty Message="Hello There" Format-Color="red" Format-Size="3" runat=server/&gt;
</code>
<p>


<!--BEGIN SECTION-->
<p>
<a name="innercontent">
<br>
<span class="subhead">Retrieving Inner Content</span>
<p>

Every control has a <b>Controls</b> property that it inherits from <b>System.Web.UI.Control</b>. This
is a collection property that denotes the child controls (if any) of a control. If a control is not marked with the <b>ParseChildrenAttribute</b> or marked with <b>ParseChildrenAttribute(ChildrenAsProperties = false)</b>, 
the ASP.NET page framework applies the following parsing logic when the control is used declaratively on a page. If the parser 
encounters nested controls within the control's tags, it creates instances of them and adds them to the <b>Controls</b> property of the control. 
Literal text between tags is added as a <b>LiteralControl</b>. Any other nested elements generate a parser error.

<p>
The following sample shows a custom control, <code>SimpleInnerContent</code>, that renders text added
between its tags by checking if a <b>LiteralControl</b> has been added to its Controls collection.
If so, it retrieves the <b>Text</b> property of the <b>LiteralControl</b>, and appends it to its output
string.
<p>



<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/CS/SimpleInnerContent.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleInnerContent.src"
  Icon="/quickstart/aspplus/images/ctrlauth4.gif"
  Caption="C# SimpleInnerContent.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/VB/SimpleInnerContent.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleInnerContent.src"
  Icon="/quickstart/aspplus/images/ctrlauth4.gif"
  Caption="VB SimpleInnerContent.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/simple/JS/SimpleInnerContent.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/simple/SimpleInnerContent.src"
  Icon="/quickstart/aspplus/images/ctrlauth4.gif"
  Caption="JScript SimpleInnerContent.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>Note:</b> If your custom control derives from <b>WebControl</b>, it will not have the parsing logic described in the sample, because 
<b>WebControl</b> is marked with <b>ParseChildrenAttribute(ChildrenAsProperties = true)</b>, which results in a different 
parsing logic. For more information about the <b>ParseChildrenAttribute</b>, see the SDK documentation.

<p>

<!--BEGIN SECTION-->
<p>
<a name="composition">
<br>
<span class="subhead">Developing a Composite Control</span>
<p>

You can author new controls by combining existing controls using class composition.
Composite controls are equivalent to user controls that are authored using ASP.NET page
syntax. The main difference between user controls and composite controls is that user
controls are persisted as .ascx text files, whereas composite controls are compiled
and persisted in assemblies.
<p>
The key steps in developing a composite control are:
<ul>
<li>Override the protected <b>CreateChildControls</b> method inherited from <b>Control</b> to create
instances of child controls and add them to the Controls collection.
<li>If new instances of your composite control will repeatedly be created on a page, implement the
<b>System.Web.UI.INamingContainer</b> interface. This is a tagging interface that has no methods.
When it is implemented by a control, the ASP.NET page framework creates a new naming scope
under that control. This ensures that the child controls will have unique IDs in the
hierarchical tree of controls.
</ul>
You do not have to override the <b>Render</b> method because child controls provide rendering
logic. You can expose properties that synthesize properties of the child controls.
<p>
The following sample defines a composite control, <code>Composition1</code>, that combines a
<b>System.Web.UI.LiteralControl</b> and a <b>System.Web.UI WebControls.TextBox</b>. <code>Composition1</code>
exposes a custom property, <code>Value</code>, of type integer, that maps to the <b>Text</b> property of
<b>TextBox</b>.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/CS/Composition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth5.gif"
  Caption="C# Composition1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/VB/Composition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth5.gif"
  Caption="VB Composition1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/JS/Composition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth5.gif"
  Caption="JScript Composition1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="postbackevts">
<br>
<span class="subhead">Handling Events in a Composite Control</span>
<p>

A composite control can handle events raised by its child controls. This is accomplished
by providing event handling methods and attaching delegates to the events raised by the
child controls.
<p>
The following sample shows a composite control, <code>Composition2</code>, that adds two button controls
(named <code>Add</code> and <code>Subtract</code>) to the composite control from the previous example and provides
event handling methods for the <b>Click</b> events of the buttons. These methods increment and
decrement the <code>Value</code> property of <code>Composition2</code>. The <b>CreateChildControls</b> method of
<code>Composition2</code> creates instances of event handlers (delegates) that reference these methods, and
attaches the delegates to the <b>Click</b> events of the <b>Button</b> instances. The end result is a
control that does its own event handling - when the <code>Add</code> button is clicked, the value in
the text box is incremented, and when the <code>Subtract</code> button is clicked, the value is
decremented.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/CS/Composition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth6.gif"
  Caption="C# Composition2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/VB/Composition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth6.gif"
  Caption="VB Composition2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/JS/Composition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth6.gif"
  Caption="JScript Composition2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!--BEGIN SECTION-->
<p>
<a name="exposingevts">
<br>
<span class="subhead">Raising Custom Events from a Composite Control</span>
<p>

A composite control can define custom events that it raises in response to events raised
by its child controls.
<p>
The following example shows a composite control, <code>Composition3</code>, that raises a custom event,
<code>Change</code>, in response to the <b>TextChanged</b> event of the <b>TextBox</b> child control.
<p>
This is accomplished as follows:
<ul>
<li>The custom <code>Change</code> event is defined using the standard event pattern. (This pattern
includes the definition of a protected <code>OnChange</code> method that raises the <code>Change</code> event.)
<p><Acme:TabControl runat="server">
<Tab Name="C#">
public event EventHandler Change;
protected void OnChange(EventArgs e) {
    Change(this, e);
}
</Tab>

<Tab Name="VB">
Public Event Change(Sender as Object, E as EventArgs)
Protected Sub OnChange(e As EventArgs)
    Change(Me, e)
End Sub
</Tab>

<Tab Name="JScript">
Event handlers can only be consumed and not created in JScript.
</Tab>

</Acme:TabControl><p>

<li>An event-handling method is defined for the <b>TextChanged</b> event of <b>TextBox</b>. This method
raises the <code>Change</code> event by invoking the <code>OnChange</code> method.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
private void TextBox_Change(Object sender, EventArgs e) {
    OnChange(EventArgs.Empty);
}
</Tab>

<Tab Name="VB">
Private Sub TextBox_Change(sender As Object, e As EventArgs)
    OnChange(EventArgs.Empty)
End Sub
</Tab>

<Tab Name="JScript">
private function TextBox_Change(sender:Object, e:EventArgs) : void {
    OnChange(EventArgs.Empty);
}
</Tab>

</Acme:TabControl><p>

<li>The <b>CreateChildControls</b> method creates an instance of an event handler that references the above
method, and attaches the event handler to the <b>TextChanged</b> event of the <b>TextBox</b> instance.
<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected override void CreateChildControls() {
  ..
  TextBox box = new TextBox();
  box.TextChanged += new EventHandler(this.TextBox_Change);
  ...
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub CreateChildControls()
  ...
  Dim box As New TextBox()
  AddHandler Box.TextChanged, AddressOf TextBox_Change
    ...
End Sub
</Tab>

<Tab Name="JScript">
override protected function CreateChildControls() : void {
  ..
  var box:TextBox = new TextBox();
  box.add_TextChanged(this.TextBox_Change);
  ...
}
</Tab>

</Acme:TabControl><p>

</ul>
The <code>Change</code> event can be handled by a page that hosts the control, as shown in the following sample. In the sample, the page provides an event-handling method for the <code>Change</code> event that
sets the <code>Value</code> property to zero if the number entered by the user is negative.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/CS/Composition3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition3.src"
  Icon="/quickstart/aspplus/images/ctrlauth7.gif"
  Caption="C# Composition3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/VB/Composition3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition3.src"
  Icon="/quickstart/aspplus/images/ctrlauth7.gif"
  Caption="VB Composition3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/composition/JS/Composition3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/composition/Composition3.src"
  Icon="/quickstart/aspplus/images/ctrlauth7.gif"
  Caption="JScript Composition3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="viewstate">
<br>
<span class="subhead">Maintaining State</span>

<p>
Every Web Forms control has a <b>ViewState</b> property (inherited 
from <b>Control</b>) that enables it to participate in <b>ViewState</b> 
management. The type of <b>ViewState</b> is <b>Sytem.Web.UI.StateBag</b>, 
which is a data structure equivalent to a hashtable. A control can save 
data in <b>ViewState</b> as key/value pairs. <b>ViewState</b> is 
persisted to a string variable by the ASP.NET page framework and makes a 
round trip to the client as a hidden variable. Upon postback, the page framework
parses the input string from the hidden variable and populates the 
<b>ViewState</b> property of each control in the control hierarchy 
of a page. A control can restore its state (set properties and fields 
to their values before postback) using the <b>ViewState</b> property.
Control developers should be aware that there is a performance 
overhead in sending data by round trip to the client, and be judicious 
about what they save in <b>ViewState</b>.
</p>

<p>
The following code example shows a property that is saved in <b>ViewState</b>.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
public String Text {
    get {
        return (String) ViewState["Text"];
    }
    set {
        ViewState["Text"] = value;
    }
}
</Tab>

<Tab Name="VB">
Public Property [Text] As String
    Get
        Return CStr(ViewState("Text"))
    End Get
    Set
        ViewState("Text") = Value
    End Set
End Property
</Tab>

<Tab Name="JScript">
public function get Text() : String {
    return String(ViewState["Text"]);
}
public function set Text(value:String) {
    ViewState["Text"] = value;
}


</Tab>

</Acme:TabControl>
</p>

<p>
The following sample shows a custom control, <code>Label</code>,
that has two properties, <code>Text</code> and
<code>FontSize</code>, that are saved in <b>ViewState</b>. 
The ASP.NET page that uses <b>Label</b> contains buttons that
have event handlers to increase the font size of the text 
in <b>Label</b> when a button is
clicked. Thus the font size increases every time a button 
is clicked. This is possible
only due to state management - <code>Label</code> needs to 
know what the font size was before postback
in order to render the next larger font size after postback.
</p>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/CS/Label.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/Label.src"
  Icon="/quickstart/aspplus/images/ctrlauth8.gif"
  Caption="C# Label.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/VB/Label.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/Label.src"
  Icon="/quickstart/aspplus/images/ctrlauth8.gif"
  Caption="VB Label.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/JS/Label.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/viewstate/Label.src"
  Icon="/quickstart/aspplus/images/ctrlauth8.gif"
  Caption="JScript Label.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="noncomposition">
<br>
<span class="subhead">Developing a Custom (Non-Composite) Control that Handles Postback Data</span>
<p>

You authored a simple custom control at the beginning of this QuickStart. The following 
example demonstrates a custom control that does something more meaningful - it
renders an input box, and reads in data entered by the user. A control that 
examines postback (input) data must implement the <b>System.Web.UI.IPostBackDataHandler</b>
interface. This signals to the ASP.NET page framework that a control should participate
in postback data handling. The page framework passes input data to the <b>LoadPostData</b>
method of this interface as key/value pairs. In its implementation of this method,
the control can examine the input data and update its properties as shown below.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
private int _value = 0;
public bool LoadPostData(String postDataKey, NameValueCollection values) {
    _value = Int32.Parse(values[this.UniqueID]);
    return false;
}
</Tab>

<Tab Name="VB">
Private _value As Integer = 0
Public Function LoadPostData(postDataKey As String, values As NameValueCollection) As Boolean
    _value = Int32.Parse(values(Me.UniqueID))
    Return(False)
End Function
</Tab>

<Tab Name="JScript">
private var _value:int = 0;
public function LoadPostData(postDataKey:String, values:NameValueCollection) : Boolean {
    _value = Int32.Parse(values[this.UniqueID]);
    return false;
}
</Tab>

</Acme:TabControl><p>

The following sample defines a custom control, <code>NonComposition1</code>, that implements
<b>IPostBackDataHandler</b> and has one property, <code>Value</code>. The control renders an
HTML input box whose text attribute is the string representation of <code>Value</code>. The
property is set by examining postback input data. The page that uses
<code>NonComposition1</code> also has two buttons that have event handlers to increment
and decrement the <code>Value</code> property of <code>NonComposition1</code>.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/CS/NonComposition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth9.gif"
  Caption="C# NonComposition1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/VB/NonComposition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth9.gif"
  Caption="VB NonComposition1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/JS/NonComposition1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition1.src"
  Icon="/quickstart/aspplus/images/ctrlauth9.gif"
  Caption="JScript NonComposition1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>


<!--BEGIN SECTION-->
<p>
<a name="javascript">
<br>
<span class="subhead">Generating Client-side JavaScript for Custom Postback</span>
<p>


If a control wants to capture postback events (form submissions from a client), it must
implement the <b>System.Web.UI.IPostBackEventHandler</b> interface. This signals to the ASP.NET
page framework that a control wants to be notified of a postback event. The
<b>RaisePostBackEvent</b> method allows the control to handle the event, and to raise
other events. Additionally, the ASP.NET page framework has a custom event
architecture that allows a control to generate client-side JavaScript that
initiates custom postback. Normally, postback is initiated by only a few
elements such as a Submit button or an Image button. However, by emitting
client-side JavaScript, a control can also initiate postback from other
HTML elements.
<p>
The following example defines a custom control, <code>NonComposition2</code>, that builds on the
previous example, <code>NonComposition1</code>. In addition to the interface provided by
<code>NonComposition1</code>, it renders two <b>HtmlButtons</b> that generate client-side JavaScript
to cause postback when clicked. The name attributes of these buttons are Add
and Subtract. The name attribute is passed as a string argument to
<b>RaisePostBackEvent</b> by the page framework. <code>NonComposition2</code> implements
<b>RaisePostBackEvent</b> to increment the <code>Value</code> property if Add is clicked and to
decrement <code>Value</code> if Subtract is clicked, as shown below.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
public void RaisePostBackEvent(String eventArgument) {
    if (eventArgument == "Add") {
        this.Value++; }
    else {
        this.Value--;
    }
}
</Tab>

<Tab Name="VB">
Public Sub RaisePostBackEvent(eventArgument As String)
    If eventArgument = "Add" Then
        Me.Value = Me.Value + 1
    Else
        Me.Value = Me.Value - 1
    End If
End Sub
</Tab>

<Tab Name="JScript">
public function RaisePostBackEvent(eventArgument:String) : void {
    if (eventArgument == "Add") {
        this.Value++; }
    else {
        this.Value--;
    }
}
</Tab>

</Acme:TabControl><p>

The user interface that is presented to the client is identical to that in the previous
example; however, the entire UI is rendered by one custom control that also handles
the postback events. The page developer can simply add <code>NonComposition2</code> to the page,
without providing any event handling logic. The following sample presents this code in action.

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/CS/NonComposition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth10.gif"
  Caption="C# NonComposition2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/VB/NonComposition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth10.gif"
  Caption="VB NonComposition2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/JS/NonComposition2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/noncomposition/NonComposition2.src"
  Icon="/quickstart/aspplus/images/ctrlauth10.gif"
  Caption="JScript NonComposition2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="templated">
<br>
<span class="subhead">Developing a Templated Control</span>
<p>

The ASP.NET page framework allows control developers to author controls that separate the
user interface from the control logic through the use of templates. Page developers
can customize the presentation of the control by providing the UI as parameters between
template tags.
<p>
Templated controls have one or more properties of type <b>System.Web.UI.ITemplate</b>, as
shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
[TemplateContainer(typeof(Template1))] public ITemplate MessageTemplate {...}
</Tab>

<Tab Name="VB">
Public Property &lt;TemplateContainer(GetType(Template1VB))&gt; MessageTemplate As ITemplate
</Tab>

<Tab Name="JScript">
TemplateContainerAttribute(Template1) function get MessageTemplate() : ITemplate
</Tab>

</Acme:TabControl><p>

In the code above, the attribute specifies the type of the container (parent)
control.
<p>
The <b>ITemplate</b> interface has one method, <b>InstantiateIn</b>, that creates a control instance
dynamically. This is invoked on the <b>ITemplate</b> property in the <b>CreateChildControls</b>
method, as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected override void CreateChildControls() {
    if (MessageTemplate != null) {
        MessageTemplate.InstantiateIn(this);
    }
    ...
}
</Tab>

<Tab Name="VB">
Protected Overrides Sub CreateChildControls()
    If MessageTemplate <> Null Then
        MessageTemplate.InstantiateIn(Me)
    End if
    ...
End Sub
</Tab>

<Tab Name="JScript">
override protected function CreateChildControls() : void {
    if (MessageTemplate != null) {
        MessageTemplate.InstantiateIn(this);
    }
    ...
}
</Tab>

</Acme:TabControl><p>

The following sample shows a simple templated control and an ASP.NET page that uses it.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/CS/Template1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Template1.src"
  Icon="/quickstart/aspplus/images/ctrlauth11.gif"
  Caption="C# Template1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/VB/Template1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Template1.src"
  Icon="/quickstart/aspplus/images/ctrlauth11.gif"
  Caption="VB Template1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/JS/Template1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Template1.src"
  Icon="/quickstart/aspplus/images/ctrlauth11.gif"
  Caption="JScript Template1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="templatedlist">
<br>
<span class="subhead">Developing a Templated Databound Control</span>
<p>

The following sample shows a more complex use of templates to create a databound control.
The Repeater control defined in this example is similar to the
<b>System.Web.UI.WebControls.Repeater</b> control.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/CS/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater1.src"
  Icon="/quickstart/aspplus/images/ctrlauth12.gif"
  Caption="C# Repeater1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/VB/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater1.src"
  Icon="/quickstart/aspplus/images/ctrlauth12.gif"
  Caption="VB Repeater1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/JS/Repeater1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater1.src"
  Icon="/quickstart/aspplus/images/ctrlauth12.gif"
  Caption="JScript Repeater1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

The following sample modifies the preceding sample so that a page
consumer can walk its Items collection during postback to pull out values from it.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/CS/Repeater2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater2.src"
  Icon="/quickstart/aspplus/images/ctrlauth13.gif"
  Caption="C# Repeater2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/VB/Repeater2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater2.src"
  Icon="/quickstart/aspplus/images/ctrlauth13.gif"
  Caption="VB Repeater2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/templates/JS/Repeater2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/templates/Repeater2.src"
  Icon="/quickstart/aspplus/images/ctrlauth13.gif"
  Caption="JScript Repeater2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<p>
<a name="parsing">
<br>
<span class="subhead">Overriding Control Parsing</span>
<p>

As you saw in <a href="#innercontent">Retrieving Inner Content</a> , if a control A has
nested controls within its
control tags on a page, the page parser adds instances of those controls to A's Controls
collection. This is done by invoking the <b>AddSubParsedObject</b> method of A. Every control
inherits this method from <b>Control</b>; the default implementation simply inserts a child
control into the control hierarchy tree. A control can override the default parsing
logic by overriding the <b>AddSubParsedObject</b> method. Note that this discussion is
somewhat simplified; more details are given in the next example.
<p>
The following sample defines a custom control, <code>CustomParse1</code>, that overrides the default
parsing logic. When a child control of a certain type is parsed, it adds it to a
collection. The rendering logic of <code>CustomParse1</code> is based on the number of items in
that collection. A simple custom control, <code>Item</code>, is also defined in the sample.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CS/CustomParse1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse1.src"
  Icon="/quickstart/aspplus/images/ctrlauth14.gif"
  Caption="C# CustomParse1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/VB/CustomParse1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse1.src"
  Icon="/quickstart/aspplus/images/ctrlauth14.gif"
  Caption="VB CustomParse1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/JS/CustomParse1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse1.src"
  Icon="/quickstart/aspplus/images/ctrlauth14.gif"
  Caption="JScript CustomParse1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<b>Note:</b> If your custom control derives from <b>WebControl</b>, it will not have the parsing logic described in the sample, because 
<b>WebControl</b> is marked with <b>ParseChildrenAttribute(ChildrenAsProperties = true)</b>, which results in a different 
parsing logic. For more information about the <b>ParseChildrenAttribute</b>, see the SDK documentation.  The
<a href="#innercontent">Retrieving Inner Content</a> topic also describes this issue in more detail.
<p>

<p>

<!--BEGIN SECTION-->
<p>
<a name="builder">
<br>
<span class="subhead">Defining a Custom Control Builder</span>
<p>

The ASP.NET page framework uses classes called control builders to process the declarations
within control tags on a page. Every Web Forms control is associated with a default
control builder class, <b>System.Web.UI.ControlBuilder</b>. The default control builder
adds a child control to the Controls collection for every nested control that it
encounters within control tags. Additionally, it adds <b>Literal</b> controls for text
between nested control tags. You can override this default behavior by associating
a custom control builder class with your control. This is done by applying a control
builder attribute to your control, as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
[ControlBuilderAttribute(typeof(CustomParse2ControlBuilder))]
  public class CustomParse2 : Control {...}
</Tab>

<Tab Name="VB">
Public Class &lt;ControlBuilderAttribute(GetType(CustomParse2ControlBuilderVB))&gt; _
  CustomParse2VB : Inherits Control
</Tab>

<Tab Name="JScript">
ControlBuilderAttribute(CustomParse2ControlBuilder)
  class CustomParse2 extends Control {... }

</Tab>

</Acme:TabControl><p>

The <code>ControlBuilderAttribute</code> above
associates the <code>CustomParse2ControlBuilder</code> class with the
<code>CustomParse2</code> control.
You can define your own custom control builder by deriving from <b>ControlBuilder</b> and
overriding its methods.
<p>
The following sample defines a custom control builder that overrides the
<b>GetChildControlType</b> method inherited from <b>ControlBuilder</b>. This method
returns the type of the control to be added and can be used to decide
which controls will be added. In the example, the control builder will
add a child control only if the tag name is "customitem". The code for
the control is very similar to the previous example, except for the addition
of the custom attribute.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CS/CustomParse2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse2.src"
  Icon="/quickstart/aspplus/images/ctrlauth15.gif"
  Caption="C# CustomParse2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/VB/CustomParse2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse2.src"
  Icon="/quickstart/aspplus/images/ctrlauth15.gif"
  Caption="VB CustomParse2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/JS/CustomParse2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlauth/customparsing/CustomParse2.src"
  Icon="/quickstart/aspplus/images/ctrlauth15.gif"
  Caption="JScript CustomParse2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->