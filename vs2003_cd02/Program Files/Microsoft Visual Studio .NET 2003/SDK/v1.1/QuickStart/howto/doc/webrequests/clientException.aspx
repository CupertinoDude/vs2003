<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Handle WebException?</h4>

<div class="indent" style="width:660">
This sample illustrates how to use the <b>WebException</b> and 
<b>URIFormatException</b> classes when dealing with exceptions 
when accessing URIs.
<BR>
<P>
This sample is like the simple clientGET sample, except that it wraps 
the call in a Try/Catch wrapper.
The most important section of code here (other than adding a try and 
catch to make sure we catch exceptions) is the catch section.
</P>
<P>
In this catch section, the object that is caught is of type
<B>WebException</B> or <B>URIFormatException</B>. Both exception 
objects have an exception message that can be
written out with the <B>ToString()</B> method. In addition, 
you can examine the
error code of the <B>WebException</B> with the call to its 
<B>Status</B> property. If this status is 7,
then you can get the <b>WebResponse</b> and see its status code, 
which will map to an
HTTP status code.
</p>

<p>
Run <b>ClientWebException.exe</b> and try these URLS:<br><br>
<code>htto://www.microsoft.com</code>
&nbsp;&nbsp;&nbsp;<i>(Bad URI, invalid protocol)</i><br>
<code>http://serverthatdoesntexist</code>
&nbsp;&nbsp;&nbsp;<i>(Name could not be resolved)</i><br>
<code>http://authserver/somauthtype</code>
&nbsp;&nbsp;&nbsp;<i>(server that requires authentication)</i><br>
<code>file://c:\</code>
&nbsp;&nbsp;&nbsp;<i>(Access is denied)</i><br>
</p>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/CS/"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientwebexception.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ClientWebException.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/WebRequests/VB"
        ViewSource="/quickstart/howto/samples/net/WebRequests/clientwebexception.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ClientWebException.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
