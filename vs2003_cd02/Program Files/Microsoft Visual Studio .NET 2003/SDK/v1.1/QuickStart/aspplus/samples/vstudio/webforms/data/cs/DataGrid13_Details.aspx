<%@ Page language="c#" Codebehind="DataGrid13_Details.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid13_Details" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
    
    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

    <h4><font face="Verdana">Details for Author </font><asp:Label runat="server" id="AuthorId"/></h4>

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
    />

    </form>
	
  </body>
 </html>
