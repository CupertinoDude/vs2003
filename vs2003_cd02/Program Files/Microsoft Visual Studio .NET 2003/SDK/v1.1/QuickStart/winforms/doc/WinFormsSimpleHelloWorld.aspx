<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<!-- #include virtual="/quickstart/winforms/include/header.inc" -->

<span class="header">Writing a Hello World Form</span>

<P>Getting started with Windows Forms is very simple. The following
example displays a top level window (called a form) and sets the
caption bar text to "Hello World".</P>

<br>
<p><Acme:TabControl runat="server">

<Tab Name="C#">





namespace Microsoft.Samples.WinForms.Cs.SimpleHelloWorld {
    using System;
    using System.Windows.Forms;

    public class SimpleHelloWorld : Form {

        [STAThread]
        public static int Main(string[] args) {
            Application.Run(new SimpleHelloWorld());
            return 0;
        }

        public SimpleHelloWorld() {
            this.Text = "Hello World";
        }
    }
}
</Tab>

<Tab Name="VB">
Imports System
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms

Namespace Microsoft.Samples.WinForms.VB.SimpleHelloWorld

    Public Class SimpleHelloWorld
        Inherits System.Windows.Forms.Form

        'Run the application
        &lt;STAThread()&gt; Shared Sub Main()
            System.Windows.Forms.Application.Run(New SimpleHelloWorld())
        End Sub

        Public Sub New()
            MyBase.New()
            Me.Text = "Hello World"
        End Sub
    End Class

End Namespace
</Tab>

</Acme:TabControl><p>

<p>To view and run this sample:
<br><br>
<Acme:LangSwitch runat=server>

    <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/SimpleHelloWorld/CS"
        ViewSource="/quickstart/winforms/Samples/SimpleHelloWorld/SimpleHelloWorld.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="C# Simple Hello World"
        MapRunSamplePath=true
        runat="server" />
    </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/winforms/Samples/SimpleHelloWorld/VB"
        ViewSource="/quickstart/winforms/Samples/SimpleHelloWorld/SimpleHelloWorld.src"
        Icon = "/quickstart/winforms/images/wflink.jpg"
        Caption="VB Simple Hello World"
        MapRunSamplePath=true
        runat="server" />
    </VbTemplate>

</Acme:LangSwitch>


<!-- #include virtual="/quickstart/winforms/include/footer.inc" -->
