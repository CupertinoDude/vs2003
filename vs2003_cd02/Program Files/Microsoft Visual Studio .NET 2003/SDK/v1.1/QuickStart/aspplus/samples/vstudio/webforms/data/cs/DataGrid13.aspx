<%@ Page language="c#" Codebehind="DataGrid13.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid13" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
    
    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

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
      DataKeyField="au_id"
    >

      <columns>
          <asp:HyperLinkColumn
            DataNavigateUrlField="au_id"
            DataNavigateUrlFormatString="datagrid13_details.aspx?id={0}"
            Text="Get Details"
          />
      </Columns>

    </ASP:DataGrid>

    </form>
	
  </body>
 </html>
