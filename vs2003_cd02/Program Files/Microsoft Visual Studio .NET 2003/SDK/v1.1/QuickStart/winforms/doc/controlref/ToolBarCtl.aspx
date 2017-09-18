<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ToolBar Control Sample</span>
<p>This sample demonstrates the use of the <b>ToolBar</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/layout/docking/CS"
        ViewSource="/quickstart/winforms/Samples/layout/docking/docking.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Docking Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/layout/docking/VB"
        ViewSource="/quickstart/winforms/Samples/layout/docking/docking.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Docking Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
