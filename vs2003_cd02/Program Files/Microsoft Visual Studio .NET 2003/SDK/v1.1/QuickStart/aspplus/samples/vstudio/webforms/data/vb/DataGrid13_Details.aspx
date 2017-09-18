<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid13_Details.aspx.vb" Inherits="Data.Vb.DataGrid13_Details"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid13_Details" method="post" runat="server">
    
    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

    <h4><font face="Verdana">Details for Author </font><asp:label runat="server" id="AuthorId"/></h4>

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
