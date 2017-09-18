<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ListBox Control Sample</span>
<p>This sample demonstrates some of the features of the <b>ListBox</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/ListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ListBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/ListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ListBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
