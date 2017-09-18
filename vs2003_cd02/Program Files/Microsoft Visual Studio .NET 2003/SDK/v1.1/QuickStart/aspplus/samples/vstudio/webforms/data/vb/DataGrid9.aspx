<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid9.aspx.vb" Inherits="Data.Vb.DataGrid9"%>
<html>
    <head>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
        <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
    </head>
<body style="font: 10pt verdana">

  <form runat="server" ID="Form1">

    <h3><font face="Verdana">Updating a Row of Data w/ Validation</font></h3>

    <span id="Message" EnableViewState="false" style="font: arial 11pt;" runat="server"/><p>

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

      <Columns>
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" 
            UpdateText="Update"  ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" 
            ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>' ID="Label1" NAME="Label1"/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_LName" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
            <asp:RequiredFieldValidator id="au_lnameReqVal"
                ControlToValidate="edit_LName"
                Display="Dynamic"
                Font-Name="Verdana" Font-Size="12"
                runat=server>
                    &nbsp;*
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="au_lnameRegEx"
                ASPClass="RegularExpressionValidator" ControlToValidate="edit_LName"
                ValidationExpression="[\w\s-']+"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * names may contain only alphanumeric characters and limited punctuation <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>' ID="Label2" NAME="Label2"/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_FName" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
            <asp:RequiredFieldValidator id="au_fnameReqVal"
                ControlToValidate="edit_FName"
                Display="Dynamic"
                Font-Name="Verdana" Font-Size="12"
                runat=server>
                    &nbsp;*
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="au_fnameRegEx"
                ASPClass="RegularExpressionValidator" ControlToValidate="edit_FName"
                ValidationExpression="[\w\s-']+"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * names may contain only alphanumeric characters and limited punctuation <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="phone" SortExpression="phone">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>' ID="Label3" NAME="Label3"/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_Phone" 
                Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
            <asp:RequiredFieldValidator id="phoneReqVal"
                ControlToValidate="edit_Phone"
                Display="Dynamic"
                Font-Name="Verdana" Font-Size="12"
                runat=server>
                    &nbsp;*
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator id="phoneRegexVal"
                ControlToValidate="edit_Phone"
                ValidationExpression="[0-9]{3} [0-9]{3}-[0-9]{4}"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * Phone must be in form: XXX XXX-XXXX <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="address" SortExpression="address">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "address") %>' ID="Label4" NAME="Label4"/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Address" 
                Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
            <asp:RegularExpressionValidator id="au_addressRegEx"
                ASPClass="RegularExpressionValidator" ControlToValidate="edit_Address"
                ValidationExpression="[\w\s-()#\.]+"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * addresses may only contain alphanumeric values and limited punctuation <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="city" SortExpression="city">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "city") %>' ID="Label5" NAME="Label5"/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_City" 
                Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
            <asp:RegularExpressionValidator id="au_cityRegEx"
                ASPClass="RegularExpressionValidator" ControlToValidate="edit_City"
                ValidationExpression="[\w\s]+"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * city names may only contain alphanumeric values <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="state" SortExpression="state">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "state") %>' ID="Label6" NAME="Label6"/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:DropDownList runat="server" 
                SelectedIndex='<%# StateIndex(Container.DataItem("state")) %>' 
                id="edit_State">
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
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>' ID="Label7" NAME="Label7"/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Zip" 
                Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
            <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                ASPClass="RegularExpressionValidator" ControlToValidate="edit_Zip"
                ValidationExpression="[0-9]{5}"
                Display="Dynamic"
                Font-Name="Arial" Font-Size="11"
                runat=server>
                    * Zip Code must be 5 numeric digits <br>
            </asp:RegularExpressionValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="contract" SortExpression="contract">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "contract", "{0}") %>' ID="Label8" NAME="Label8"/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:CheckBox runat="server" id="edit_Contract"
                Checked='<%# DataBinder.Eval(Container.DataItem, "contract") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
