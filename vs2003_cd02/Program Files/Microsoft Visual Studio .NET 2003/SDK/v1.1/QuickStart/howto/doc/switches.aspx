<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I...Use tracing switches and listeners?</h4>

Trace instrumentation allows developers and administrators
to monitor the health of applications running in real-life settings (as opposed to
running in a debugger). Sometimes using a debugger can hide bugs and
obscure some performance and threading problems. Tracing is a very important
monitoring and debugging tool for distributed, multitier applications. Such
applications often contain problems that you can only observe when the application is
under a heavy load, and in the inherent randomness of a real-life environment.

<p>This sample illustrates the basics of using the trace and
Boolean switches. A switch provides an efficient mechanism for
enabling and disabling code paths at runtime using external settings. After running it, take a look at the source code. You will see how easy it is to add simple tracing to your applications.  You can then go to the config file and
modify the settings of the switches and then run the sample again. You will
possibly get a completely different output.

<p>Set <code>value</code> property of the Boolean switch to one of the
following: 0 (false) or 1 (true)
<p>Set <code>value</code> property of the trace switch to one of the
following: 0 (off), 1 (error), 2 (warning), 3 (info), or 4 (verbose):

<div class="code"><pre>
&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;configuration&gt;
	&lt;system.diagnostics&gt;
		&lt;switches&gt;
			&lt;add name="ABooleanSwitch" value="1" /&gt;
			&lt;add name="ATraceSwitch" value="4" /&gt;
		&lt;/switches&gt;
	    &lt;trace autoflush="false" indentsize="4" /&gt;
    &lt;/system.diagnostics&gt;
&lt;/configuration>
</pre></div>

<p>For more information about switches, please refer to the SDK documentation.

<p>You have to compile your instrumented applications with
trace or debug compiler directives enabled. Otherwise, all calls to <b>Trace</b> or
<b>Debug</b> (respectively) are ignored during compilation.

<p>Before running the application, open a command line window
and run the Debug Monitor utility (DBMon.exe). You will be able to see all debug and trace messages coming
from any application running on your system.  

<p>Creating new event log sources requires administrative rights. Since this sample creates "SwitchesDemo" source, you need to run it under an administrative account.

<p>
<b>Note: </b> DBMon.exe is available from the Windows Platform SDK on the <a target="_blank" href="http://msdn.microsoft.com">Microsoft Developer Network</a> website.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Switches/CS"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Switches/Switches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Switches.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Switches/VB"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Switches/Switches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Switches.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Switches/CP"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Switches/Switches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Switches.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->