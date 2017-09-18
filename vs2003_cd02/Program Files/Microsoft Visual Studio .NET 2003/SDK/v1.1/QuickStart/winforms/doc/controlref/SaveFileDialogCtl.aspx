<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Save File Dialog Sample</span>
<p>There is not a dedicated <b>SaveFileDialog</b> sample. However, the following sample demonstrates how to
use the <b>SaveFileDialog</b>.</p>

<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Printing/SimplePad/CS"
        ViewSource="/quickstart/winforms/Samples/Printing/SimplePad/SimplePad.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# SimplePad"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
