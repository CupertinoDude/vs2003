<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>


<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ScrollBar Control Sample</span>
<p>This sample demonstrates some of the features of the <b>ScrollBar</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/ScrollBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ScrollBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/ScrollBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ScrollBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
