<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Use Objects and Intrinsics</span>
<p>
This sample illustrates how to access ASP.NET intrinsics such as the <b>Session</b> and <b>Application</b> objects. It also shows how to turn off <b>Session</b> on a per-[WebMethod] basis.
</p>
<p>
The first method in the sample .asmx file, <B>UpdateHitCounter</B>, accesses the <b>Session</b> and adds 1 to the "HitCounter" value. It then returns this value as a String. The second method, <B>UpdateAppCounter</B> does the same thing, but with the <b>Application</b>. Notice the following:

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
[WebMethod(EnableSession=true)]
</Tab>

<Tab Name="VB">
&lt;WebMethod(EnableSession:=true)&gt;
</Tab>

<Tab Name="JScript">
&lt;WebMethodAttribute(true)&gt;
</Tab>

</Acme:TabControl><div class="code"><pre>
</pre></div>
<p>

Session state for XML Web services is disabled by default, and you have to use a special attribute property to enable <b>Sessions</b>. However, <b>Sessions</b> aren't needed for this object, since it only uses the <b>Application</b> object.
<p>

<table>
<tr>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/CS/SessionService1.asmx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1.src"
  Icon="/quickstart/aspplus/images/sessionservice_asmx.gif"
  Caption="C# SessionService.asmx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/VB/SessionService1.asmx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1.src"
  Icon="/quickstart/aspplus/images/sessionservice_asmx.gif"
  Caption="VB SessionService.asmx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/JS/SessionService1.asmx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1.src"
  Icon="/quickstart/aspplus/images/sessionservice_asmx.gif"
  Caption="JScript SessionService.asmx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/CS/SessionService1.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="C# SessionService.asmx?wsdl"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/VB/SessionService1.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="VB SessionService.asmx?wsdl"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/JS/SessionService1.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="JScript SessionService.asmx?wsdl"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr>
</table>

<p>
When the client proxy is accessed, it contains a cookie collection. This collection is used to accept and return the APSESSIONID cookie that ASP.NET uses to track Sessions. This is what allows this client to receive varying answers to the <b>Session</b> hit method.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/CS/SessionService1Client.aspx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1Client.src"
  Icon="/quickstart/aspplus/images/sessionservice_client.gif"
  Caption="C# SessionServiceClient.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/VB/SessionService1Client.aspx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1Client.src"
  Icon="/quickstart/aspplus/images/sessionservice_client.gif"
  Caption="VB SessionServiceClient.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/Intrinsics/JS/SessionService1Client.aspx"
  ViewSource="/quickstart/aspplus/samples/services/Intrinsics/SessionService1Client.src"
  Icon="/quickstart/aspplus/images/sessionservice_client.gif"
  Caption="JScript SessionServiceClient.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->