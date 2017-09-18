<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>


<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">PictureBox control Sample</span>
<p>
The ScrollBar sample demonstrates the use of the ScrollBar and PictureBox controls. 
The ScrollBar control is used to change the position of a graphic in a PictureBox 
control's viewport. The sample also demonstrates how changing the LargeChange and 
SmallChange values affect scrolling behavior.
</p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/ScrollBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# ScrollBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/ScrollBarCtl/ScrollBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB ScrollBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
