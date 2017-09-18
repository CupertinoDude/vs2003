<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">PropertyGrid Control Sample</span>
<p>The <b>PropertyGrid</b> control allows you to view and edit the properties of an object.
This control is used by the designers to display the properties of controls and
components at design time.</p>
<p>There is not a dedicated <b>PropertyGrid</b> sample. However, the following samples demonstrate how to
use the <b>PropertyGrid</b>.</p>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/LinkLabelCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# LinkLabel Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/LinkLabelCtl/LinkLabelCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB LinkLabel Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>
<br><br>
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
