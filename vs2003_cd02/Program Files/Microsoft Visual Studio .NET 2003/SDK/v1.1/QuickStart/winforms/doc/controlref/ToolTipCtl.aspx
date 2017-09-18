<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ToolTip Control Sample</span>
<p>This sample demonstrates some of the features of the <b>ToolTip</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/ToolTipCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ToolTip Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/ToolTipCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ToolTip Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
