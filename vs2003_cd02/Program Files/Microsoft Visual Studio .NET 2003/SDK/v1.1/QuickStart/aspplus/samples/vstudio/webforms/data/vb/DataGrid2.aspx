<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid2.aspx.vb" Inherits="Data.Vb.DataGrid2"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid2" method="post" runat="server">
    <h3><font face="Verdana">Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" runat="server">
      <option selected>CA</option>
      <option>IN</option>  
      <option>KS</option>  
      <option>MD</option>  
      <option>MI</option>  
      <option>OR</option> 
      <option>TN</option>  
      <option>UT</option>  
    </select>

    <input type="submit" Value="Get Authors" runat="server" ID=Submit1 NAME=Submit1/><p>

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

    </form></P>

  </body>
 </html>
