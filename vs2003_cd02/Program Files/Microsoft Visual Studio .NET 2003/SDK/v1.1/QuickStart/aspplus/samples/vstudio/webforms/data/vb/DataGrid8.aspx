<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid8.aspx.vb" Inherits="Data.Vb.DataGrid8"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid8" method="post" runat="server">
    
    <h3><font face="Verdana">Updating a Row of Data w/ Templated Column</font></h3>

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
      AutoGenerateColumns="false"
    >

      <columns>
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update"  ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>' ID=Label1/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_LName" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>' ID=Label2/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_FName" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="phone" SortExpression="phone">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>' ID=Label3/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_Phone" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="address" SortExpression="address">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>' ID=Label4/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_Address" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="city" SortExpression="city">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>' ID=Label5/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_City" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="state" SortExpression="state">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "state") %>' ID=Label6/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:DropDownList runat="server" SelectedIndex='<%# GetStateIndex(Container.DataItem("state")) %>' id="edit_State">
                  <asp:ListItem>CA</asp:ListItem>
                  <asp:ListItem>IN</asp:ListItem>
                  <asp:ListItem>KS</asp:ListItem>
                  <asp:ListItem>MD</asp:ListItem>
                  <asp:ListItem>MI</asp:ListItem>
                  <asp:ListItem>OR</asp:ListItem>
                  <asp:ListItem>TN</asp:ListItem>
                  <asp:ListItem>UT</asp:ListItem>
            </asp:DropDownList>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="zip" SortExpression="zip">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>' ID=Label7/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:TextBox runat="server" id="edit_Zip" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="contract" SortExpression="contract">
          <itemtemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "contract", "{0}") %>' ID=Label8/>
          </ItemTemplate>
          <edititemtemplate>
            <asp:CheckBox runat="server" id="edit_Contract" Checked='<%# DataBinder.Eval(Container.DataItem, "contract") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
      </Columns>

    </ASP:DataGrid>

    </form>

  </body>
 </html>
