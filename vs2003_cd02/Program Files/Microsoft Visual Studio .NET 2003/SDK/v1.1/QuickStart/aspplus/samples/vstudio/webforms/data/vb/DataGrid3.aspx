<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid3.aspx.vb" Inherits="Data.Vb.DataGrid3"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid3" method="post" runat="server">
    
    <h3><font face="Verdana">Dynamic Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" DataTextField="State" runat="server"></select>

    <input type="submit" Value="Get Authors" runat="server" ID=Submit1 NAME=Submit1/><p></p>

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
      EnableViewState="false"
    />

    </form>

  </body>
 </html>
