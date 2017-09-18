<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Using Windows Forms Controls in Internet Explorer</span>

<P>This topic describes how to successfully execute Windows Forms controls within Internet Explorer (IE). 
Windows Forms controls within IE are activated without a user prompt, require no registration, and utilize 
the common language runtime (CLR) code access security.</P>

<P>There are five steps in getting a Windows Forms control activated within Internet Explorer, and each is 
listed here and detailed below.

<UL>
  <LI>Create the Windows Forms control.</LI>
  <LI>Create an HTML document with an <b>object</b> tag.</LI>
  <LI>Create the virtual directory and set permissions.</LI>
  <LI>Run the control.</LI>
</UL>

<span class="subhead">Create the Windows Forms Control</span>

<P>Almost any Windows Forms control can be hosted in Internet Explorer, but for this example we will host the 
<b>SimpleControl</b> that is included in 
the <a target="_top" href="/QuickStart/winforms/default.aspx?url=/quickstart/winforms/doc/WinFormsCreatingControls.aspx">Creating Controls</a> 
section of this QuickStart tutorial.  The control must be installed to the global assembly cache or be present in 
the same virtual directory as the web page that contains it.</P>

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

<span class="subhead">Create an HTML document with an <b>object</b> Tag</span>

<P>The next step is to create an HTML document with an <b>object</b> tag that refers to the Windows Forms control. For 
this sample, some simple script and input tags will also be added to demonstrate programmatic access to the control.</P>

<div class="code"><pre>
&lt;object id="simpleControl1"

classid="http:SimpleControl.dll#Microsoft.Samples.WinForms.Cs.SimpleControl.SimpleControl"
height="300" width="300" VIEWASTEXT&gt;
	&lt;param name="Text" value="Simple Control"&gt;
&lt;/object&gt;

</pre></div>

<P>The <b>classid</b> has two interesting parts: the path to the control library, and the fully qualified name of the control, 
separated by the pound sign. If you are familiar with an ActiveX <b>object</b> tag, you will notice the lack 
of a <b>guid</b>. In the case of Windows Forms, the combination of the path and fully qualified class name serve as 
the unique identifier.</P>

<P><b>Param</b> tags may be used to set properties on controls.  In this case, the <b>name</b> attribute is the name of the 
property and the <b>value</b> attribute is the value of the property.</P>

<div class="code"><pre>
&lt;script&gt;

function ChangeText() {
	simpleControl1.Text = text1.value;
}

&lt;/script&gt;
…

&lt;input type="text" id="text1"&gt;
&lt;input type="button" value="Change Text" onclick="ChangeText()"&gt;

</pre></div>

<P>To gain programmatic access to your control, you can write script against it.  A button and text box on the 
page is used in conjunction with the simple JScript function <b>ChangeText</b> to set the <b>text</b> property of the 
control. The following is the complete HTML and script code for this example.</P>

<div class="code"><pre>
&lt;html&gt;

&lt;script language="JScript"&gt;

function ChangeText() {
	simpleControl1.Text = text1.value;
}

&lt;/script&gt;

&lt;body&gt;

&lt;p&gt;Simple Control
&lt;br&gt;
&lt;br&gt;
&lt;/body&gt;

&lt;object id="simpleControl1"

classid="http:SimpleControl.dll#Microsoft.Samples.WinForms.Cs.SimpleControl.SimpleControl"
height="300" width="300" VIEWASTEXT&gt;
	&lt;param name="Text" value="Simple Control"&gt;
&lt;/object&gt;

&lt;br&gt;
&lt;br&gt;

&lt;input type="text" id="text1"&gt;
&lt;input type="button" value="Change Text" onclick="ChangeText()"&gt;

&lt;/html&gt;
</pre></div>

<span class="subhead">Create the Virtual Directory and Set Permissions</span>

<P>The HTML page must reside in an IIS virtual directory on your web server, and have appropriate permissions.  In this 
example, the Windows Forms control resides in the same directory, but it can also be installed in the 
global assembly cache. Execution permissions on the virtual directory must be set to <b>scripts</b> -- the 
control will not be properly activated if the execution permissions are set to <b>scripts & executables</b>. For 
this sample, these steps have been performed for you.</P>

<span class="subhead">Run the Control</span>

<P>To run the control, just point Internet Explorer to the HTML page in your virtual directory. If the control is not 
activating correctly, it may be necessary to restart Internet Explorer.  To view and run this sample, click the icon 
below.</P>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/IeSourcing/CS/IESourcing.htm"
        ViewSource="/quickstart/winforms/Samples/IeSourcing/IESourcing.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="CS IE Sourcing"
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/IeSourcing/VB/IESourcing.htm"
        ViewSource="/quickstart/winforms/Samples/IeSourcing/IeSourcing.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB IE Sourcing"
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>

<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
