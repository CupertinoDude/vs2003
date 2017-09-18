<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Monitor an event log?</h4>

Event logging provides a standard, centralized way for you to have your applications
record important software and hardware events. Windows supplies a standard user
interface for viewing the logs (Event Log). Using the common language runtime's EventLog
component, you can easily connect to existing event logs on both local and
remote computers, and receive event notifications when a new entry is written to
the log.
<p>

This sample illustrates how to monitor an event log for new entries.
It is a small console application that can be run from a command prompt. The
application takes two command line arguments. The first argument is the name of
the log that you want to monitor. The second argument, which is optional, allows you to
specify the machine name of the server on which the log resides.
<p>

Try running the sample as follows:
<p>

<div class="code"><pre>
&gt; LogMonitor.exe Application
</pre></div>

<p>
Now run the LogWrite.exe sample and write a new entry to the application log. You
will see that the <b>LogMonitor</b> is being notified about the new entry being
written.
<p>

In its simplest form, monitoring an event log involves:

<ol>

<li>Creating a new instance of an <b>EventLog</b> component and pointing it to a appropriate event log:

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
String* log, machine
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

<li>Adding an event handler:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
aLog.EntryWritten += new EventLogEventHandler(OnEntryWritten);
</Tab>
<Tab Name="VB">
AddHandler aLog.EntryWritten, AddressOf OnEntryWritten
</Tab>
<Tab Name="C++">
aLog->EntryWritten += new EntryWrittenEventHandler(this, LogMonitor::OnEntryWritten);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Handling the event notification in your event handler:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
public static void OnEntryWritten(Object source, EventLogEvent e) {
    Console.WriteLine("Written: " + e.Entry.Message);
}
</Tab>
<Tab Name="VB">
Sub OnEntryWritten(ByVal source As Object, ByVal e As EventLogEvent)
    Console.WriteLine("Written: " + e.Entry.Message)
End Sub
</Tab>
<Tab Name="C++">
void OnEntryWritten(Object* source, EntryWrittenEventArgs* e) 
{
    Console::WriteLine(String::Concat(S"Written: ", e->Entry->Message));
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
        RunSample="/quickstart/howto/samples/Services/EventLog/LogMonitor/CS"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogMonitor/LogMonitor.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# LogMonitor.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/EventLog/LogMonitor/VB"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogMonitor/LogMonitor.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB LogMonitor.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/EventLog/LogMonitor/CP"
        ViewSource="/quickstart/howto/samples/Services/EventLog/LogMonitor/LogMonitor.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ LogMonitor.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->