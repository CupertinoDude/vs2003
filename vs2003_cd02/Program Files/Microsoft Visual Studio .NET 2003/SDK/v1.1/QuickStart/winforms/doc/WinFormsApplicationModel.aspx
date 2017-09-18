<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">The Windows Forms Application Model</span>
<p>
The application programming model for Windows Forms is primarily comprised
of forms, controls, and their events.&nbsp; The following facets of the Windows
Forms application model are covered in this topic:</P>
<ul>
    <li><a href="#Forms">Forms</a>
    <li><a href="#Controls">Controls</a>
    <li><a href="#Events">Events</a>
    <li><a href="#Deterministic lifetime and Dispose">Deterministic lifetime and Dispose</a>
    <li><a href="#Sample">A Simple Sample Application</a>
</ul>


<a name="Forms">
<span class="subhead">Forms</span>

<P>In Windows Forms, the <b>Form</b> class is a representation of any window displayed
in your application.  You can use the <b>BorderStyle</b> property of the
<b>Form</b> class to create standard, tool, borderless, and floating windows.
You can also use the <b>Form</b> class to create modal windows, such as dialog
boxes.  A special kind of form, the <a ref=WinFormsMDI.aspx>MDI form</a>, can
be created by setting the <b>MDIContainer</b> property of the <b>Form</b> class.
An MDI form can contain other forms, called MDI child forms, within its
client area.  The <b>Form</b> class provides built in support for keyboard
handling (tab order) and scrolling of the contents of the form.</P>

<P>When designing the user interface for your application, you typically
create a class that derives from <b>Form</b>.  You can then add controls,
set properties, create event handlers, and add programming logic to
your form.</P>

<!--CONTROLS-->
<a name="Controls">
<span class="subhead">Controls</span>

<P>Each component that is added to a form, such as a <b>Button</b>, a
<b>TextBox</b>, or a <b>RadioButton</b>, is called a control.  Windows Forms
includes all of the controls commonly associated with Windows, as well as custom controls
like the Windows Forms <b>DataGrid</b>.</P>

<P>You typically interact with controls by setting properties to alter
their appearance and behavior.  For example,&nbsp; the following derived class
of <b>Form</b> adds a <b>Button</b> control to the form, and sets its <b>Size</b> and
<b>Location</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public class HelloWorldForm : System.Windows.Forms.Form {

    private Button button1 = new Button() ;
    private TextBox textBox1 = new TextBox();

    [STAThread]
    public static int Main(string[] args) {
        Application.Run(new HelloWorldForm());
        return 0;
    }

    public HelloWorldForm() {

        this.Text = "Hello Windows Forms World";
        this.AutoScaleBaseSize = new Size(5, 13);
        this.ClientSize = new Size(392, 117);

        this.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight));

        this.AcceptButton=button1;

        button1.Location = new Point(256, 64);
        button1.Size = new Size(120, 40);
        button1.TabIndex = 2;
        button1.Text = "Click Me!";

        button1.Click += new System.EventHandler(button1_Click);

        textBox1.Text = "Hello Windows Forms World";
        textBox1.TabIndex = 1;
        textBox1.Size = new Size(360, 20);
        textBox1.Location = new Point(16, 24);

        this.Controls.Add(button1);
        this.Controls.Add(textBox1);
    }
}
</Tab>

<Tab Name="VB">
Public Class HelloWorldForm
    Inherits Form

    Private components As Container
    Private WithEvents button1 as Button
    Private textBox1 As New TextBox

    &lt;STAThread()&gt; Shared Sub Main()
        System.Windows.Forms.Application.Run(New HelloWorldForm())
    End Sub

    Public Sub New()
        MyBase.New

        Me.Text = "Hello Windows Forms World"
        Me.AutoScaleBaseSize = new Size(5, 13)
        Me.ClientSize = new Size(392, 117)

        Me.MinimumSize = new Size(392, (117 + SystemInformation.CaptionHeight))

        button1 = new Button()
        button1.Location = new Point(56, 64)
        button1.Size = new Size(90, 40)
        button1.TabIndex = 2
        button1.Text = "Click Me!"

        textBox1.Text = "Hello Windows Forms World"
        textBox1.TabIndex = 1
        textBox1.Size = new Size(360, 20)
        textBox1.Location = new Point(16, 24)

        Me.AcceptButton=button1

        Me.Controls.Add(button1)
        Me.Controls.Add(textBox1)
    End Sub
End Class
</Tab>

</Acme:TabControl><p>

<span class="subhead">Control State is Modeless</span>

<P>Forms provide limited restrictions on when you can set
properties for controls. Controls do not have modes that prevent their
state from being updated. As soon as you have created a new instance of a control, you
can alter its state. For example, the following code provides two examples
that demonstrate valid ways of creating a <b>Button</b> control.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
Button button1 = new Button();
button1.Location = new Point(256, 64);
button1.Size = new Size(120, 40);
button1.TabIndex = 1;
button1.Text = "Click Me!";
this.Controls.Add(button1);
</Tab>

