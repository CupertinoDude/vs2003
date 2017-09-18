<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Read from an event log?</h4>

Event logging provides a standard, centralized way for you
to have your applications record important software and hardware events. Windows
supplies a standard user interface for viewing the logs (Event Log).
Using the Microsoft .NET Framework's <b>EventLog</b> component, you can easily connect to existing event
logs on both local and remote computers, and read entries from these logs programmatically.
<p>

This sample illustrates how to enumerate entries in an event
log. It is a small console application that can be run from a command prompt.
The application takes two command line arguments. The first argument is the name
of the log that you want to enumerate. The second argument is optional and allows you to
specify the machine name of the server on which the log resides.
<p>

Try running the sample as follows:

<div class="code"><pre>
&gt; LogInfo.exe Application
</pre></div>

<p>
The sample will list all the entries from the application log. You can try the same
with the System, Security, and any other logs residing on your machine.

<p>
In its simplest form, writing to an event log involves:

<ol>

<li>Creating a new instance of an <b>EventLog</b> component and pointing it to an appropriate event log:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
String log, machine;
...
EventLog aLog = new EventLog();
aLog.Log = log;
aLog.MachineName = machine;
</Tab>
<Tab Name="VB">
Dim log, machine As String
...
Dim aLog As New EventLog
aLog.Log = log
aLog.MachineName = machine
</Tab>

<Tab Name="C++">
String* log, machine;
...
EventLog* aLog = new EventLog();
aLog->Log = log;
aLog->MachineName = machine;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Enumerating through the <b>Entries</b> collection of the <b>EventLog</b> instance:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
foreach (EventLogEntry entry in aLog.Entries) {
    Console.WriteLine(&quot;\tEntry: " + entry.Message);
}
</Tab>
<Tab Name="VB">
For Each entry In alog.Entries
    Console.WriteLine("    Entry: " + entry.Message)
Next entry
</Tab>

<Tab Name="C++">
for (int i = 0; i < entries->Count; i++)
{
    entry = entries->get_Item(i);
    Console::WriteLine(String::Concat(S"\tEntry: ", entry->Message));
}
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
        RunSample="/quickstart/howto/samples/Services/EventLog/LogInfo/CS"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogInfo/LogInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# LogInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/EventLog/LogInfo/VB"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogInfo/LogInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB LogInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/EventLog/LogInfo/CP"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogInfo/LogInfo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ LogInfo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->