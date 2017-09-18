<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a GET request with SSL?</h4>

<div class="indent" style="width:660">
<P>
This sample illustrates how to use the <b>WebRequest</b> and <b>WebResponse</b> classes to make a GET request on a URI with SSL.
</P>
<P>
There is no actual code difference between this example and the clientGET example. Basically, you can enter a URL with a http<B>s</B>:// instead of http:// and the <b>WebRequest</b> will work exactly the same.
</P>
<P>
The function <b>getPage</b> is where the specific details of making the request can be found. The rest of the code in this sample is for taking command-line parameters as well as displaying help usage for the parameters. This sample program is a command-line utility that runs at the command prompt.
</P>
<P>
The <B>getPage</B> function takes a string parameter, which is the URL (or URI) of the web page to request. This URI is then included as a parameter in a call to <B>WebRequest.Create</B> which creates a <B>WebRequest</B> object.
</P>
<P>
The <B>GetResponse</B> function of the <b>WebRequest</b> object is then used to get a <B>WebResponse</B> object. This object can be used to get the status code of the response, as well as the actual response stream (a web page, for instance).
</p>
<P>
Writing out the stream can take several different forms. This example reads a byte array (of 512 bytes) into the Byte[] variable <B>read</B> with the <B>Read</B> function. It then writes out the 512 bytes with a Console.WriteLine function: <b>Console.Write(System.Text.Encoding.ASCII.GetString(read, 0, bytes));</b>.
</P>
</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/CS/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETwithSSL.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ClientGETwithSSL.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/VB"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETwithSSL.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ClientGETwithSSL.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
