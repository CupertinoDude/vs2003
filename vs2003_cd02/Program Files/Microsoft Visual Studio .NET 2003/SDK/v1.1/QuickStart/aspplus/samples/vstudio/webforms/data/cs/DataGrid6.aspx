<%@ Page language="c#" Codebehind="DataGrid6.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid6" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
    
    <h3><font face="Verdana">Updating a Row of Data</font></h3>

    <span id="Message" EnableViewState="false" runat="server" /><p id=P1 runat="server" />

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
      OnEditCommand="MyDataGrid_Edit"
      OnCancelCommand="MyDataGrid_Cancel"
      OnUpdateCommand="MyDataGrid_Update"
      DataKeyField="au_id"
    >

      <columns>
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false"/>
      </Columns>

    </ASP:DataGrid>

    </form>
  </body>
 </html>
