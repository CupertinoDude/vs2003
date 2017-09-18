<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">TreeView Control Sample</span>
<p>This sample demonstrates some of the features of the <b>TreeView</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/TreeViewCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# TreeView Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/TreeViewCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB TreeView Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
