<%@ Page language="c#" Codebehind="DataGrid1.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.Data1" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">

	<h3><font face="Verdana">Simple Select to a DataGrid Control</font></h3>

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
