<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/setupheader.inc" -->

<h4>How Do I...Create System Resources During Installation?</h4>

<p>An application can consist not only of
traditional program files, but also of associated resources such as message
queues, event logs, and performance counters that must be created on the
deployment destination. You can configure your application to create these
resources when your application is installed and to remove them if your
application is uninstalled, by using installation
components.</p>

<p>This sample illustrates how to build an
application that will set up its own message queue and its own event log
during installation and delete those two system resources when the application
is uninstalled. To run the sample you need to have message queueing installed
on your machine. You can install message queueing from Start -> Settings ->
Control&nbsp;Panel -> Add/Remove&nbsp;Programs -> Add/Remove&nbsp;System&nbsp;Components.
</p>

<p>Run the following command line to install the system resources:</p>

<div class="code"><pre>
&gt; InstallUtil.exe Installers.exe
</pre></div>

<p>Now, you can verify in the message queuing
management console that an &quot;InstallersSample&quot; message queue was
installed, and that an &quot;InstallersSample&quot; event log source was set up in
the registry.</p>

<p>To uninstall the message queue and the event
log source, run the following command:</p>

<div class="code"><pre>
&gt;InstallUtil.exe /u Installers.exe
</pre></div>

<p>How does it work? The InstallUtil.exe will
search, using the Reflection mechanism, all assemblies passed as the command line
arguments for classes inheriting from <b>Installer</b> class and with
<b>RunInstallerAttribute</b> set to true. The Installers then handle the install and
uninstall actions.&nbsp;</p>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/Installers/CS"
        ViewSource="/quickstart/howto/samples/Services/Installers/Installers/Installers.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Installers.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/Installers/VB"
        ViewSource="/quickstart/howto/samples/Services/Installers/Installers/Installers.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Installers.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/Installers/CP"
        ViewSource="/quickstart/howto/samples/Services/Installers/Installers/Installers.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Installers.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
