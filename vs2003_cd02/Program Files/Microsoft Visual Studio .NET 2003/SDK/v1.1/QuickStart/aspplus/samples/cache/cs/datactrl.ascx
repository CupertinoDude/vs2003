<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

  <script language="C#" runat="server">

      void Page_Load(Object Src, EventArgs E ) {

          SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

          DataSet ds = new DataSet();
          myCommand.Fill(ds, "Authors");

          MyDataGrid.DataSource=new DataView(ds.Tables[0]) ;
          MyDataGrid.DataBind();

          TimeMsg.Text = DateTime.Now.ToString("G");
      }

  </script>

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

  <i>Control last generated on:</i> <asp:label id="TimeMsg" runat="server" />

