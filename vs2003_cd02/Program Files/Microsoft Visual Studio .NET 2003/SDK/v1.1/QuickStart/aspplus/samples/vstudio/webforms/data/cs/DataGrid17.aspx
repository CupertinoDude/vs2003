<%@ Page language="c#" Codebehind="DataGrid17.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid17" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
	
	<h3><font face="Verdana">XML Data for Table: <asp:PlaceHolder runat="server" id="MySpan"/></font></h3>

	<ASP:DataGrid id="MyDataGrid" runat="server"
	  Width="900"
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

    </form>
	
  </body>
 </html>
