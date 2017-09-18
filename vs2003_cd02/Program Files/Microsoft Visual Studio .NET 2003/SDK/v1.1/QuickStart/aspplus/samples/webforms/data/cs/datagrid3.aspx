
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="C#" runat="server">

    SqlConnection myConnection;

    protected void Page_Load(Object Src, EventArgs E) 
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        
        if (!IsPostBack) 
        {
            SqlDataAdapter myCommand = new SqlDataAdapter("select distinct State from Authors", myConnection);

            DataSet ds = new DataSet();
            myCommand.Fill(ds, "States");

            MySelect.DataSource= ds.Tables["States"].DefaultView;
            MySelect.DataBind();
        }
    }

    public void GetAuthors_Click(Object sender, EventArgs E) 
    {
        String selectCmd = "select * from Authors where state = @State";

        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        SqlDataAdapter myCommand = new SqlDataAdapter(selectCmd, myConnection);

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@State", SqlDbType.NVarChar, 2));
        myCommand.SelectCommand.Parameters["@State"].Value = MySelect.Value;

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Authors");

        MyDataGrid.DataSource= ds.Tables["Authors"].DefaultView;
        MyDataGrid.DataBind();
    }

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Dynamic Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" DataTextField="State" runat="server"/>

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
