<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a DateTime client with TCPClient?</h4>

<div class="indent" style="width:660">

<p>This sample illustrates using the <b>TCPClient</b> class to create a DateTime program.</p>

<p>This application acts as a client for the standard Date and Time protocol.
This protocol works on port 13, and responds to any TCP connections to that
port with the current date and time.</p>

<p>The application firsts creates a <B>TCPClient</B> object with the default
constructor. Next, the hostname that was specified at the command line is
resolved into an IP address with the static class <B>DNS</B>. Next, the
<B>Connect</B> method is called and the TCPClient connects to the server on port 13.</p>

<p>
The <B>GetStream</B> method is next called and a <B>Stream</B> object is
returned that represents the data returned by the server. This data is read
from the <B>Stream</B> object with the <b>Read</b> method. The byte array that
the <b>Read</b> method returns is turned into a string and displayed.</p>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/CS/"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/dateTimeClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# DateTimeClient.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/VB"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/dateTimeClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB DateTimeClient.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
