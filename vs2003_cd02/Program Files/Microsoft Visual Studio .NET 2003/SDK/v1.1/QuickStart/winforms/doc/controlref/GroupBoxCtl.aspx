<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">GroupBox Control Sample</span>
<p>
The <b>GroupBox</b> control is used to provide an identifiable grouping 
for other controls. Typically, you use group boxes to subdivide a form 
by function. The sample below demonstrates the use of the control by
grouping all the DateTimePicker options in a 
group box to give the user a logical visual cue.  Also, at design time 
all the controls can be moved easily — when you move the single <b>GroupBox</b> 
control, all its contained controls move, too.
</p>
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
