<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">DateTimePicker Control Sample</span>
<P>The following sample demonstrates the features of the <b>DateTimePicker</b> control.</P>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/DateTimePickerCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# DateTimePicker Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/DateTimePickerCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB DateTimePicker Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
