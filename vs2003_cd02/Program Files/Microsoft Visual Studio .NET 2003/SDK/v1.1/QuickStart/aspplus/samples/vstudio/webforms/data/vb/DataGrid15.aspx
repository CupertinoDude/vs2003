<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid15.aspx.vb" Inherits="Data.Vb.DataGrid15"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid15" method="post" runat="server">
	
	<h3><font face="Verdana">Parameterized Stored Proc Select to a DataGrid Control</font></h3>

	Select a Category: 

	<select id="SelectCategory" runat="server">
		<option selected>Beverages</option>
		<option>Condiments</option>
		<option>Confections</option>
		<option>Dairy Products</option>
		<option>Grains/Cereals</option>
		<option>Meat/Poultry</option>
		<option>Produce</option>
		<option>Seafood</option>
	</select>

	&nbsp;

	Select a Year: 

	<select id="SelectYear" runat="server">
		<option selected>1996</option>
		<option>1997</option>  
		<option>1998</option>  
	</select>

	&nbsp;

	<input type="submit" Value="Get Sales" runat="server" ID=Submit1 NAME=Submit1/><p>

	<ASP:DataGrid id="MyDataGrid" runat="server"
		Width="650"
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