<Tab Name="VB">
Dim button1 As New Button
button1.Location = New Point(256, 64)
button1.Size = New Size(120, 40)
button1.TabIndex = 1
button1.Text = "Click Me!"
Me.Controls.Add(button1)
</Tab>

</Acme:TabControl><p>
<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">
Button button1 = new Button();
this.Controls.Add(button1);
button1.Location = new Point(256, 64);
button1.Size = new Size(120, 40);
button1.TabIndex = 1;
button1.Text = "Click Me!";
</Tab>

<Tab Name="VB">
Dim button1 As New Button
Me.Controls.Add(button1)
button1.Location = New Point(256, 64)
button1.Size = New Size(120, 40)
button1.TabIndex = 1
button1.Text = "Click Me!"
</Tab>

</Acme:TabControl><p>

<P>Windows Forms ensures that the code you create is valid. For
example,&nbsp; if you set a property that sets a Windows style bit for a
Windows control, which can be set only when the control is created, the Windows Forms
control discards the underlying Windows control and creates a new
control for you.  The only time that this capability is potentially
undesirable is if you bypass Windows Forms and directly access the underlying
HWND for the control.  You cannot keep a reference to the HWND because it may
be made invalid by a property set in your code.</P>


<!--EVENTS-->

<a name="Events">
<span class="subhead">Events</span>

<P>The Windows Forms programming model is event based.  When a control changes
state, such as when the user clicks a button, it raises an
event. In order to handle an event, your application registers an
event-handling method for that event.

<Acme:LangSwitch runat=server>

    <CsTemplate>

        In C# you use the <b>+=</b> operator to register your event-handling method.
        For example, the following code creates a button and registers an
        event-handling method for the <b>Click</b> event.

    </CsTemplate>

    <VbTemplate>

        In Visual Basic there are two ways to register an event handling method:

        <ul>

        <li>If you declare the control variable using the <b>WithEvents</b> keyword,
        you can use the <b>Handles</b> keyword on the declaration of a method to
        register it as the event-handling method.
        </li><br><br>

        <li>You can use <b>AddHandler</b> to register event handling methods
        at runtime.</li><br><br>


        </ul>

        The following code illustrates how to register an event-handling method.
        </VbTemplate>



</Acme:LangSwitch>

</P>

<Acme:TabControl runat="server">

<Tab Name="C#">
....
//Create the button
Button button1 = new Button() ;
button1.Location = new Point(256, 64);
button1.Size = new Size(120, 40);
button1.Text = "Click Me!";
this.Controls.Add(button1);

//Register the event handler
button1.Click += new System.EventHandler(button1_Click);
....

//The event handling method
private void button1_Click(object sender, EventArgs evArgs) {
    MessageBox.Show("Hello Windows Forms World!");
}
</Tab>

<Tab Name="VB">
....
'Declare the button using WithEvents so that the compiler registers the event handler
Private WithEvents button1 As Button
....

'The event handling method for button1 - registered using Handles
Private Sub OnButton1Click(sender As Object, ByVal evArgs As EventArgs) Handles button1.Click
    MessageBox.Show("Text is: '" + textBox1.Text + "'")
End Sub

'The event handling method for the new button -  registered using AddHandler
Private Sub clickNewbutton(sender As Object, evArgs As EventArgs)
    MessageBox.Show("Hello from the new Button")
End Sub
....

</Tab>

</Acme:TabControl>

<P>An event-handling method is called only for a specific event for a
specific control. This allows you to avoid having a single method in your
form that handles all events for all controls.  This feature also makes your
code easier to understand and maintain.  Furthermore, because the Windows Forms
event architecture is based on delegates, your event-handling
methods are type safe and can be declared as private.  This capability
allows your compiler to detect method signature mismatches at compile
time.  It also keeps the public interface of your <b>Form</b> class uncluttered
with public event-handling methods.  You can find more information about
delegates in the .NET Framework SDK documentation. </p>

<p><Acme:LangSwitch runat=server>

    <CsTemplate>

        In C# you use the <b>-=</b> operator to unregister your event-handling
        method.

    </CsTemplate>

    <VbTemplate>

        In Visual Basic you use <b>RemoveHandler</b> to unregister your event-handling
        method.

    </VbTemplate>

</Acme:LangSwitch></p>

<span class="subhead">Event Classes</span>

<P>Each event has two supporting classes:
<UL>
  <LI>The <b>EventHandler</b> delegate class that is used to register your
  event-handling method. The signature of the <b>EventHandler</b> dictates the
  signature of your event-handling method.</li><br><br>

  <LI>The <B>EventArgs</b> class that contains data about the raised event. </LI>

</UL>

<P>The signature for an <b>EventHandler</b> is that the first argument contains a
reference to the object that raised the event (the sender) and that&nbsp;
the second argument contains data about the event (an instance of an
<b>EventArgs</b>).  For example,&nbsp; the <b>Click</b> event on a <b>Button</b> uses the
the following event handler. </p>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
public delegate void EventHandler(object sender, EventArgs e);
</Tab>

<Tab Name="VB">
Public Delegate Sub EventHandler(sender As object, e As EventArgs)
</Tab>

