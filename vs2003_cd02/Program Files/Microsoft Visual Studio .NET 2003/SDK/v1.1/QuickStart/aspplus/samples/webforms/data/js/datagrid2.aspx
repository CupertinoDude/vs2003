
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    public function GetAuthors_Click(sender : Object, e : EventArgs) : void 
    {
        var selectCmd : String = "select * from Authors where state = @State";

        var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        var myCommand : SqlDataAdapter = new SqlDataAdapter(selectCmd, myConnection);

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 2));
        myCommand.SelectCommand.Parameters("@State").Value = MySelect.Value;

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Authors");

        MyDataGrid.DataSource= ds.Tables("Authors").DefaultView;
        MyDataGrid.DataBind();
    }

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
