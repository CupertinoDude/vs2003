<%@ Page language="c#" Codebehind="DataGrid7.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid7" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <form method="post" runat="server">
    
    <h3><font face="Verdana">Updating a Row of Data w/ Read-Only Column</font></h3>

    <span id="Message" EnableViewState="false" runat="server" /><p id=P1 runat="server"></p>

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
      AutoGenerateColumns="false"
    >

      <columns>
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
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
