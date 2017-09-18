<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">DataGrid Control Sample</span>
<P>The following samples demonstrate the features of the <b>DataGrid</b> control.</P>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Grid/CS"
        ViewSource="/quickstart/winforms/Samples/Data/Grid/Grid.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Grid binding"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>
    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Grid/VB"
        ViewSource="/quickstart/winforms/Samples/Data/Grid/Grid.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Grid binding"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>
<br><br>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/MasterDetails/CS"
        ViewSource="/quickstart/winforms/Samples/Data/MasterDetails/MasterDetails.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# MasterDetails"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/MasterDetails/VB"
        ViewSource="/quickstart/winforms/Samples/Data/MasterDetails/MasterDetails.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB MasterDetails"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
