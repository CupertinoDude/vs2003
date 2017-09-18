<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a POST request?</h4>

<P>
This sample illustrates how to use the <b>WebRequest</b> and <b>WebResponse</b> classes to make a POST request on a URI.
</P>
<P>
This sample is similar to a simple <b>WebRequest</b> with a GET verb. The are two differences here:</p>
<p>
1) The verb needs to be changed to be
POST.</p>
<p> 2) the form information needs to be encoded and sent up the stream.
</P>
<P>
To change the verb, simple set the <B>Method</B> property to "POST".
</p><P>
You must then set the <B>ContentType</B> property to "application/x-www-form-urlencoded". At this point, make sure that the string
you supply is encoded correctly, and everything will be POSTed correctly.
</P>

<p>When your done with the response stream you must make sure to call the <b>Close</b>
method of the <b>WebResponse</b> object to avoid leaking valuable system resources.</b>

<h4>Example</h4>


<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/CS/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientPOST.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ClientPOST.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/VB/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientPOST.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ClientPOST.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
