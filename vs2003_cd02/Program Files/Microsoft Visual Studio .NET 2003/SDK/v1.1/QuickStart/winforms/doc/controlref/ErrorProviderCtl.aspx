<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">ErrorProvider Control Sample</span>
<P>
<b>ErrorProvider</b> presents a simple mechanism for indicating to the end user that 
a control on a form has an error associated with it. If an error description 
string is specified for the control, an icon appears next to the control.
</p>

<p>
Typically, you use ErrorProvider in association with data-bound controls. When 
using ErrorProvider with data-bound controls, you must specify the <b>ContainerControl</b>, 
either in the constructor or by setting the ContainerControl property.
In the following sample, it sets the ErrorProvider ContainerControl property in the
<b>InitializeComponent</b> method.
</P>
<Acme:LangSwitch runat=server>
    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Update/CS"
        ViewSource="/quickstart/winforms/Samples/Data/Update/Update.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Customer Details Form"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/Data/Update/VB"
        ViewSource="/quickstart/winforms/Samples/Data/Update/Update.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Customer Details Form"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>
</Acme:LangSwitch>



<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
