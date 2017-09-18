<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Write to a performance counter?</h4>

Windows performance counters allow
your applications and components to publish, capture, and analyze the
performance data that applications, services, and drivers provide. You can use
this information to determine system bottlenecks, and fine-tune system and
application performance. For example, you might use a performance counter to
track the number of orders processed per second or the number of users currently
connected to the system. Using the common language runtime's <b>PerformanceCounter</b>
component, you can easily create your own custom counters and publish
performance data relevant to your application, such as those mentioned above.

<p>
This sample illustrates publishing (writing) simple performance information to a custom
performance counter. It's a small console application that can be run from a
command prompt. The application takes three command line arguments. The first is
a performance object name (category). The second argument is the counter name.
The third argument is the counter instance name.

<p>
This example shows how to publish data about the total number of international
orders for milk. The object name and counter name are &quot;Orders&quot; and &quot;Milk Orders&quot;
respectively. To run the sample the object has to be installed first with the install switch, as follow:

<div class="code"><pre>
&gt; PCWrite  /inst
</pre></div>

<p>

After the object has been successfully installed, run the app with no switch, as follows:

<div class="code"><pre>
&gt; PCWrite
</pre></div>

Now, wait for the application to display Started and run the PerfMon.exe.
In PerfMon, click on the add toolbar button. A dialog will open.
Select the Orders performance object, Milk Orders
counter, and International instance. Click Add, close
the dialog, and observe that you can use the PCWrite sample to change the
published value by pressing + or -.

<p>
In its simplest form, writing to a custom performance counter involves:

<ol>

<li>Instantiating a PerformanceCounter component and pointing it to an appropriate
performance counter:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
String objectName = "Orders"; ;
String counterName = "Milk Orders" ;
String instanceName = "International" ;

PerformanceCounter counter;
counter = new PerformanceCounter(objectName, counterName, instanceName);
</Tab>
<Tab Name="VB">
Dim objectName As String = "Orders"
Dim counterName As String = "Milk Orders"
Dim instanceName As String = "International"

Dim counter As PerformanceCounter
counter = New PerformanceCounter(objectName, counterName, instanceName)
</Tab>
<Tab Name="C++">
String* objectName = "Orders" ;
String* counterName = "Milk Orders" ;
String* instanceName = "International" ;

PerformanceCounter* counter;
counter = new PerformanceCounter(objectName, counterName, instanceName);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Setting the RawValue property of the counter:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
counter.RawValue = 50;
</Tab>
<Tab Name="VB">
counter.RawValue = 50
</Tab>
<Tab Name="C++">
counter->RawValue = 50;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

</ol>

<p>
The &quot;Orders&quot; object that was created could be deleted with a delete switch, as follows:

<div class="code"><pre>
&gt; PCWrite /del
</pre></div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/CS"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/PCWrite.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# PCWrite.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/VB"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/PCWrite.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB PCWrite.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/CP"
        ViewSource="/quickstart/howto/samples/Services/PerformanceCounters/PCWrite/PCWrite.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ PCWrite.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->