
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Sub GetAuthors_Click(Sender As Object, E As EventArgs) 

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        Dim SelectCommand As String = "select * from Authors where state = @State"

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter(SelectCommand, MyConnection)

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NVarChar, 2))
        MyCommand.SelectCommand.Parameters("@State").Value = MySelect.Value

        DS = new DataSet()
        MyCommand.Fill(DS, "Authors")

        MyDataGrid.DataSource=DS.Tables("Authors").DefaultView
        MyDataGrid.DataBind()
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" runat="server">
      <option>CA</option>
      <option>IN</option>  
      <option>KS</option>  
      <option>MD</option>  
      <option>MI</option>  
      <option>OR</option> 
      <option>TN</option>  
      <option>UT</option>  
    </select>

    <input type="submit" OnServerClick="GetAuthors_Click" Value="Get Authors" runat="server"/><p>

    <ASP:DataGrid id="MyDataGrid" runat="server"
      Width="700"
      BackColor="#ccccff" 
      BorderColor="black"
      ShowFooter="false" 
      CellPadding=3 
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      EnableViewState="false"
    />

  </form>

</body>
</html>
