<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Acme" %>

<html>

<script language="JScript" runat="server">

    var myConnection : SqlConnection;

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid();
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

    public function MyDataGrid_Update(sender : Object, e : DataGridCommandEventArgs) : void
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

        myCommand.Parameters("@Id").Value = MyDataGrid.DataKeys[int(e.Item.ItemIndex)];

        var cols : String[] = ["@Id","@LName","@FName","@Phone","@Address","@City","@State","@Zip","@Contract"];
        Message.InnerHtml = "";

        var numCols : int = e.Item.Cells.Count;
        var i : int
        for (i=2; i<numCols-1; i++) //skip first, second and last column
        {
            var colvalue : String =(TextBox(e.Item.Cells[i].Controls[0])).Text;

            // check for invalid values
            switch (cols[i-1])
            {
                case "@LName":
                    if ( !InputValidator.IsValidAnsiName(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: Last Name - " + InputValidator.AnsiNameErrorString + "<br>";
                    }
                    break;
                case "@FName":
                    if ( !InputValidator.IsValidAnsiName(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: First Name - " + InputValidator.AnsiNameErrorString + "<br>";
                    }
                    break;
                case "@Phone":
                    if ( !InputValidator.IsValidAnsiPhoneNumber(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: Phone - " + InputValidator.AnsiPhoneErrorString + "<br>";
                    }
                    break;
                case "@Address":
                    if ( !InputValidator.IsValidAnsiAddress(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: Address - " + InputValidator.AnsiAddressErrorString + "<br>";
                    }
                    break;
                case "@City":
                    if ( !InputValidator.IsValidAnsiCityOrState(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: City - " + InputValidator.AnsiCityStateErrorString + "<br>";
                    }
                    break;
                case "@State":
                    if ( !InputValidator.IsValidAnsiTwoCharacterState(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: State - " + InputValidator.AnsiTwoCharacterStateErrorString + "<br>";
                    }
                    break;
                case "@Zip":
                    if ( !InputValidator.IsValidFiveDigitZipCode(colvalue) )
                    {
                        Message.InnerHtml += "ERROR: Zip Code - " + InputValidator.AnsiBasicZipCodeErrorString + "<br>";
                    }
                    break;
            }

            // check for null values in required fields
            if (i<6 && colvalue == "")
            {
                Message.InnerHtml += "ERROR: Null values not allowed for " + cols[i-1] + "<br>";
            }

            myCommand.Parameters[cols[i-1]].Value = colvalue;
        }

        if ( Message.InnerHtml != "" )
        {
            Message.Style["color"] = "red";
            return;
        }

        //append last row, converting true/false values to 0/1
        if (System.String.Compare((TextBox(e.Item.Cells[numCols-1].Controls[0])).Text, "true", true, CultureInfo.InvariantCulture)==0)
                    myCommand.Parameters("@Contract").Value =  "1";
        else
                    myCommand.Parameters("@Contract").Value =  "0";

        myCommand.Connection.Open();

        try
        {
            myCommand.ExecuteNonQuery();
            Message.InnerHtml = "<b>Record Updated</b><br>" + updateCmd;
            MyDataGrid.EditItemIndex = -1;
        }
        catch ( e : SqlException )
        {
            if (e.Number == 2627)
                Message.InnerHtml = "ERROR: A record already exists with the same primary key";
            else
                Message.InnerHtml = "ERROR: Could not update record, please ensure the fields are correctly filled out";
            Message.Style("color") = "red";
        }

        myCommand.Connection.Close();

        BindGrid();
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

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Updating a Row of Data w/ Read-Only Column</font></h3>

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
