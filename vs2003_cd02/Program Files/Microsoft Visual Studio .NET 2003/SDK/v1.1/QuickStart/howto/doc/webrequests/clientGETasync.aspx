<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a GET request asynchronously?</h4>

<div class="indent" style="width:660">
<P>
This sample illustrates how to use the <b>WebRequest</b> and <b>WebResponse</b> classes to make a GET request on
a URI asynchronously.
</P>
<P>
This sample is similar to the other <b>WebRequest</b> samples, with the difference found in the <I>Begin</I>
and <I>End</i> async-style function calls. Put simply, instead of calling <B>GetResponse</B>, a call
is made to the function <B>BeginGetResponse</B>, with the callback function sent as a parameter.
</P>
<P>
This function <B>RespCallback</B>, takes an object of type <B>IASyncResult</B>. This object contains an
object <B>AsyncState</B> that can be cast as a <B>HttpWebRequest</B>. Calling this casted objects
<B>EndGetResponse</B> method will return a WebResponse object (which is cast as an HttpWebResponse
in this case.)
</P>
<P>
From here, this example is like the others. It pulls out the response from the stream and writes it
out to the console. However, this example is using the <b>StreamReader</b> and <b>StreamWriter</b> classes to do this.
</p>
</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/CS/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETasync.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ClientGETasync.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/VB"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientGETasync.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ClientGETasync.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
