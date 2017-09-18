<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Label Control Sample</span>
<p>
Use the <b>Label</b> control to display text in a set location on the page. 
Unlike static text, you can customize the displayed text through the <b>Text</b> 
property.  There is not a dedicated <b>Label</b> sample, but the following 
sample demonstrates how to use the <b>Label</b> control.
</p>
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
