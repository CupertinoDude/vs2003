<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ContextMenu Control Sample</span>
<P>The following sample demonstrates the features of the <b>ContextMenu</b> control.</P>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Menus/CS"
        ViewSource="/quickstart/winforms/Samples/Menus/Menus.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Menus Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Menus/VB"
        ViewSource="/quickstart/winforms/Samples/Menus/Menus.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Menus Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
