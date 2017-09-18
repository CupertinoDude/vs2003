<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid6.aspx.vb" Inherits="Data.Vb.DataGrid6"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid6" method="post" runat="server">
    
    <h3><font face="Verdana">Updating a Row of Data</font></h3>

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
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false"/>
      </Columns>

    </ASP:DataGrid>

    </form>

  </body>
 </html>
