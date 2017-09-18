
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<head>
<script language="JScript" runat="server">

    var myConnection : SqlConnection ;
    public var StateIndex : Hashtable;

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid();

        StateIndex = new Hashtable();
        StateIndex["CA"] = 0;
        StateIndex["IN"] = 1;
        StateIndex["KS"] = 2;
        StateIndex["MD"] = 3;
        StateIndex["MI"] = 4;
        StateIndex["OR"] = 5;
        StateIndex["TN"] = 6;
        StateIndex["UT"] = 7;
    }

    public function MyDataGrid_Edit(sender : Object, e : DataGridCommandEventArgs) : void
    {
        MyDataGrid.EditItemIndex = int(e.Item.ItemIndex);
        BindGrid();
    }

    public function MyDataGrid_Cancel(sender : Object, e : DataGridCommandEventArgs) : void
    {
        MyDataGrid.EditItemIndex = -1;
        BindGrid();
    }

    public function MyDataGrid_Update(sender : Object, E : DataGridCommandEventArgs) : void
    {
        if (Page.IsValid)
        {
            var updateCmd : String = "UPDATE Authors SET au_id = @Id, au_lname = @LName, au_fname = @FName, phone = @Phone, "
                + "address = @Address, city = @City, state = @State, zip = @Zip, contract = @Contract where au_id = @Id";

            var myCommand : SqlCommand = new SqlCommand(updateCmd, myConnection);

            myCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
            myCommand.Parameters.Add(new SqlParameter("@LName", SqlDbType.NVarChar, 40));
            myCommand.Parameters.Add(new SqlParameter("@FName", SqlDbType.NVarChar, 20));
            myCommand.Parameters.Add(new SqlParameter("@Phone", SqlDbType.NChar, 12));
            myCommand.Parameters.Add(new SqlParameter("@Address", SqlDbType.NVarChar, 40));
            myCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, 20));
            myCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NChar, 2));
            myCommand.Parameters.Add(new SqlParameter("@Zip", SqlDbType.NChar, 5));
            myCommand.Parameters.Add(new SqlParameter("@Contract", SqlDbType.NVarChar,1));

            myCommand.Parameters("@Id").Value = MyDataGrid.DataKeys[int(E.Item.ItemIndex)];

            var cols : String[] = ["LName","FName","Phone","Address","City","Zip"];

            var i : int;
            for (i=0; i<6; i++)
            {
                var colvalue : String = TextBox(E.Item.FindControl("edit_" + cols[i])).Text;
                myCommand.Parameters("@" + cols[i]).Value = colvalue;
            }

            myCommand.Parameters("@State").Value = DropDownList(E.Item.FindControl("edit_State")).SelectedItem.ToString();

            if (CheckBox(E.Item.FindControl("edit_Contract")).Checked = true)
                myCommand.Parameters("@Contract").Value = "1";
            else
                myCommand.Parameters("@Contract").Value = "0";

            myCommand.Connection.Open();

            try {
                myCommand.ExecuteNonQuery();
                Message.InnerHtml = "<b>Record Updated</b><br>" + updateCmd;
                MyDataGrid.EditItemIndex = -1;
            } catch (e : SqlException) {
                if (e.Number == 2627)
                    Message.InnerHtml = "ERROR: A record already exists with the same primary key";
                else
                    Message.InnerHtml = "ERROR: Could not update record, please ensure the fields are correctly filled out";
                Message.Style("color") = "red";
            } finally {
                myCommand.Connection.Close();
            }

            BindGrid();
        }
        else
        {
            Message.InnerHtml = "ERROR: Please check each field for error conditions.";
            Message.Style("color") = "red";
        }
    }

    public function BindGrid() : void
    {
        var myCommand : SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Authors");

        MyDataGrid.DataSource=ds.Tables("Authors").DefaultView;
        MyDataGrid.DataBind();
    }

</script>
</head>

<body style="font: 10pt verdana">

  <form runat="server">

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
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update"  ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
          <ItemTemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_LName" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
            <asp:RequiredFieldValidator id="au_lnameReqVal"
                ControlToValidate="edit_LName"
                Display="Dynamic"
                Font-Name="Verdana" Font-Size="12"
                runat=server>
                    &nbsp;*
            </asp:RequiredFieldValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
          <ItemTemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_FName" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
            <asp:RequiredFieldValidator id="au_fnameReqVal"
                ControlToValidate="edit_FName"
                Display="Dynamic"
                Font-Name="Verdana" Font-Size="12"
                runat=server>
                    &nbsp;*
            </asp:RequiredFieldValidator>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="phone" SortExpression="phone">
          <ItemTemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <nobr>
            <asp:TextBox runat="server" id="edit_Phone" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
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
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Address" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="city" SortExpression="city">
          <ItemTemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_City" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="state" SortExpression="state">
          <ItemTemplate>
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "state") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:DropDownList runat="server" SelectedIndex='<%# StateIndex[DataBinder.Eval(Container.DataItem, "state")] %>' id="edit_State">
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
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Zip" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
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
            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "contract", "{0}") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:CheckBox runat="server" id="edit_Contract" Checked='<%# DataBinder.Eval(Container.DataItem, "contract") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
