<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Count rate of change?</h4>

Windows performance counters enable
your applications and components to publish, capture, and analyze the
performance data that applications, services, and drivers provide. You can use
this information to determine system bottlenecks and fine-tune system and
application performance. For example, you can use a performance counter to
track the number of orders processes per second or the number of users currently
connected to the system. Using the common language runtime's <b>PerformanceCounter</b>
component, you can easily create your own custom counters and publish
performance data relevant to your application, such as those mentioned above.

<p>
This sample illustrates how to publish the number of orders processed per second using a
custom performance counter. It's a small console application you can run
from the command prompt.

You have to run the app first to install the counter as follows:

<div class="code"><pre>
&gt; PCDemo.exe /inst
</pre></div>

Then you have to run the app again without any arguments to see it work as follows:

<div class="code"><pre>
&gt; PCDemo.exe
</pre></div>


<p>
Now, wait for the application to display "Started" and run the PerfMon.exe.
In PerfMon, choose the Add toolbar button. A dialog will open.
Select the ACounterDemo performance object, CountPerSecond
counter, and _Total instance. Choose Add, close the
dialog, and notice that you can use the PCDemo sample to change the published
value by pressing + or -. When the application starts,
it simulates the processing of two new orders per
second. The + and - keys can be used to double the number or divide it in two.

<p>
To delete the counter you could run the app with the delete switch as follows:

<div class="code"><pre>
&gt; PCDemo.exe /del
</pre></div>

<p>
In its simplest form, writing to a custom performance counter that counts number of
items per second involves:

<ol>

<li>Creating a counter of the <b>RateOfCountsPerSecond32</b> type:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
if(!PerformanceCounterCategory.Exists(objectName)) {
    CounterCreationData ccd = new CounterCreationData();
    ccd.CounterName = counterName;
    ccd.CounterType = PerformanceCounterType.RateOfCountsPerSecond32;
    CounterCreationDataCollection ccds = new CounterCreationDataCollection();
    ccds.Add(ccd);

    PerformanceCounterCategory.Create(objectName,"Sample Object",ccds);
}
</Tab>
<Tab Name="VB">
If Not PerformanceCounterCategory.Exists(objectName) Then
    Dim ccd As CounterCreationData = new CounterCreationData()
    ccd.CounterName = counterName
    ccd.CounterType = PerformanceCounterType.RateOfCountsPerSecond32
    Dim ccds As New CounterCreationDataCollection
    ccds.Add(ccd)

    PerformanceCounterCategory.Create(objectName,"Sample Object",ccds)
End If
</Tab>
<Tab Name="C++">
if(!PerformanceCounterCategory::Exists(objectName)) {
    CounterCreationData* ccd = new CounterCreationData();
    ccd->CounterName = counterName;
    ccd->CounterType = PerformanceCounterType::RateOfCountsPerSecond32;
    CounterCreationDataCollection* ccds = new CounterCreationDataCollection();
    ccds->Add(ccd);
}
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Creating a new instance of a <b>PerformanceCounter</b> component and pointing it to an appropriate performance
counter:

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
counter = new PerformanceCounter(objectName, counterName, instanceName, false);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>


<li>Setting the <b>RawValue</b> property of the counter:


<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
counter.IncrementBy(1);
</Tab>
<Tab Name="VB">
counter.IncrementBy(1)
</Tab>
<Tab Name="C++">
Counter->Increment();
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
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/CS"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/PCDemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# PCDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/VB"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/PCDemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB PCDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/CP"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCDemo/PCDemo.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ PCDemo.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->