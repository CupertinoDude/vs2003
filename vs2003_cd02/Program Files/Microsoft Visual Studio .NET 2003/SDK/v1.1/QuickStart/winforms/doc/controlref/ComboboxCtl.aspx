<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ComboBox Control Sample</span>
<P>The following sample demonstrates the features of the <b>ComboBox</b> control.</P>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ComboBoxCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ComboBoxCtl/ComboBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ComboBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ComboBoxCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ComboBoxCtl/ComboBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ComboBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
