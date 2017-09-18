<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Start and stop a process?</h4>

You can use the <b>Process</b> component to accomplish
most process management tasks quickly and easily. You can use this component to
work with processes on either local or remote computers. On a local computer,
you can, for example, start and stop a process.

<p>This
sample illustrates how to start and stop an executable. It is a small console application that can be run from a
command prompt. The application takes one command line argument. The argument is
a full path to the executable that you are starting. 

<p><b>Note</b>: This sample will only work on
processes which have a window, and wait for input. Using this sample on a process which does not meet
these criteria will cause an exception to be thrown.

<p>For example, if you want to start and then stop Notepad, run
the sample with the following command line argument:

<div class="code"><pre>
&gt; ProcessDemo.exe c:\winnt\notepad.exe
</pre></div>

<p>You will see Notepad started and then closed after approximately 1 second.

<p>In its simplest form, starting a process involves:

<ol>

<li>Creating a new instance of a <b>Process</b> component and initializing the path to an executable:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
Process process = new Process();
process.StartInfo.FileName = executableFilename;
</Tab>
<Tab Name="VB">
Dim process As New Process
process.StartInfo.FileName = executableFilename
</Tab>
<Tab Name="C++">
Process* process = new Process();
process->StartInfo->FileName = executableFilename;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Calling the <b>Start</b> method on the component instance:
<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
process.Start();
</Tab>
<Tab Name="VB">
process.Start()
</Tab>
<Tab Name="C++">
process->Start();
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

</ol>

<p>A call to <b>WaitForInputIdle</b> will make sure the application actually starts and is
ready for use.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/ProcessDemo/CS"
        ViewSource="/quickstart/howto/samples/Services/Process/ProcessDemo/processdemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ProcessDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/ProcessDemo/VB"
        ViewSource="/quickstart/howto/samples/Services/Process/ProcessDemo/processdemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ProcessDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/ProcessDemo/CP"
        ViewSource="/quickstart/howto/samples/Services/Process/ProcessDemo/processdemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ ProcessDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->