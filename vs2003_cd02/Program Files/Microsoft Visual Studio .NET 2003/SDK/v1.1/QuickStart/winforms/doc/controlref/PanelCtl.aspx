<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Panel Control Sample</span>
<p>
Windows Forms <b>Panel</b> controls are used to provide an identifiable 
grouping for other controls. Typically, you use panels to subdivide a 
form by function.  The Panel control is similar to the GroupBox 
control; however, only the Panel control can have scroll bars, and only 
the GroupBox control displays a caption.
</p>
<p>There is not a dedicated <b>Panel</b> control sample, but the following 
samples demonstrate how to use the <b>Panel</b> control.</p>
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
<br><br>
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

<br><br>

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
        RunSample="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/ListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ListBox Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ListBoxCtl/ListBoxCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ListBox Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
