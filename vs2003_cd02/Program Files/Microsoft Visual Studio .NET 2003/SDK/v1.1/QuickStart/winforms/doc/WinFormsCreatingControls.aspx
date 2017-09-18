<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Creating Controls</span>

<P>This topic demonstrates how you can create Windows Forms controls.  It
covers the basics of creating a control.  In addition, this topic 
covers adding painting logic to a control, exposing properties and
events, using control licensing, and adding design-time behavior to your
control.  The following topic areas are covered in this topic:</P>

<ul>
    <li><a href="#Introduction">Introduction</a>
    <li><a href="#Getting Started">Getting Started</a>
    <li><a href="#Adding Properties, Events and MetaData">Adding Properties, Events, and MetaData</a>
    <li><a href="#Customising the properties window">Adding Custom Editors to the Properties Window</a>
    <li><a href="#Extender Providers">Extender Providers</a>
    <li><a href="#User Controls">User Controls</a>
    <li><a href="#Licensing Controls">Licensing Controls</a>
</ul>


<a name="Introduction">

<P><B>Note:</B> This topic is covered in much more detail in the control
creation section of the Microsoft .NET Framework SDK documentation.</P>

<P>There are two types of controls:

<UL>

<LI><B>Custom controls: </B>Controls that display UI by making calls to
a <b>Graphics</b> object in the <b>Paint</b> event.  Custom controls typically
derive from <B>Control</B>.  A <b>Chart</b> control is an example of a custom
control.  There is limited design-time support for creating custom
controls.  <BR><BR>

<LI><B>User or Composite controls: </B>Controls that are composed of
other controls.  User controls derive from <B>UserControl</B>.  A control
that displays a customer address using <b>TextBox</b> controls is an example of a
user control.  There is full design-time support for creating user
controls with the Visual Studio .NET Windows Forms Designer.  </LI>
</UL>

<P>The majority of the samples in this topic demonstrate building custom
controls. However, the sections on exposing properties and events,
defining design-time behavior, and licensing apply to both custom and user
controls.  </P>

<a name="Getting Started">
<span class="subhead">Getting Started</span>

<span class="subhead">Writing a Simple Control</span>

<P>The following example creates a simple control that displays the value
of its <b>Text</b> property by handling the <b>Paint</b> event.  In order
to create this control and handle the event, you must create a class
that inherits from <b>Control</b> and create a method that overrides the
<b>OnPaint</b> method.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class HelloWorldControl : Control {

    protected override void OnPaint(PaintEventArgs e) {

        RectangleF rect = new RectangleF(ClientRectangle.X,
                                         ClientRectangle.Y,
                                         ClientRectangle.Width,
                                         ClientRectangle.Height);

        //Paint the Text property on the control
        e.Graphics.DrawString(this.Text, Font, new SolidBrush(ForeColor), rect);

    }

}
</Tab>

<Tab Name="VB">
public class HelloWorldControl: Inherits Control

    Overrides Protected Sub OnPaint(e As PaintEventArgs)

        Dim rect As RectangleF = new RectangleF(ClientRectangle.X,
                                                 ClientRectangle.Y,
                                                 ClientRectangle.Width,
                                                 ClientRectangle.Height)

        'Paint the Text property on the control
        e.Graphics.DrawString(Me.Text, Font, new SolidBrush(ForeColor), rect)

    End Sub

End Class
</Tab>

</Acme:TabControl><p>

<p>View and run this sample.
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/HelloWorldControl/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/HelloWorldControl/HelloWorldControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Hello World Control"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/HelloWorldControl/VB"
        ViewSource="/quickstart/winforms/Samples/WritingControls/HelloWorldControl/HelloWorldControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Hello World Control"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<span class="subhead">Examining the Design-Time Behavior of a Control</span>

