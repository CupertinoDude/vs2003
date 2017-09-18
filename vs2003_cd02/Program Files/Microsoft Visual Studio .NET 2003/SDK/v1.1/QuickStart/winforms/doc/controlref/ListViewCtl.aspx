<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ListView Control Sample</span>
<p>A <b>ListView</b> control allows you to display a list of items with item text 
and, optionally, an icon to identify the type of item. 
There is not a dedicated <b>ListView</b> sample, but the following sample demonstrates how to
use the <b>ListView</b> control in the ChangeToolTips form.
</p>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/ToolTipCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ToolTipCtl Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ToolTipCtl/ToolTipCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ToolTipCtl Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
