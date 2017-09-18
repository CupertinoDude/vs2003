<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">LinkLabel Control Sample</span>
<p>This sample demonstrates some of the features of the <b>LinkLabel</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/LinkLabelCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# LinkLabel Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/LinkLabelCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB LinkLabel Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
