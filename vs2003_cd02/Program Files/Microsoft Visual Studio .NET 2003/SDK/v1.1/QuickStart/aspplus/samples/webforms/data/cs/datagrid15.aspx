
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="C#" runat="server">

    public void GetEmployees_Click(Object sender, EventArgs E) 
    {
        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
        SqlDataAdapter myCommand = new SqlDataAdapter("SalesByCategory", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@CategoryName", SqlDbType.NVarChar, 15));
        myCommand.SelectCommand.Parameters["@CategoryName"].Value = SelectCategory.Value;

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@OrdYear", SqlDbType.NVarChar, 4));
        myCommand.SelectCommand.Parameters["@OrdYear"].Value = SelectYear.Value;

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Sales");

        MyDataGrid.DataSource=ds.Tables["Sales"].DefaultView;
        MyDataGrid.DataBind();
    }

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
