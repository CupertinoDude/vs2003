
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Sub GetEmployees_Click(Sender As Object, E As EventArgs) 

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("SalesByCategory", MyConnection)

        MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@CategoryName", SqlDbType.NVarChar, 15))
        MyCommand.SelectCommand.Parameters("@CategoryName").Value = SelectCategory.Value

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@OrdYear", SqlDbType.NVarChar, 4))
        MyCommand.SelectCommand.Parameters("@OrdYear").Value = SelectYear.Value

        DS = new DataSet()
        MyCommand.Fill(DS, "Sales")

        MyDataGrid.DataSource=DS.Tables("Sales").DefaultView
        MyDataGrid.DataBind()
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

  <h3><font face="Verdana">Parameterized Stored Proc Select to a DataGrid Control</font></h3>

  Select a Category: 

  <select id="SelectCategory" runat="server">
    <option>Beverages</option>
    <option>Condiments</option>
    <option>Confections</option>
    <option>Dairy Products</option>
    <option>Grains/Cereals</option>
    <option>Meat/Poultry</option>
    <option>Produce</option>
    <option>Seafood</option>
  </select>

  &nbsp;

  Select a Year: 

  <select id="SelectYear" runat="server">
    <option>1996</option>
    <option>1997</option>  
    <option>1998</option>  
  </select>

  &nbsp;

  <input type="submit" OnServerClick="GetEmployees_Click" Value="Get Sales" runat="server"/><p>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    Width="650"
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