<P>You can test the design-time behavior of a control in the Visual Studio .NET Windows Forms designer:</P>
  <ol>
  <LI>Start Visual Studio .NET, select to create a new C# or VB <b>Windows Application</b>.
  <LI>Select <B>Add Reference</B> on the <b>Project</b> menu.
  <LI>Select the DLL containing the control you want to use.
  <LI>Open the toolbox list and right click on the panel.  Select <b>Customize Toolbox</b>.
  <LI>Select the same dll as the previous step.  It will be added to the toolbox.
  <LI>Select the control and add it to the form.<br>
    You will see the control appear on the form.
  <LI>If you are adding the control from the previous example, you will
    notice that even this very simple control has a full set of
  properties and a broad range of design-time behavior. This default
  behavior is inherited from the <b>Control</b> class. </LI>
  </ol>
  <P><B>Note: </B>For a control to be displayed in the Windows Forms Designer, it must have a public
constructor that takes no parameters.</P>

<a name="Adding Properties, Events and MetaData">
<span class="subhead">Adding Properties, Events and Metadata</span>

      <P>Now that you have created a simple control, you can add properties,
      events, and metadata information to it. The following example:
      <UL>
        <LI>Adds a property called <B>DrawMode</B> that is used to determine how
        the control paints.
        <LI>Adds an event that is raised when the <B>DrawMode</B> property is
        changed.
        <LI>Adds metadata to the control to describe its design-time behavior.
        <LI>Overrides a property inherited from <b> Control</b> to hide it at
        design-time. </LI></UL>

<span class="subhead">Adding a Property</span>

<P>First, create a simple enumeration called <b>DrawingMode</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public enum DrawingMode {
    Happy = 0,
    Sad = 1,
    Angry = 2
}
</Tab>

<Tab Name="VB">
Public Enum DrawingModeStyle
    Happy = 0
    Sad = 1
    Angry = 2
End Enum
</Tab>

</Acme:TabControl><p>

      <P>Next, add a <b>DrawingMode</b> property to the control. The
      following code adds this property to the control that was created
      previously.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//DrawingMode - controls how the control paints

public DrawingModeStyle DrawingMode {

    get {
        return drawingMode;
    }

    set {
        drawingMode=value;

        //Raise property changed event for DrawingMode</span>
        OnDrawingModeChanged(EventArgs.Empty);
    }

}
</Tab>

<Tab Name="VB">
'DrawingMode - controls how the control paints

Public Property DrawingMode As DrawingModeStyle

    Get
        Return myDrawingMode
    End Get

    Set
        myDrawingMode=value

        'Set BackColor and ForeColor based on DrawingMode
        SetColors()

        ' Raise property changed event for DrawingMode
        OnDrawingModeChanged(EventArgs.Empty)
    End Set

End Property
</Tab>

</Acme:TabControl><p>

<P><B>Note:</B> The property <b>Set</b> code includes a call to the
<B>OnDrawingModeChanged</B> method.  This method raises a property
change notification event.  It is important to raise the property change
notification event, since the Windows Forms Designer listens to this event. It
listens to this event so it can track when a property has changed.  Later
in the code, the control takes advantage of this event.</P>

<P>The call to the <B>SetColors</B> method simply sets the <b>BackColor</b> and
<b>ForeColor</b> of the control, based on the value of <B>DrawingMode</B>.  Add
the following code to the control.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
private void SetColors() {

    switch (drawingMode) {

       case DrawingMode.Happy:
           base.BackColor = Color.Yellow;
           base.ForeColor = Color.Green;
           break;

       case DrawingMode.Sad:
           base.BackColor = Color.LightSlateGray;
           base.ForeColor = Color.White;
           break;

      case DrawingMode.Angry:
          base.BackColor = Color.Red;
          base.ForeColor = Color.Teal;
          break;

       default:
           base.BackColor = Color.Black;
           base.ForeColor = Color.White;

   }

}
</Tab>

<Tab Name="VB">
Private Sub SetColors()

    Select Case myDrawingMode

       Case DrawingModeStyle.Happy
           MyBase.BackColor = Color.Yellow
           MyBase.ForeColor = Color.Green


       Case DrawingModeStyle.Sad
           MyBase.BackColor = Color.LightSlateGray
           MyBase.ForeColor = Color.White


      Case DrawingModeStyle.Angry
          MyBase.BackColor = Color.Red
          MyBase.ForeColor = Color.Teal


      Case Else
           MyBase.BackColor = Color.Black
           MyBase.ForeColor = Color.White

   End Select

