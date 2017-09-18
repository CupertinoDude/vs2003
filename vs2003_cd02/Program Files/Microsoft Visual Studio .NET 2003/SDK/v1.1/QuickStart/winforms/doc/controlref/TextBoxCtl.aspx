<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">TextBox Control Sample</span>
<p>There is not a dedicated <b>TextBox</b> sample, but the following sample demonstrates how to
use the <b>TextBox</b> control.</p>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/SimpleBinding/CS"
        ViewSource="/quickstart/winforms/Samples/Data/SimpleBinding/SimpleBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Data binding"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/SimpleBinding/VB"
        ViewSource="/quickstart/winforms/Samples/Data/SimpleBinding/SimpleBinding.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Data binding"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
