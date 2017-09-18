<%@ Page language="c#" Codebehind="DataServiceClient.aspx.cs" AutoEventWireup="false" Inherits="DataService.Cs.DataServiceClient" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">

	  <h4>Using Data Access with XML Web services</h4>

      <input type="submit" value="Remove three rows from the  DataSet" runat="server" ID=Submit1 NAME=Submit1/>
      <p></p>
      <span id="Message" runat="server"></span>

      <p>

      <ASP:DataGrid id="Authors_DataGrid" runat="server"
        Width="700"
        BackColor="#ccccff"
        BorderColor="black"
        ShowFooter="false"
        CellPadding=3
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        EnableViewState="false"
      />

     </form></P>
	
  </body>
 </html>