End Sub
</Tab>

</Acme:TabControl><p>

<P>You can now use this information when the control paints its contents.
Add this code to the control class to override the <b>OnPaint</b> method
of <b>Control</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
protected override void OnPaint(PaintEventArgs e) {

    e.Graphics.FillRectangle(new SolidBrush(BackColor), ClientRectangle);

    Size textSize = (Size) e.Graphics.MeasureString(Text, Font);

    float xPos = (ClientRectangle.Width/2) - (textSize.Width/2);
    float yPos = (ClientRectangle.Height/2) - (textSize.Height/2);

    e.Graphics.DrawString(Text, Font, new SolidBrush(ForeColor), xPos, yPos);

}
</Tab>

<Tab Name="VB">
Overrides Protected Sub OnPaint(e As PaintEventArgs)

    e.Graphics.FillRectangle(new SolidBrush(BackColor), ClientRectangle)

    Dim textSize As SizeF = e.Graphics.MeasureString(Me.Text, Font)

    Dim xPos As Single = CSng((ClientRectangle.Width/2) - (textSize.Width/2))
    Dim yPos As Single = CSng((ClientRectangle.Height/2) - (textSize.Height/2))

    e.Graphics.DrawString(Me.Text, Font,new SolidBrush(ForeColor),xPos, yPos)

End Sub
</Tab>

</Acme:TabControl><p>

<P><B>Note:</B> In order to have the control automatically repaint when it
is resized, set the <b>ResizeRedraw</b> style bit when the
control is created.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public SimpleControl() :base() {

    drawingMode = DrawingMode.Happy;
    SetColors();
    SetStyle(ControlStyles.ResizeRedraw, true);
}
</Tab>

<Tab Name="VB">
Public Sub New()
    MyBase.New
    myDrawingMode = DrawingModeStyle.Happy
    SetColors
    SetStyle(ControlStyles.ResizeRedraw, True)
End Sub
</Tab>

</Acme:TabControl><p>


<span class="subhead">Adding an Event</span>

      <P>In this next step, you add a simple event that is raised when the <b>DrawingMode</b>
      property changes.
      There is already an event that is raised, the <b>PropertyChange</b> event, so why
      must you add your own event? The <b>PropertyChange</b> event is
      not exposed to control consumers by default, it is a hidden event that is used by
      the framework infrastructure.</P>
      <P>Typically, the first thing you do is declare an <b>EventHandler</b> and
      <b>EventArgs</b>
      class for your event. Because this example event is simple, you can use the standard
      <b>EventHandler</b> and <b>EventArgs</b> classes.</P>

      <P>After the <b>EventHandler</b> and <b>EventArgs</b> classes are declared, you need to declare
      the event and add a method to raise it.  The method that is used to raise
      the event is typically called <B>On&lt;EventName&gt;</B>.  This method is
      protected, because only developers deriving from the control need to
      directly raise the event.

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class SimpleControl : Control {

    private DrawingMode drawingMode ;
    private EventHandler onDrawingModeChanged;
    ....

    //DrawingModeChanged Event
    //In C#, Event declarations are very similar to property declarations
    public event EventHandler DrawingModeChanged {
        get {
            return onDrawingModeChanged;
        }
        set {
            onDrawingModeChanged = value;
        }
    }

    protected virtual void OnDrawingModeChanged(EventArgs e) {
        Invalidate();
        if (onDrawingModeChanged != null) onDrawingModeChanged.Invoke(this, e);
    }
    ....
}
</Tab>

<Tab Name="VB">
Public Class SimpleControl: Inherits Control

    Private myDrawingMode As DrawingModeStyle
    ....

    'Declare the DrawingModeChanged Event
    Public Event DrawingModeChanged(sender As Object, ev As EventArgs)

    Overridable Protected Sub OnDrawingModeChanged(e As EventArgs)
        Invalidate
        RaiseEvent DrawingModeChanged(Me, e)
    End Sub

    ....

End Class
</Tab>

</Acme:TabControl><p>

