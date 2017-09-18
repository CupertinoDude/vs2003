<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/setupheader.inc" -->

<h4>How Do I...Execute Custom Code During Installation?</h4>

An application can consist not only of the
traditional program files, but also of associated resources such as message
queues, event logs, and performance counters that must be created on the
deployment destination. You can configure your application to create these
resources when the application is installed and to remove them if the
application is uninstalled, by using <span class="Italic">installation
components</span>. 

<p>This sample illustrates how to build an
application that will run custom code when installed or uninstalled.</p>

<p>Run the following command line to install
the system resources:</p>

<div class="code"><pre>
&gt; InstallUtil.exe CustomAction.exe
</pre></div>

<p>Note that the message &quot;Installing: Any code could be executed here!&quot;
is printed to the console. You can substitute the line that
prints the message (see CustomInstaller.cs file) for any custom code you want to
execute during installation.</p>

<p>You can execute different custom code while
uninstalling:</p>

<div class="code"><pre>
&gt; InstallUtil.exe /u CustomAction.exe
</pre></div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
       <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/CustomAction/CS"
        ViewSource="/quickstart/howto/samples/Services/Installers/CustomAction/CustomAction.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# CustomAction.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
       <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/CustomAction/VB"
        ViewSource="/quickstart/howto/samples/Services/Installers/CustomAction/CustomAction.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB CustomAction.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
       <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Installers/CustomAction/CP"
        ViewSource="/quickstart/howto/samples/Services/Installers/CustomAction/CustomAction.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ CustomAction.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

</div>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->