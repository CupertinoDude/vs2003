<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

  <script language="JScript" runat="server">

      function Page_Load(sender:Object, e:EventArgs) : void {

          var myConnection:SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          var myCommand:SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);

          var ds:DataSet = new DataSet();
          myCommand.Fill(ds, "Authors");

          MyDataGrid.DataSource=new DataView(ds.Tables[0]) ;
          MyDataGrid.DataBind();

          TimeMsg.Text = DateTime.Now.ToString("G");
      }

  </script>

  <body>

    <h3><font face="Verdana">Using the Output Cache</font></h3>

    <ASP:DataGrid id="MyDataGrid" runat="server"
      Width="700"
      BackColor="#ccccff"
      BorderColor="black"
      ShowFooter="false"
      CellPadding="3"
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
    />

    <p>

    <i>Last generated on:</i> <asp:label id="TimeMsg" runat="server" />

  </body>
</html>