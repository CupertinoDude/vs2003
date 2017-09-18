<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/servicesheader.inc" -->

<h4>How Do I...Write a Simple Service Application?</h4>

<p>Microsoft Windows NT services enable you to create long running executable applications
that run in their own Windows sessions. These services can be automatically started when
the computer boots, can be paused and restarted, and typically do not show any user
interface. This makes services ideal for use on a server or whenever you need long-running
functionality that does not interfere with other users who are working on the same computer.
You can also run services in the security context of a specific user account that is
different from the logged-on user or the default computer account. For more information
about services and Windows sessions, see the &quot;About Services&quot; section in the
Platform SDK documentation in MSDN Online.</p>

<p>Using the .NET Framework, you can easily create services by creating an application that
is installed as a service. For example, suppose you want to monitor performance counter data
and react to threshold values. You could do this by writing an NT service and deploying it
to the computer that has the counters you want to monitor.</p>

<p>The following sample is a simple service application. You can install it using the .NET Framework SDK
Installation Utility. From a command prompt run:</p>

<div class="code"><pre>
&gt; InstallUtil.exe SimpleService.exe
</pre></div>

<p>After the installation is completed you can start the Hello World Service from the
Services Management Console. After the service starts you should see the service's event
log being filled with greetings from the sample service. You can use the Services
Management Console to pause, continue, start, and stop the service, and observe how such
operations affect the messages written to the event log. After you are done experimenting
with the sample, you can uninstall the service by running the following command from the
command window (you should stop the service before uninstalling it):</p>

<div class="code"><pre>
&gt; InstallUtil.exe /u SimpleService.exe
</pre></div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/CS"
        ViewSource="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/SimpleService.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# SimpleService.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/VB"
        ViewSource="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/SimpleService.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB SimpleService.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/CP"
        ViewSource="/quickstart/howto/samples/Services/ServiceApplication/SimpleService/SimpleService.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ SimpleService.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->