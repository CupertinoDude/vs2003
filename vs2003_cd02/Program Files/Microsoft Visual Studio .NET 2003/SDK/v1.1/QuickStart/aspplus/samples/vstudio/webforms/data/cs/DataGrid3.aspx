<%@ Page language="c#" Codebehind="DataGrid3.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid3" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
    
    <h3><font face="Verdana">Dynamic Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" DataTextField="State" runat="server" />

    <input type="submit" OnServerClick="GetAuthors_Click" Value="Get Authors" ID=Submit1 NAME=Submit1 runat=server ><p>

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
