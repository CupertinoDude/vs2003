<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid11.aspx.vb" Inherits="Data.Vb.DataGrid11"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid11" method="post" runat="server">
    
    <h3><font face="Verdana">Sorting Data in a DataGrid Control</font></h3>

	<ASP:DataGrid id="MyDataGrid" runat="server"
      Width="700"
      BackColor="#ccccff" 
      BorderColor="black"
      ShowFooter="false" 
      CellPadding=3 
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      AllowSorting="true" 
    />

    </form>

  </body>
 </html>