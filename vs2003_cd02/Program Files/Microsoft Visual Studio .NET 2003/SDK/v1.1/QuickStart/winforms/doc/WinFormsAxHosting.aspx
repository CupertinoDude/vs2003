<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Hosting an ActiveX Control on a Windows Form</span>

<P>This topic demonstrates how to host the <b>WebBrowser</b> ActiveX
control in a form by building an MDI WebBrowser application.
</p>
<span class="subhead">Windows Forms and ActiveX Controls</span>

<p>Windows Forms can only host Windows Forms controls.  All Windows Forms controls are
classes that are derived from the <b>System.Windows.Forms.Control</b> class.
In order for an ActiveX control to be hosted on a form, it must appear like
a Windows Forms control.  Conversely, an ActiveX control must appear to be
hosted in an ActiveX control container.  The <b>
System.Windows.Forms.AxHost</b> class (which derives from
<b>System.Windows.Forms.Control</b>) acts as a Windows Forms control "on the
outside" and acts as an ActiveX control container "on the inside."  In order to
host an ActiveX control, you must create a wrapper class
that derives from <b>System.Windows.Forms.AxHost</b>.  This control hosts the
ActiveX control and exposes its properties, methods, and events (PMEs) as
PMEs of the generated conrtrol. <BR>

<br>
<img src=/quickstart/winforms/images/aximp.gif>
<br>

<P>All conversions are done for an entire ActiveX control type library at the
same time.  You cannot use Aximp.exe to generate type information for a
subset of the types defined within a single type library.  The output of
Aximp.exe is a set of binary files that contain the metadata and control
implementation for the types defined within the original type library.
The generated files are named according to the following pattern:

 <UL>
   <LI>common language runtime proxy for COM2 types: &lt;PROGID&gt;.dll
   <LI>Windows Forms proxy for ActiveX Controls: Ax&lt;PROGID&gt;.dll
</LI></UL>

<P>You can examine these files with tools such as Metainfo.exe or
Ildasm.exe.

<span class="subhead">Creating an ActiveX Control Wrapper</span>

<P>You create the ActiveX control wrapper using the Aximp.exe tool
included in the SDK.  The following is an example of how to call Aximp.exe.</p>

<div class="code"><pre>
aximp c:\winnt\system32\shdocvw.dll
</pre></div>
<br>

<span class="subhead">Using the Wrapper Control</span>

<P>Once you have created the control wrapper class you can use it in
the same way that you would any Windows Forms control.  The following example
demonstrates how to add a <b>WebBrowser</b> control to a <b>Form</b>.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
....
using AxSHDocVw;
....
AxWebBrowser1.BeginInit();
....
AxWebBrowser1.Location = new System.Drawing.Point(0, 24);
AxWebBrowser1.Size = new System.Drawing.Size(292, 273);
AxWebBrowser1.Dock = System.Windows.Forms.DockStyle.Fill;
AxWebBrowser1.TabIndex = 0;
....
this.Controls.Add(AxWebBrowser1);
....
AxWebBrowser1.EndInit();
....
</Tab>

<Tab Name="VB">
....
Imports AxSHDocVw
....
AxWebBrowser1.BeginInit()
....
AxWebBrowser1.Location = New System.Drawing.Point(0, 24)
AxWebBrowser1.Size = New System.Drawing.Size(650, 456)
AxWebBrowser1.Dock = System.Windows.Forms.DockStyle.Fill
AxWebBrowser1.TabIndex = 3
....
Me.Controls.Add(AxWebBrowser1)
....
AxWebBrowser1.EndInit()
....
</Tab>

</Acme:TabControl><p>

<P>Once you have finished writing the code for your form, you can build it
and pass in references to the wrapper DLL files.</P>

<p><Acme:TabControl runat="server">

<Tab Name="C#">
csc.exe /nologo /t:exe /debug+ /R:System.DLL /R:System.Windows.Forms.DLL
/R:System.Drawing.DLL /R:shdocvw.dll /R:AxShDocVw.DLL
/out:MDIBrowser.exe MainForm.cs Document.cs
</Tab>

<Tab Name="VB">
vbc.exe /nologo /t:exe /debug+ /R:System.DLL /R:System.Windows.Forms.DLL
/R:System.Drawing.DLL /R:shdocvw.dll /R:AxShDocVw.DLL
/out:MDIBrowser.exe MainForm.vb Document.vb
</Tab>

</Acme:TabControl><p>


<span class="subhead">Web Browser Control Sample</span>
<P>The following sample demonstrates how to host an ActiveX control. <BR><BR>
<P>To view and run this sample.</p>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/AxHosting/CS"
        ViewSource="/quickstart/winforms/Samples/AxHosting/AxHosting.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Browser Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/AxHosting/VB"
        ViewSource="/quickstart/winforms/Samples/AxHosting/AxHosting.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Browser Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>

<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
