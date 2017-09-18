<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a DateTime server with TCPListener?</h4>

<div class="indent" style="width:660">

<p>This sample illustrates how to use the <b>TCPListener</b> class to create a DateTime server program.</p>

<p>This application acts as a server for the standard Date and Time protocol. This protocol
works on port 13, and responds to any TCP connections to that port with the current date and time.</p>

<p>The application firsts creates a <b>TCPListener</b> object with the constructor that
specifies that the Listener should handle all incoming requests on port 13. Next, it goes
into a loop and continues to listen for incoming connections. The connections are then
accepted with the <b>Accept</b> method, and the socket returned is used to <b>Send</b>
the current date and time.</p>

<p>The <b>Receive</b> method could be called to get data from the client, but that method
is ignored, as the Date and Time protocol does not need any information that is sent from
the client, but automatically returns the information.</p>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/CS/"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/dateTimeServer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# DateTimeServer.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/VB"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/dateTimeServer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB DateTimeServer.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
