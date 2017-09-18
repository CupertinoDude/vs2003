<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">CheckedListBox Control Sample</span>
<P>The following sample demonstrates the features of the <b>CheckedListBox</b> control.</P>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/CheckedListBoxCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/CheckedListBoxCtl/CheckedListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# CheckedListBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/CheckedListBoxCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/CheckedListBoxCtl/CheckedListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB CheckedListBox Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
