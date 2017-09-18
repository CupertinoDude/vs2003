<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Read from a performance counter?</h4>

Windows performance counters enable
your applications and components to publish, capture (read), and analyze the
performance data that applications, services, and drivers provide. You can use
this information to determine system bottlenecks and fine-tune system and
application performance. For example, you can use a performance counter to
track the number of orders processed per second or a system's processor
utilization. Using the common language runtime's <b>PerformanceCounter</b>
component, you can easily read performance data relevant to your
application, such as those mentioned above.

<p>
This sample illustrates how to read simple performance information from a
performance counter. It is a small console application that can be run from a
command prompt. The application takes three command line arguments. The first is
a performance object name (category). The second argument is the counter name.
The third argument is the counter instance name.

<p>
For example, in order to see the processor utilization on your machine run
the sample with the following command line arguments:

<div class="code"><pre>
&gt; PCRead.exe &quot;Processor&quot; &quot;% Processor Time&quot; &quot;_Total&quot;
</pre></div>

<p>
You will see the processor utilization data updated every half-second.

<p>
In its simplest form, reading a performance counter involves:

<ol>

<li>Creating a new instance of a <b>PerformanceCounter</b> component and pointing it to an appropriate
performance counter:


<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
String objectName = ... ;
String counterName = ... ;
String instanceName = ... ;

PerformanceCounter counter;
counter = new PerformanceCounter(objectName, counterName, instanceName);
</Tab>
<Tab Name="VB">
Dim objectName As String = ...
Dim counterName As String = ...
Dim instanceName As String = ...

Dim counter As PerformanceCounter
counter = New PerformanceCounter(objectName, counterName, instanceName)
</Tab>
<Tab Name="C++">
String* objectName = ... ;
String* counterName = ... ;
String* instanceName = ... ;

PerformanceCounter* counter;
counter = new PerformanceCounter(objectName, counterName, instanceName);

</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Reading the <b>NextValue</b> property of the counter:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
counter.NextValue();
</Tab>
<Tab Name="VB">
counter.NextValue()
</Tab>
<Tab Name="C++">
Counter->NextValue()
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

</ol>

<p>Remember that you have to read <b>NextValue</b> more than once to get a relevant data.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/CS"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/PCRead.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# PCRead.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/VB"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/PCRead.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB PCRead.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/CP"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCRead/PCRead.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ PCRead.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->