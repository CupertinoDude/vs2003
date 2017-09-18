<%@ Page language="c#" Codebehind="DataGrid11.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid11" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">

	<h3><font face="Verdana">Sorting Data in a DataGrid Control</font></h3>

    <ASP:DataGrid id="MyDataGrid" runat="server" OnSortCommand="MyDataGrid_Sort"
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
