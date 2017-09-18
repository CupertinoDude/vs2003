<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Print Preview Dialog Sample</span>
<p>The following sample demonstrates how to use the <b>PrintPreviewDialog</b>.</p>

<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example5/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/Example5/PrintingExample5.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Printing Example5"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/Example5/VB"
        ViewSource="/quickstart/winforms/Samples/Printing/Example5/PrintingExample5.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Printing Example5"
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
    <VbTemplate>
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
