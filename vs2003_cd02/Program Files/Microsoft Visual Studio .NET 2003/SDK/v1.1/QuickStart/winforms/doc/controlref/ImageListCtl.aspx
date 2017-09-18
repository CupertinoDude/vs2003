<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ImageList Control Sample</span>
<p>
The <b>ImageList</b> control is typically used by other controls, such as the 
ListView, TreeView, or ToolBar. You can add bitmaps, icons, or meta files to the 
ImageList, and the other controls are able to use the images as they require.
The sample below demonstrates two <b>ImageList</b> controls
used by the TreeView control.
</P>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/TreeViewCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# TreeView Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/TreeViewCtl/TreeViewCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB TreeView Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
