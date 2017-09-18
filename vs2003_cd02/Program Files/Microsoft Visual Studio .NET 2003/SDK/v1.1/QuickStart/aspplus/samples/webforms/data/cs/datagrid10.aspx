
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="C#" runat="server">

    SqlConnection myConnection;

    protected void Page_Load(Object sender, EventArgs e)
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid();
    }

    public void MyDataGrid_Delete(Object sender, DataGridCommandEventArgs e)
    {
        String deleteCmd = "DELETE from Employee where emp_id = @Id";

        SqlCommand myCommand = new SqlCommand(deleteCmd, myConnection);
        myCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
        myCommand.Parameters["@Id"].Value = MyDataGrid.DataKeys[(int)e.Item.ItemIndex];

        myCommand.Connection.Open();

        try
        {
            myCommand.ExecuteNonQuery();
            Message.InnerHtml = "<b>Record Deleted</b><br>" + deleteCmd;
        }
        catch (SqlException)
        {
            Message.InnerHtml = "ERROR: Could not delete record";
            Message.Style["color"] = "red";
        }

        myCommand.Connection.Close();

        BindGrid();
    }

    public void BindGrid()
    {
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Employee", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Employee");

        MyDataGrid.DataSource=ds.Tables["Employee"].DefaultView;
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
