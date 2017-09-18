<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Button Control Sample</span>
<P>The following sample demonstrates the features of the <b>Button</b> control.</P>

<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ButtonCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ButtonCtl/ButtonCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Button Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ButtonCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ButtonCtl/ButtonCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Button Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
