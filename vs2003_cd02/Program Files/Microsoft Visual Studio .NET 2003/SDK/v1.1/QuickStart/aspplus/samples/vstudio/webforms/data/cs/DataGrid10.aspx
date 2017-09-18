<%@ Page language="c#" Codebehind="DataGrid10.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid10" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">

    <h3><font face="Verdana">Deleting a Row of Data</font></h3>

    <span id="Message" EnableViewState="false" runat="server"></span><p></p>

    <ASP:DataGrid id="MyDataGrid" runat="server"
      Width="800"
      BackColor="#ccccff"
      BorderColor="black"
      ShowFooter="false"
      CellPadding=3
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      DataKeyField="emp_id"
      OnDeleteCommand="MyDataGrid_Delete"
    >

      <columns>
         <asp:ButtonColumn Text="Delete Employee" CommandName="Delete"/>
      </Columns>

    </ASP:DataGrid>

    </form>
	
  </body>
 </html>
