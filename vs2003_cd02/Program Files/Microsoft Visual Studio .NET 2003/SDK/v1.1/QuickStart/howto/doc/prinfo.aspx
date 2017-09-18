<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Get information about processes?</h4>

<p>Please note that this sample might fail on Windows 95 or Windows 98 machines.

<p>You can use the <b>Process</b> component to accomplish most process management
tasks quickly and easily. You can use this component to work with processes
on either local or remote computers. For example, you can query a process
for specific types of information, including the names of the modules it is
loaded into, the time it was started, the number of handles it is consuming,
and the set of its threads.

<p>This sample illustrates how to get a simple information about a process.
It is a small console application that you can run from a command prompt. Run
the sample without any command line arguments and it will print its full
usage instructions.

<p>For
example, if you want to enumerate all processes on your machine, run:

<div class="code"><pre>
&gt; PrInfo.exe e
</pre></div>

<p>If you want to
show the most common information about a process, run the sample with the
&quot;i&quot; option with a process id. Remember to substitute a
real process id for &quot;125&quot;.

<div class="code"><pre>
&gt; PrInfo.exe i 125
</pre></div>

<p>In its simplest form, getting information about a process involves:

<ol>

<li>Creating a new instance of a <b>Process</b> component and pointing it to a process running on your system:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
Process process = Process.GetProcessById(processid);
</Tab>
<Tab Name="VB">
Dim process As Process = Process.GetProcessById(processid)
</Tab>
<Tab Name="C++">
Process* process = Process::GetProcessById(processid);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Reading the desired property of the <b>Process</b> component:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
Console.WriteLine(&quot;Priority: " + process.PriorityClass.ToString());
</Tab>
<Tab Name="VB">
Console.WriteLine(&quot;Priority: " & process.PriorityClass.ToString())
</Tab>
<Tab Name="C++">
Console::WriteLine(String::Concat(&quotPriority: ", __box(process->PriorityClass)->ToString()));
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

</ol>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/PrInfo/CS"
        ViewSource="/quickstart/howto/samples/Services/Process/PrInfo/PrInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# PrInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/PrInfo/VB"
        ViewSource="/quickstart/howto/samples/Services/Process/PrInfo/PrInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB PrInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Process/PrInfo/CP"
        ViewSource="/quickstart/howto/samples/Services/Process/PrInfo/PrInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ PrInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->