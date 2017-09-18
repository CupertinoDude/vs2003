<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Numeric UpDown and Domain UpDown Control Sample</span>
<p>This sample demonstrates features of the <b>NumericUpDown</b> control and features of the <b>DomainUpDown</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/UpDownCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/UpDownCtl/UpDownCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# UpDown Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/UpDownCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/UpDownCtl/UpDownCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB UpDown Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
