<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Timer Control Sample</span>
<p>
A <b>Timer</b> is used to raise an event at user-defined intervals. 
The StatusBar sample below demonstrates the use of a <b>Timer</b> control.<p>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/StatusBarCtl/CS"
        ViewSource="/quickstart/winforms/Samples/ControlReference/StatusBarCtl/StatusBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# StatusBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/ControlReference/StatusBarCtl/VB"
        ViewSource="/quickstart/winforms/Samples/ControlReference/StatusBarCtl/StatusBarCtl.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB StatusBar Control Sample"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
