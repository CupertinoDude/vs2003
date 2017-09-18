<%@ Page language="c#" Codebehind="DataGrid2.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid2" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
	
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

	<input type="submit" OnServerClick="GetAuthors_Click" Value="Get Authors" runat="server" ID=Submit1 NAME=Submit1/><p>

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
