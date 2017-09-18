<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Create a Remote Object as a Singleton?</h4>

This example demonstrates how to modify the <a href="firstserver.aspx">Client/Server</a> example
by deploying the remote object as a
singleton.  The client starts two threads and calls the <b>CountMe</b> method on
the server on two different channels: TCP and HTTP.

Although this example is very
simple, it does illustrate a few important concepts.<p>

<ul>

<li>The <b>HelloServer</b> object is only activated once and its destructor is never called.<p>

<li>When you run the client, thread number two appears to outperform thread number one.  The second
thread is indeed faster than the first since thread one uses the HTTP channel that
transports data in XML using SOAP while TCP uses a binary transport.
While TCP clearly outperforms HTTP, the latter is more general and should be
used when communicating with unknown endpoints.<p>

<li>The server object is locked while the counter is incremented in the <b>CountMe</b> call.<p>

<li>Notice that the count returned by the server is not reset between different
invocations of the client.  This behavior demonstrates that the server does
preserve its state during its lifetime.<p>

<li>Each client thread makes a call to the server and then yields control to
its partner to ensure they both get a chance to run.<p>

<li>Each thread registers its own channel and connects to the server using
different URIs.  These are <b>"http://localhost:8086/SayHello"</b> for thread
one and <b>"tcp://localhost:8085/SayHello"</b> for thread two.<p>

<li>The client executable waits for both threads to finish before terminating.<p>

</ul>

<b>NOTE:</b> &nbsp;Do not specify a port number when registering the client channels.  The
framework uses the port number on the channels to determine if the
channel should listen or connect.  When the channel is registered with
a port number, the channel listens. If the port number is zero, it
attempts to connect to a remote channel at the specified URI.<p>


<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/singleton/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/singleton/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Singleton Sample"
  runat="server" />
</CsTemplate>
<VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/singleton/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/singleton/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Singleton Sample"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/singleton/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/singleton/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Singleton Sample"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>




<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

