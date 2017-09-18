<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Print Dialog Sample</span>
<p>
<b>PageSetupDialog</b> modifies the <b>PageSettings</b> and 
<b>PrinterSettings</b> information for a given document. The 
user can enable sections of the dialog box to manipulate 
printing, margins, and paper orientation, size, and source 
and to show help and network buttons.  The following samples 
demonstrate how to use the <b>PageSetupDialog</b>.</p>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example4/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example4/PrintingExample4.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Example4"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example4/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example4/PrintingExample4.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Example4"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>

<br><br>

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
