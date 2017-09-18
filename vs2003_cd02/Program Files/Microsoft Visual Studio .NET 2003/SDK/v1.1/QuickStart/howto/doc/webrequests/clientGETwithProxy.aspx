<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a GET request through a proxy?</h4>

<div class="indent">

<p>This sample illustrates how to use the <b>WebRequest</b> and <b>WebResponse</b> classes
to make a GET request on a URI through a proxy.</p>

<p>This sample is very similar to the clientGET sample. The difference
is in the creation and attachment of the proxy object. A <b>WebProxy</b>
is created and (in the constructor) set to the name and port of the proxy server.
This object's <b>BypassProxyOnLocal</b> property is set to true, which means to bypass the proxy
for local LAN servers. The final step is to set this proxy as the global proxy for
all requests with the line <b>GlobalProxySelection.Select = proxyObject;</b>.</p>

<p>The function <b>getPage</b> is where the specific details of making the request can be
found. The rest of the code in this sample is for taking command-line parameters
as well as displaying help usage for the parameters. This sample program is a
command-line utility that runs at the command prompt.</p>

<p>The <b>getPage</b> function takes a string parameter, which is the URL (or URI)
of the web page to request. This URI is then included as a parameter in a call to
<b>WebRequest.Create</b> which creates a <b>WebRequest</b> object.</p>

<p>The <b>GetResponse</b> function of the <b>WebRequest</b> object is then used to get a
<b>WebResponse</b> object. This object can be used to get the status code of the
response, as well as the actual response stream (a web page, for instance). </p>

<p>Writing out the stream can take several different forms. This example
reads a byte array (of 512 bytes) into the Byte[] variable <b>read</b> with the
<b>Read</b> function. It then writes out the 512 bytes with a Console.WriteLine
function: <b>Console.Write(System.Text.Encoding.ASCII.GetString(read, 0, bytes));</b>.</p>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/CS/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETwithProxy.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ClientGETwithProxy.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/VB"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETwithProxy.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ClientGETwithProxy.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
