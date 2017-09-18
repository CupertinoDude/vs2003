<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid12.aspx.vb" Inherits="Data.Vb.DataGrid12"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid12" method="post" runat="server">
	
	<h3><font face="Verdana">Sorting Data in a DataGrid Control w/ Bound Columns</font></h3>
	
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
		AutoGenerateColumns="false"
	>

		<columns>
		<asp:BoundColumn HeaderText="au_id" SortExpression="au_id" DataField="au_id" ItemStyle-Wrap="false"/>
		<asp:BoundColumn HeaderText="au_lname" SortExpression="au_lname" DataField="au_lname"/>
		<asp:BoundColumn HeaderText="au_fname" SortExpression="au_fname" DataField="au_fname"/>
		<asp:BoundColumn HeaderText="phone" SortExpression="phone" DataField="phone"/>
		<asp:BoundColumn HeaderText="address" SortExpression="address" DataField="address"/>
		<asp:BoundColumn HeaderText="city" SortExpression="city" DataField="city"/>
		<asp:BoundColumn HeaderText="state" SortExpression="state" DataField="state"/>
		<asp:BoundColumn HeaderText="zip" SortExpression="zip" DataField="zip"/>
		<asp:BoundColumn HeaderText="contract" SortExpression="contract" DataField="contract"/>
		</Columns>

	</ASP:DataGrid>

    </form>

  </body>
 </html>
