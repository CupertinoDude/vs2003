
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="JScript" runat="server">

    var myConnection : SqlConnection;

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        var selectCmd : String = "select t.title_id, t.type, t.pub_id, t.price "  
                         + "from titles t, titleauthor ta, authors a "
                         + "where  ta.au_id=@Id AND ta.title_id=t.title_id AND ta.au_id = a.au_id";

        var myCommand : SqlDataAdapter = new SqlDataAdapter(selectCmd, myConnection);

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.NVarChar, 11));
        myCommand.SelectCommand.Parameters("@Id").Value = Request.QueryString("id");

        var ds : DataSet = new DataSet();
	try{
	    myCommand.Fill(ds, "Titles");
	    MyDataGrid.DataSource=ds.Tables("Titles").DefaultView;
	    MyDataGrid.DataBind();
	}catch (Exception) {}
    }

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

    <h4><font face="Verdana">Details for Author </font><%=Request.QueryString["id"]%></h4>

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
    />

  </form>

</body>
</html>