<P>After adding the event, you need to raise it.  You can go to the
<b>DrawingMode</b> property <b>Set</b> statement and add a call to
<B>OnDrawingModeChanged</B>. However, because this method already raises a
property change notification event, you can simply listen for that event to
be raised, rather than adding an event-handling method. You can override the
<b>OnPropertyChanged</b> method.</P>


<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
//Override OnPropertyChanged to raise the DrawingModeChanged event
protected override void OnPropertyChanged(PropertyChangedEventArgs e) {
    base.OnPropertyChanged(e);
    string d = e.PropertyName;

    if (d.Equals("DrawingMode")) {
        OnDrawingModeChanged(EventArgs.Empty);
    }

}
</Tab>

<Tab Name="VB">
....
' Override OnPropertyChanged to raise the DrawingModeChanged event
Overrides Protected Sub OnPropertyChanged(e As PropertyChangedEventArgs)
    MyBase.OnPropertyChanged(e)
    Dim d As string = e.PropertyName

    If (d.Equals("DrawingMode")) Then
        OnDrawingModeChanged(EventArgs.Empty)
    End If

End Sub
</Tab>

</Acme:TabControl><p>

<P>Every time the property is changed, the control will redraw and raise
the <b>DrawingModeChanged</b> event.

<span class="subhead">Using the Control</span>

<P>Now that you have written your control and added some behavior to it, you can
compile it into a DLL and use it in an application.  The new control
can be used in the same manner as any other Windows Forms control.  The following example
demonstrates how to use the control in an application.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....

//Create the control and set its properties
simpleControl1 = new SimpleControl();
simpleControl1.Size = new System.Drawing.Size(304, 328);
simpleControl1.TabIndex = 0;
simpleControl1.Anchor = System.Windows.Forms.AnchorStyles.All;
simpleControl1.Text = "Windows Forms Mood Control";

//Add an event handling method for the DrawingModeChanged event
simpleControl1.DrawingModeChanged += new System.EventHandler(simpleControl1_DrawingModeChanged);

....

private void simpleControl1_DrawingModeChanged(object sender, System.EventArgs e) {
    MessageBox.Show("DrawingMode changed");
}
</Tab>

<Tab Name="VB">
....

' Create the control and set its properties
simpleControl1 = New SimpleControl()
simpleControl1.Size = new System.Drawing.Size(304, 328)
simpleControl1.TabIndex = 0
simpleControl1.Anchor = System.Windows.Forms.AnchorStyles.All
simpleControl1.Text = "Windows Forms Mood Control"

' Add an event handling method for the DrawingModeChanged event</span>
AddHandler simpleControl1.DrawingModeChanged, AddressOf simpleControl1_DrawingModeChanged

....

Private Sub simpleControl1_DrawingModeChanged(sender As object, e As System.EventArgs)
    MessageBox.Show("DrawingMode changed")
End Sub
</Tab>

</Acme:TabControl><p>


<span class="subhead">Adding Design-Time Information for the Control</span>

<P>Now that you have a working control, you can augment it with design-time
information that improves the usability of the control in the Forms
Designer.  Design-time information is recorded using
metadata on the control binary.  This metadata is defined using a
series of attribute classes from the <B>System.ComponentModel</B>
namespace.  For example, the default event for your control is the <b>
DrawingModeChanged</b> event.  When the user double-clicks the control,
you want the Forms Designer to add an event-handling method for the default
event.  You have to register the default event using the <B>DefaultEvent</B> class
attribute.  Similarly, you can define the default property on a control
using the <B>DefaultProperty</B> class attribute.  This attribute
determines which property is given focus in the Properties window by
default.  Class attributes are declared as part of the class declaration.
The following example demonstrates class attributes.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[
DefaultProperty("DrawingMode"),
DefaultEvent("DrawingModeChanged"),
]
public class SimpleControl : Control {
    ...
}
</Tab>

<Tab Name="VB">
Public Class _
    &lt;DefaultProperty("DrawingMode"), DefaultEvent("DrawingModeChanged")&gt; _
    SimpleControl
        Inherits Control
    ...
End Class


</Tab>

</Acme:TabControl><p>

