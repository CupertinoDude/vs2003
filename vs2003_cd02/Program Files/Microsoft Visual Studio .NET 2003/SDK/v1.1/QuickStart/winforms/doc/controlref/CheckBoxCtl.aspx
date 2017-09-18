<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">CheckBox Control Sample</span>
<P>The following sample demonstrates the features of the <b>CheckBox</b> control.</P>

<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Dockman/CS"
        ViewSource="/quickstart/winforms/Samples/Layout/Dockman/Dockman.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Dockman"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Layout/Dockman/VB"
        ViewSource="/quickstart/winforms/Samples/Layout/Dockman/Dockman.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Dockman"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
