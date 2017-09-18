
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="JScript" runat="server">

    var myConnection : SqlConnection;

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid();
    }

    public function MyDataGrid_Delete(sender : Object, e : DataGridCommandEventArgs) : void
    {
        var deleteCmd : String = "DELETE from Employee where emp_id = @Id";

        var myCommand : SqlCommand = new SqlCommand(deleteCmd, myConnection);
        myCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
        myCommand.Parameters("@Id").Value = MyDataGrid.DataKeys[int(e.Item.ItemIndex)];

        myCommand.Connection.Open();

        try
        {
            myCommand.ExecuteNonQuery();
            Message.InnerHtml = "<b>Record Deleted</b><br>" + deleteCmd;
        }
        catch (SQLException)
        {
            Message.InnerHtml = "ERROR: Could not delete record";
            Message.Style("color") = "red";
        }

        myCommand.Connection.Close();

        BindGrid();
    }

    public function BindGrid() : void
    {
        var myCommand : SqlDataAdapter = new SqlDataAdapter("select * from Employee", myConnection);

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Employee");

        MyDataGrid.DataSource=ds.Tables("Employee").DefaultView;
        MyDataGrid.DataBind();
    }

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Deleting a Row of Data</font></h3>

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
      DataKeyField="emp_id"
      OnDeleteCommand="MyDataGrid_Delete"
    >

      <Columns>
         <asp:ButtonColumn Text="Delete Employee" CommandName="Delete"/>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