<P>The next step is to add more design-time information for the <b>
DrawingMode</b> property.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[
    Category("Appearance"),
    Description("Controls how the control paints"),
    DefaultValue(DrawingMode.Happy),
    Bindable(true),
]
public DrawingMode DrawingMode {

    get {
    return drawingMode;
  }

    set {
        drawingMode=value;

        //Set BackColor and ForeColor based on DrawingMode</span>
        SetColors();

        //Raise property changed event for DrawingMode</span>
        OnDrawingModeChanged(EventArgs.Empty);

    }

}
</Tab>

<Tab Name="VB">
'DrawingMode - controls how the control paints
Public Property _
&lt;Category("Appearance"), _
 Description("Controls how the control paints"), _
 DefaultValue(DrawingModeStyle.Happy), _
 Bindable(true)&gt; _
DrawingMode As DrawingModeStyle

    Get
        return myDrawingMode
    End Get

    Set
        myDrawingMode=value

        'Set BackColor and ForeColor based on DrawingMode
        SetColors

        'Raise property changed event for DrawingMode
        OnDrawingModeChanged(EventArgs.Empty)

    End Set

End Property
</Tab>

</Acme:TabControl><p>

<p>The attributes that you assign to the property are as follows:</p>
<UL>

<LI>The <b>Category</b> attribute determines the category for the
property.  This is used when the property is displayed in categorized view
in a Properties window.  </li>

<LI>The <b>Description</b> attribute sets the short description that is displayed
at the bottom of the Properties window when the property is selected.  </LI>

<LI>The <b>DefaultValue</b> attribute is used by the Forms Designer to determine
whether a property value must be persisted.  </LI>

<LI>The <b>Bindable</b> attribute is used to determine whether this property is
displayed in the default data-binding view.  </LI>
</UL>

<P>You now need to add design-time information for the <b>DrawingModeChanged</b>
event.

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[Description("Raised when the DrawingMode changes")]
public event EventHandler DrawingModeChanged {
    get {
        return onDrawingModeChanged;
    }
    set {
        onDrawingModeChanged = value;
    }
}
</Tab>

<Tab Name="VB">
Public Event _
    &lt;Description("Raised when the DrawingMode changes")&gt; _
DrawingModeChanged(sender As Object, ev As EventArgs)
</Tab>

</Acme:TabControl><p>

<P>In the last step, you need to hide two properties. Because the <b>
DrawingMode</b> determines what background and foreground colors are used
to draw the control, you don't want the user to be able to set the <b>
BackColor</b> and <b>ForeColor</b> properties.  You cannot remove the
properties because they are declared in the <b>Control</b> class.
However, you can hide them so that they do not show up in the property
browser by using the <B>Browsable</B> attribute.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
//Remove the BackColor property from the properties window</span>
[Browsable(false)]
public Color BackColor {
    override get {
      return base.BackColor;
    }

    override set {
      //No action
    }
}

//Remove the ForeColor property from the properties window</span>
[Browsable(false)]
public Color ForeColor  {
    override get {
      return base.ForeColor;
    }

    override set {
      ' No action
    }
}
</Tab>

<Tab Name="VB">
'Remove the BackColor property from the properties window
Overrides Public Property &lt;Browsable(false)&gt; BackColor As Color
    Get
        return MyBase.BackColor
    End Get

    Set
        'No Action
    End Set

End Property

'Remove the ForeColor property from the properties window
Overrides Public Property &lt;Browsable(false)&gt; ForeColor As Color
    Get
        return MyBase.ForeColor
    End Get

    Set
        'No Action
    End Set

End Property
</Tab>

</Acme:TabControl><p>

<span class="subhead">Examining the Design-Time Behavior of a Control</span>

