<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

  <script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs E) {

      DataView Source;

      // try to retrieve item from cache
      // if it's not there, add it

      Source = (DataView)Cache["MyDataSet"];

      if (Source == null) {

        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Authors");

        Source = new DataView(ds.Tables["Authors"]);
        Cache["MyDataSet"] = Source;

        CacheMsg.Text = "Dataset created explicitly";
      }
      else {
        CacheMsg.Text = "Dataset retrieved from cache";
      }

      MyDataGrid.DataSource=Source;
      MyDataGrid.DataBind();
    }

  </script>

  <body>

    <form method="GET" runat="server">

      <h3><font face="Verdana">Caching Data</font></h3>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        Width="700"
        BackColor="#ccccff"
        BorderColor="black"
        ShowFooter="false"
        CellPadding=3
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaad" />

      <p>

      <i><asp:label id="CacheMsg" runat="server"/></i>

    </form>
  </body>
</html>


