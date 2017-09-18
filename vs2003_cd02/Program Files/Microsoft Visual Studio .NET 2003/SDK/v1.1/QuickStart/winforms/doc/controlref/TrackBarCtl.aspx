<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">TrackBar Control Sample</span>
<p>This sample demonstrates some of the features of the <b>TrackBar</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TrackBarCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TrackBarCtl/TrackBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# TrackBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TrackBarCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TrackBarCtl/TrackBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB TrackBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
