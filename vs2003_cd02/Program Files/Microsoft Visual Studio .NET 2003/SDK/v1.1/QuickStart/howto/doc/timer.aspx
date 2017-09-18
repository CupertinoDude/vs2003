<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/timersheader.inc" -->

<h4>How Do I...Get timer events without message pump?</h4>

<b>Timer</b> allows you to raise an event on a specified interval.
This sample illustrates how to use a <b>Timer</b> to raise an event every 1000 milliseconds.
Run the sample and observe a new &quot;Hello World&quot; message being printed every second.

In its simplest form, using a <b>Timer</b> involves:

<ol>
<li>Creating a new instance of <b>Timer</b>:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
System.Timers.Timer aTimer = new System.Timers.Timer();
</Tab>
<Tab Name="VB">
Dim aTimer As System.Timers.Timer = New System.Timers.Timer()
</Tab>
<Tab Name="C++">
System::Timers::Timer *aTimer = new System::Timers::Timer();
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>


<li>Specifying the event handler:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
aTimer.Tick += new EventHandler(OnTimer);
</Tab>
<Tab Name="VB">
AddHandler aTimer.Tick, AddressOf OnTimer
</Tab>
<Tab Name="C++">
aTimer->Elapsed += new ElapsedEventHandler(this, OnTimer);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>


<li>Specifying how often to raise the event:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
aTimer.Interval = 1000;
</Tab>
<Tab Name="VB">
aTimer.Interval = 1000
</Tab>
<Tab Name="C++">
aTimer->Interval = 1000;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Enabling the component:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
aTimer.Enabled = true;
</Tab>
<Tab Name="VB">
aTimer.Enabled = True
</Tab>
<Tab Name="C++">
aTimer->Enabled = true;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Handling the event:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
public static void OnTimer(Object source, EventArgs e) {
    Console.WriteLine("Hello World!");
}
</Tab>
<Tab Name="VB">
Public Shared Sub OnTimer(ByVal source As Object, ByVal e As EventArgs)
    Console.WriteLine("Hello World!")
End Sub
</Tab>
<Tab Name="C++">
void OnTimer(Object* source, ElapsedEventArgs* e)
{
    Console::WriteLine(S"Hello World!");
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
        RunSample="/quickstart/howto/samples/Services/Timers/Timer/CS"
        ViewSource="/quickstart/howto/samples/Services/Timers/Timer/Timer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Timer.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Timers/Timer/VB"
        ViewSource="/quickstart/howto/samples/Services/Timers/Timer/Timer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Timer.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Timers/Timer/CP"
        ViewSource="/quickstart/howto/samples/Services/Timers/Timer/Timer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Timer.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->