<P>You can test the design-time behavior of this control by using the Visual
Studio.NET Windows Forms Designer and following the same procedure that
was used for the <b>HelloWorldControl</b> demonstrated previously in this topic.
Take note of the following:</P>
<UL>
  <LI>The Properties window automatically can edit the <b>
  DrawingMode</b> property. It has the capacity to use the enumeration we
    defined for our property.
  <LI>The Properties window displays descriptions for the <b>DrawingMode</b>
  property and the <b>DrawingModeChanged</b> event.
  <LI>The <b>ForeColor</b> and <b>BackColor</b> properties are not
    displayed in the Properties window.
  <LI>Double-clicking on the control creates an event-handling method for
  the <b>DrawingModeChanged</b> event.
  <LI>Changing the <b>DrawingMode</b> property causes the control to change
  immediately.
  <LI>Changing the <b>DrawingMode</b> property from <b>Happy</b> to
    <b>Sad</b> causes the
  property to be highlighted. This indicates that it has changed. Changing <b>
  DrawingMode</b> back to <b>Happy</b> causes the highlight to be removed. The
    Properties window uses the default value (<b>Happy</b>) to determine whether the
  property value changes. </LI></UL>
<P>View and run this sample. <BR><BR>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/SimpleControl/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/SimpleControl/SimpleControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# SimpleControl"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/SimpleControl/VB"
        ViewSource="/quickstart/winforms/Samples/WritingControls/SimpleControl/SimpleControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB SimpleControl"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<a name="Customising the properties window">
<span class="subhead">Adding Custom Editors to the Properties Window</span>

<P>In the previous sample, we added a property that uses an enumeration to
our control.  When we looked at this property at design time, the
Properties window recognized that the property used an enumeration
and automatically used an enumeration property editor.  If the
Properties window cannot recognize the type of the property,
the .Net Framework Class Model includes a mechanism that allows a control author
to create an editor for a property and register that editor as the editor
for that type.  Again, this is controlled by metadata and attributes.  The
following sample explains how add a custom property editor to a
control.</P>

<P>In this sample, you have a <B>FlashTrackBar</B> control that is
like the Windows <b>TrackBar</b> control, but it uses a GDI+
<b>LinearGradientBrush</b> to paint its contents.  The position of the
<b>FlashTrackBar</b> is determined by the <b>Value</b> property.  This property
has a custom property editor. The following code demonstrates the
property declaration.</p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[Category("Flash"),
    Editor(typeof(FlashTrackBarValueEditor), typeof(UITypeEditor)),
    DefaultValue(0)]
public int Value {
....
}
</Tab>

<Tab Name="VB">
Public Property &lt;Category("Flash"), _
     Editor(typeof(FlashTrackBarValueEditor), typeof(UITypeEditor)), _
     DefaultValue(0)&gt; _
Value As Integer
    ....
End Property
</Tab>

</Acme:TabControl><p>

<P>The <b>Editor</b> attribute informs the Windows Forms Designer that the property
browser should use the class <B>FlashTrackBarValueEditor</B> as the custom
property editor for this property.</P>

<P>The property editor is implemented using a <b>FlashTrackBar</b>.  The most
interesting methods in the <b>FlashTrackBarValueEditor</b> are the following.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public override UITypeEditorEditStyle GetEditStyle(ITypeDescriptorContext context) {
    if (context != null && context.Instance != null) {
        return UITypeEditorEditStyle.DropDown;
    }
    return base.GetEditStyle(context);
}
</Tab>

<Tab Name="VB">
Overrides OverLoads Public Function GetEditStyle(context As ITypeDescriptorContext) _
                                                     As UITypeEditorEditStyle
    if (Not(context Is Nothing) AND Not(context.Instance Is Nothing)) Then
        return UITypeEditorEditStyle.DropDown
    End If
    return MyBase.GetEditStyle(context)
End Function
</Tab>

</Acme:TabControl><p>

<P>This method informs the properties window that the editor uses a
drop-down style UI.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public override object EditValue(ITypeDescriptorContext context, IServiceObjectProvider provider,
                                               object value) {


    if (context != null && context.Instance != null && provider != null) {

        edSvc = (IWinFormsEditorService)provider.GetServiceObject(typeof(IWinFormsEditorService));

        if (edSvc != null) {
            FlashTrackBar trackBar = new FlashTrackBar();
            trackBar.ValueChanged += new EventHandler(this.ValueChanged);
            SetEditorProps((FlashTrackBar)context.Instance, trackBar);

            bool asInt = true;

            if (value is int) {
                trackBar.Value = (int)value;
            }
            else if (value is byte) {
                asInt = false;
                trackBar.Value = (byte)value;
            }

            edSvc.DropDownControl(trackBar);

            if (asInt) {
                value = trackBar.Value;
            }
            else {
                value = (byte)trackBar.Value;
            }

        }

    }

    return value;

}
</Tab>

