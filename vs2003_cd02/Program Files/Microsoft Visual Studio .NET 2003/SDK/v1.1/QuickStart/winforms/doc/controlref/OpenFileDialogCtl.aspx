<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Open File Dialog Sample</span>
<p>
The Windows Forms <b>OpenFileDialog</b> component is a pre-configured dialog box. 
It is the same Open File dialog box exposed by the Windows operating system. 
It inherits from the <b>CommonDialog</b> class. 
</p>
<p>
Use this component within your Windows application as a simple solution for 
file selection in lieu of configuring your own dialog box. By relying on standard 
Windows dialog boxes, you create applications whose basic functionality is 
immediately familiar to users. Be aware, however, that when using the 
<b>OpenFileDialog</b> component, you must write your own file-opening logic.
The following sample demonstrates the use of the <b>OpenFileDialog</b> component.
</p>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/SimplePad/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/SimplePad/SimplePad.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# SimplePad"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
