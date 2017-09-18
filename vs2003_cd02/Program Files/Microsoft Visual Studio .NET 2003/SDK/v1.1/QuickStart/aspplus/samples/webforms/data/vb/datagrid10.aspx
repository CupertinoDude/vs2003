
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs)

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid()
        End If
    End Sub

    Sub MyDataGrid_Delete(Sender As Object, E As DataGridCommandEventArgs)

        Dim MyCommand As SqlCommand
        Dim DeleteCmd As String = "DELETE from Employee where emp_id = @Id"

        MyCommand = New SqlCommand(DeleteCmd, MyConnection)
        MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
        MyCommand.Parameters("@Id").Value = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))

        MyCommand.Connection.Open()

        Try
            MyCommand.ExecuteNonQuery()
            Message.InnerHtml = "<b>Record Deleted</b><br>" & DeleteCmd
        Catch Exc As SQLException
            Message.InnerHtml = "ERROR: Could not delete record"
            Message.Style("color") = "red"
        End Try

        MyCommand.Connection.Close()

        BindGrid()
    End Sub

    Sub BindGrid()

        Dim DS As DataSet
        Dim MyCommand As SqlDataAdapter
        MyCommand = New SqlDataAdapter("select * from Employee", MyConnection)

        DS = new DataSet()
        MyCommand.Fill(DS, "Employee")

        MyDataGrid.DataSource=DS.Tables("Employee").DefaultView
        MyDataGrid.DataBind()
    End Sub

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