<Tab Name="VB">
Overrides OverLoads Public Function EditValue(context As ITypeDescriptorContext, _
         provider As IServiceObjectProvider, value As object) As Object

    if (Not(context Is Nothing) AND Not(context.Instance Is Nothing) AND Not(provider Is Nothing)) Then

        edSvc = CType(provider.GetServiceObject(GetType(IWinFormsEditorService)),IWinFormsEditorService)

        if Not (edSvc Is Nothing) Then

            Dim trackBar As FlashTrackBar = new FlashTrackBar()
            AddHandler trackBar.ValueChanged, AddressOf Me.ValueChanged
            SetEditorProps(CType(context.Instance,FlashTrackBar), trackBar)

            Dim asInt As Boolean = true

            if (TypeOf value Is Integer) Then
                trackBar.Value = CInt(value)
            else if (TypeOf value Is System.Byte) Then
                asInt = false
                trackBar.Value = CType(value, Byte)
            End If

            edSvc.DropDownControl(trackBar)

            if (asInt) Then
                value = trackBar.Value

            else
                value = CType(trackBar.Value, Byte)
            End If

        End If

    End If

     return value

 End Function
</Tab>

</Acme:TabControl><p>

<p><b>EditValue</b> implements the editor UI.

<P><B>Note</B> <b>FlashTrackBar</b> also demonstrates the use of the
<B>ShouldPersist&lt;PropertyName&gt;</B> pattern.  The <b>DefaultValue</b>
attribute can only be used for simple types.  For complex types, such as
<b>Colors</b>, you use the <B>ShouldPersist&lt;PropertyName&gt;</B> pattern.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[Category("Flash")] public Color EndColor {

}

public bool ShouldPersistEndColor() {
    return !(endColor == Color.LimeGreen);
}
</Tab>

<Tab Name="VB">
 Public Property &lt;Category("Flash")&gt; EndColor As Color
     ....
 End Property

Public Function ShouldPersistEndColor() As Boolean
    return Not (myEndColor.Equals(Color.LimeGreen))
End Function
</Tab>

</Acme:TabControl><p>

<P>In the previous code, the <b>Color.LimeGreen</b> value is the default
value.  The designer calls the <b>ShouldPersist</b> method in order to determine
whether to save the value of the <b>EndColor</b> property.</P>

<P>View and run the following sample. <BR><BR>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/CustomUITypeEditor/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/CustomUITypeEditor/CustomUITypeEditor.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# CustomUITypeEditor"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/CustomUITypeEditor/VB"
        ViewSource="/quickstart/winforms/Samples/WritingControls/CustomUITypeEditor/CustomUITypeEditor.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB CustomUITypeEditor"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<P>Examine the behavior of this control in the Visual Studio .NET Windows Forms designer in order to
fully understand how the custom property editor works.</P>

<a name="Extender Providers">
<span class="subhead">Extender Providers</span>

<P>An extender provider is a component that provides properties to other
components.  For example, the <b>ToolTip</b> control is implemented as an extender
provider.  When you add a <b>ToolTip</b> control to a <b>Form</b>, all other controls on
the <b>Form</b> have a <b>ToolTip</b> property added to their properties list.</P>

<P>The following sample demonstrates how to build an extender provider by
creating the <b>HelpLabelControl</b>.  The following code shows the
implementation of the <b>CanExtend</b> method and the <b>HelpText</b> property.  The
<b>CanExtend</b> method is used by the designer to determine whether to extend
this property to a given control.  The <b>HelpLabelControl</b> extends the
<b>HelpText</b> property for use with the controls on a form.  The help text for
a control is displayed in a panel when the control has focus.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
bool IExtenderProvider.CanExtend(object target) {
    if (target is Control &&
        !(target is HelpLabel)) {

        return true;
    }
    return false;
}

[
DefaultValue(""),
ExtenderProperty(typeof(Control))
]
public string GetHelpText(Control control) {
    string text = (string)helpTexts[control];
    if (text == null) {
        text = string.Empty;
    }
    return text;
}
</Tab>

