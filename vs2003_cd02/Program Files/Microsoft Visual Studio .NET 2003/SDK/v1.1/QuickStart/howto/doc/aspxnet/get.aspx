<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/networkingheader.inc" -->

<h4>How Do I...Make a GET request from within ASP.NET?</h4>

<div class="indent" style="width:660">

<P>This sample illustrates how to use the <b>WebRequest</b> and <b>WebResponse</b> classes to make a
GET request on a URI from within a ASP.NET application.</P>

<P>This example is exactly the same as the command-line example showing a basic
GET request with the net classes. The only difference is that this example shows
that you can request another URI from within an .aspx page.</P>

</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/ASPXNet/CS/webrequest.aspx"
        ViewSource="/quickstart/howto/samples/net/ASPXNet/webrequest.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# WebRequest.aspx"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/net/ASPXNet/VB/webrequest.aspx"
        ViewSource="/quickstart/howto/samples/net/ASPXNet/webrequest.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB WebRequest.aspx"
        runat="server" />
  </VbTemplate>
</Acme:LangSwitch>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
