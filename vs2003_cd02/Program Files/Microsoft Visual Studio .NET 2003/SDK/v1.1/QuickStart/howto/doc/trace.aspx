<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/diagnosticsheader.inc" -->

<h4>How Do I... Work with tracing?</h4>

Trace instrumentation allows developers and administrators
to monitor the health of applications running in real-life settings (as opposed to
running in a debugger). Sometimes using a debugger can hide bugs and
obscure some performance and threading problems. Tracing is a very important
monitoring and debugging tool for distributed, multitier applications. Such
applications often contain problems that can only be observed when the application is
under a heavy load and the inherent randomness of a real-life environment.

<p>This sample illustrates the basics of using the <b>Trace</b> and
<b>Debug</b> classes. Run it and take a look at the source code. You will see
how easy it is to add simple tracing to your applications.

<p>You have to compile your instrumented applications with
trace or debug compiler directives enabled. Otherwise, all calls to <b>Trace</b> or
<b>Debug</b> (respectively) are ignored during compilation.

<p>Before running the application, open a command line window
and run the Debug Monitor utility (DbMon.exe). You will be able to see any debug and trace messages coming
from any application running on your system.

<p>
<b>Note: </b> DBMon.exe is available from the Windows Platform SDK on the <a target="_blank" href="http://msdn.microsoft.com">Microsoft Developer Network</a> website.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Trace/CS"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Trace/Trace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Trace.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Trace/VB"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Trace/Trace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Trace.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/Tracing/Trace/CP"
        ViewSource="/quickstart/howto/samples/Services/Tracing/Trace/Trace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Trace.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->