</Acme:TabControl><p>
<br>
As a result, any event-handling method for the <b>Click</b> event must have the following signature.
<br><br>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
&lt;access&gt; void &lt;name&gt;(object sender, EventArgs evArgs)
</Tab>

<Tab Name="VB">
&lt;access&gt; Sub &lt;name&gt;(sender As object, e As EventArgs)
</Tab>

</Acme:TabControl><p>

<p>For strongly typed languages, a compile time error will occur if the
event-handling method's signature does not match the delegate
signature.</p>

<P>Many events use the generic <b>EventHandler</b> and <b>EventArgs</b> classes.
However, some events require additional information that is specific to the type
of raised event. For example, the mouse movement events include
information about the position of the mouse pointer or mouse buttons.  These events define their
own classes that must inherit from the <b>EventHandler</b> and <b>EventArgs</b> classes.  For
example,&nbsp; the <b>MouseDown</b> event uses the <b>
MouseEventHandler</b> and <b>MouseEventArgs</b> classes.

<span class="subhead">Event Naming Conventions</span>

<P>An event can be raised both before and after
specific kinds of state changes.  The event that is raised prior to a state change is
typically suffixed with "ing".  The event that is raised after a state
change is typically suffixed with "ed".  For example, the
<b>SessionEnding</b> event is raised prior to a state change, and the<b> SessionEnded</b>
event is raised after a state change. If a state
change causes only a single event to be raised, then that event typically
does not have a suffix.  For example, the <b> Click</b> event.</P>

<span class="subhead">Cancelable Events</span>

<P>Depending on the situation in your application, you may want to cancel
an event. Certain events can be cancelled. These events use the <b>
CancelEventHandler</b> and <b>CancelEventArgs</b> classes.  The
<b>CancelEventArgs</b> class contains a property called <B>Cancel</B>.  If this
property is set to <b> true</b>, when the event-handling method
returns, the event is cancelled.  Typically, only events that are
raised prior to a state change are cancellable.  Canceling the event
cancels the state change.  </p>

<span class="subhead">Handling Multiple Events with a Single Event Handling Method</span>

<P>If you wish to handle multiple events with a single event handler, you
can do this by registering the same method with multiple events.  Each
event must have the same signature.  When you use a single
event-handling method for multiple events, you can determine which control
raised&nbsp; an event from the <i>sender</i> parameter.  The following example
illustrates a single event-handling method that handles events from two
button controls.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
Button button1 = new Button() ;
Button button2 = new Button() ;
....
button1.Click += new System.EventHandler(button_Click);
button2.Click += new System.EventHandler(button_Click);
....

//The event handling method</span>
private void button_Click(object sender, EventArgs evArgs) {
    if (sender==button1) {
        MessageBox.Show("Button1 Pushed!");
    } else if (sender==button2) {
        MessageBox.Show("Button2 Pushed!");
    }
}
</Tab>

<Tab Name="VB">
....
Dim button1 As New Button
Dim button2 As New Button
....
AddHandler button1.Click, AddressOf button_Click
AddHandler button2.Click, AddressOf button_Click
....

'The event handling method
Private Sub button_Click(sender As Object, evArgs As EventArgs)
    If (sender = button1) Then
        MessageBox.Show("Button1 Pushed!")
    Else If (sender = button2) Then
        MessageBox.Show("Button2 Pushed!")
    End If
End Sub
</Tab>

</Acme:TabControl><p>

<span class="subhead">Creating Your Own Events</span>
<p>The <a href="WinFormsCreatingControls.aspx">Creating Controls</a> section of the Windows Forms
Quickstart describes how to define your own events.</p>

<br>
<a name="Deterministic lifetime and Dispose">
<span class="header">Deterministic Lifetime and Dispose</span>

<P>The .NET Framework class model provides the <b>Dispose</b> method in the
<b>Component</b> class.  The <b>Dispose</b> method is called when a&nbsp;
component is no longer required.  For example, Windows Forms calls the <b>Dispose</b>
method on a form, and all of the controls contained within that form, when the form is
closed.  You typically use <b>Dispose</b> to free large resources in a timely
manner and to remove references to other objects so that they can be reclaimed by
garbage collection.  It is also called to stop any executing program logic
associated with the form.  You should keep the code in your <b>Dispose</b> method
as simple and robust as possible. If the <b>Dispose</b> method fails,
large resources may not be released from memory.</P>

<a name="Sample">
<span class="subhead">Putting It All Together - A Simple Windows Forms Application</span>

<P>The following sample demonstrates the concepts mentioned previously.
It shows how to:
<UL>
<LI>Create and display a form as the main entry point of an application
<LI>Add controls to the form
<LI>Set properties on the controls
<LI>Register event-handling methods with controls
<LI>Get property values from a control
<LI>Display text in a message box
<LI>Add code to the <b>Dispose</b> method that is executed when the form is
closed
</UL>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/HelloWorldForm/CS"
        ViewSource="/quickstart/winforms/Samples/HelloWorldForm/HelloWorldForm.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Hello World"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/HelloWorldForm/VB"
        ViewSource="/quickstart/winforms/Samples/HelloWorldForm/HelloWorldForm.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Hello World"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->


