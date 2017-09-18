<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">FontDialog Control Sample</span>
<p>
The DateTimePicker sample demonstrates the use of the <b>FontDialog</b> control. The FontDialog control is used to select the font properties of the main DateTimePicker display.</p>

<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/DateTimePickerCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# DateTimePicker Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/DateTimePickerCtl/DateTimePickerCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB DateTimePicker Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
