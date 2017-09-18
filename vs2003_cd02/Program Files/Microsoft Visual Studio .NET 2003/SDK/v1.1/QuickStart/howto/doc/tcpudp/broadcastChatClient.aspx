<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a chat client with UDPClient?</h4>

<div class="indent" style="width:660">

<P>This sample illustrates using the <b>UDPClient</b> class to create a chat client.</P>

<P>This sample is a complete and fully functional chat client. It uses UDP to
send and receive chat messages with other users that are also using the client.
The program illustrates many important Microsoft .NET Framework concepts, 
but the most important
(for this example) is the use of the <B>UDPClient</B> class.</P>

<P>THe <b>UDPCLient</b> object is initialized with a constructor call that sets the
port that the object will listen on. The object then joins a Multicast group.
This code can be found in the <b>Initialize</b> function of the sample code.</P>

<P>Once initialized, the UDPClient listens for incoming messages with the
<B>Receive</B> function, which can be found in the <b>Listener</b> function of
the sample code. The <b>Receive</b> function returns an array of bytes,
containing the data sent. This data can be converted into a string with
the ASCII object <b>GetString</b> function.</P>

<P>Sending data is just as easy. The <b>UDPClient</b> includes a function called
<B>Send</B> which sends out a byte array to every class that is listening
on the Multicast group.</P>

<p>To run this sample, you will need two machines:
<ol>
<li>Machine A: Compile and run chat.exe</li>
<li>Machine B: Compile and run chat.exe</li>
<li>Machine A: Type text and it will appear on Machine B</li>
<li>Machine B: Type text and it will appear on Machine A</li>
</ol>
</p>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/CS/"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/Chat.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Chat.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/TCPUDP/VB"
        ViewSource="/quickstart/howto/samples/net/TCPUDP/Chat.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Chat.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