<Tab Name="VB">
Function CanExtend(Target As Object ) As Boolean Implements IExtenderProvider.CanExtend
    If TypeOf Target Is Control And Not TypeOf Target Is HelpLabel Then


        Return True
    End If
    Return False
End Function




Public Function _
  &lt;DefaultValue(""), ExtenderProperty(GetType(Control))&gt; _
  GetHelpText(Ctrl As Control) As String
    Dim text As String = CStr(helpTexts(Ctrl))
    If text Is Nothing Then
        text = String.Empty
    End If
    Return text
End Function
</Tab>

</Acme:TabControl><p>

<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/HelpLabelControl/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/HelpLabelControl/HelpLabelControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# HelpLabel"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

</Acme:LangSwitch><br><br>

<a name="User Controls">
<span class="subhead">User Controls</span>
<p>This sample demonstrates how to build a user control.</p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
CustomerControl1.Anchor=System.Windows.Forms.AnchorStyles.All;
CustomerControl1.AutoScrollMinSize = new System.Drawing.Size(0, 0);
CustomerControl1.Size = new System.Drawing.Size(400, 310);
CustomerControl1.TabIndex = 0;
</Tab>

<Tab Name="VB">
CustomerControl1.Anchor=System.Windows.Forms.AnchorStyles.All
CustomerControl1.AutoScrollMinSize = new System.Drawing.Size(0, 0)
CustomerControl1.Size = new System.Drawing.Size(400, 310)
CustomerControl1.TabIndex = 0
</Tab>

</Acme:TabControl><p>

<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/UserControl/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/UserControl/UserControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# UserControl"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/UserControl/VB"
        ViewSource="/quickstart/winforms/Samples/WritingControls/UserControl/UserControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB UserControl"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>

<a name="Licensing Controls">
<span class="subhead">Licensing Controls</span>

<P>The following sample demonstrates how to build a control that uses the
default licensing provider.  The <b>LicenseProvider</b> attribute is used to
indicate to the <b>LicenseManager</b> that the class is using the
<b>LicFileLicenseProvider</b>.  The constructor for the control calls
<b>LicenseManager.Validate</b> to validate that the license is present.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
[LicenseProviderAttribute(typeof(LicFileLicenseProvider))]
public class LicensedControl : Control {
    private License license = null;

    public LicensedControl () {
        license = LicenseManager.Validate(typeof(LicensedControl), this);
    }

    protected override void Dispose(bool disposing)
    {
       if (license != null) 
       {
            license.Dispose();
            license = null;
       }
       base.Dispose(disposing);
    }

    protected override void OnPaint(PaintEventArgs e) {
        //Paint the Text property on the control
        e.Graphics.DrawString(Text,
                              Font,
                              new SolidBrush(ForeColor),
                              ClientRectangle);
    }
}



</Tab>

<Tab Name="VB">
&lt;LicenseProviderAttribute(GetType(LicFileLicenseProvider))&gt; _
Public Class LicensedControl : Inherits Control
    Private license As License = Nothing

    Public Sub New()
        MyBase.New

        license = LicenseManager.Validate(GetType(LicensedControl), Me)
    End Sub

    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If Not (license Is Nothing) Then
            license.Dispose()
            license = Nothing
        End If

        MyBase.Dispose(disposing)
    End Sub

    Overrides Protected Sub OnPaint(e As PaintEventArgs)
        ' Paint the Text property on the control
         e.Graphics.DrawString(Me.Text, Font, New SolidBrush(ForeColor), _
                               ClientRectangle.x, ClientRectangle.y)
    End Sub
End Class ' LicensedControl
</Tab>

</Acme:TabControl><p>

<P><B>Note:</B> You must dispose of the license when your control is
disposed.</P>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/LicensedControl/CS"
        ViewSource="/quickstart/winforms/Samples/WritingControls/LicensedControl/LicensedControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# LicensedControl"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/WritingControls/LicensedControl/VB"
        ViewSource="/quickstart/winforms/Samples/WritingControls/LicensedControl/LicensedControl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB LicensedControl"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch><br><br>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
