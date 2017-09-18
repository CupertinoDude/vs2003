<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataServiceClient.aspx.vb" Inherits="DataService.Vb.DataServiceClient"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataServiceClient" method="post" runat="server">
  
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
