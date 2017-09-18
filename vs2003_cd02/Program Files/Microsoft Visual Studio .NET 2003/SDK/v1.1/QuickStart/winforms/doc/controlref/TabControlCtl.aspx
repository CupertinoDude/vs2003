<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">TabControl Control Sample</span>
<p>This sample demonstrates some of the features of the <b>TabControl</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TabControlCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TabControlCtl/TabControlCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# TabControl Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TabControlCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TabControlCtl/TabControlCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB TabControl Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
