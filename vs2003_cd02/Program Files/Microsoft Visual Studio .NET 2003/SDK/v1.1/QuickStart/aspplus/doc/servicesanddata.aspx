<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Use Data in XML Web services</span>
<p>
This sample shows how DataSets, a powerful new XML-based way to represent disconnected
data, can be returned from a <b>XML Web service</b> method. This is an extremely powerful use of
XML Web services, as DataSets can store complex information and relationships in an
intelligent structure.  By exposing DataSets through a service, you can limit the
database connections your data server is experiencing.
</p>
<p>
The method <B>GetTitleAuthors</B> connects to a database and issues two SQL statements: one that returns a list of authors,
and another that returns a list of book titles. It places both result sets into a single DataSet called ds, and returns this
DataSet.
<p>

The method <B>PutTitleAuthors</B> illustrates a <b>XML Web service</b> method that takes a DataSet as a parameter,  returning an integer that
represents the number of rows received in the "Authors" table of the DataSet.  Although the implementation of this method is
somewhat simplistic, this method could also intelligently merge the passed data with the database server.
<p>

<table>
<tr>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/CS/DataService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataService.src"
  Icon="/quickstart/aspplus/images/dataservice_asmx.gif"
  Caption="C# DataService.asmx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/VB/DataService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataService.src"
  Icon="/quickstart/aspplus/images/dataservice_asmx.gif"
  Caption="VB DataService.asmx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/JS/DataService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataService.src"
  Icon="/quickstart/aspplus/images/dataservice_asmx.gif"
  Caption="JScript DataService.asmx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/CS/DataService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="C# DataService.asmx?wsdl"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/VB/DataService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="VB DataService.asmx?wsdl"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/JS/DataService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="JScript DataService.asmx?wsdl"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr>
</table>

<p>
The client application for this XML Web service calls GetTitleAuthors and binds the Authors table to a DataGrid control, as you've seen in
previous examples.  To illustrate the <b>PutTitleAuthors</b> method, the client removes three rows of data from the DataSet before calling
this method, printing out the number of rows received by the service.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/CS/DataServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataServiceClient.src"
  Icon="/quickstart/aspplus/images/dataservice_client.gif"
  Caption="C# DataServiceClient.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/VB/DataServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataServiceClient.src"
  Icon="/quickstart/aspplus/images/dataservice_client.gif"
  Caption="VB DataServiceClient.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/DataService/JS/DataServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/DataService/DataServiceClient.src"
  Icon="/quickstart/aspplus/images/dataservice_client.gif"
  Caption="JScript DataServiceClient.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->