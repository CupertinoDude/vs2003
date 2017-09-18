<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ProgressBar Control Sample</span>
<p>This sample demonstrates some of the features of the <b>ProgressBar</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ProgressBarCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ProgressBarCtl/ProgressBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ProgressBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ProgressBarCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ProgressBarCtl/ProgressBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ProgressBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
