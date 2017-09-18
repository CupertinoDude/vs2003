<%@ OutputCache Duration="60" VaryByParam="none" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

  <script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter
        Dim ds As DataSet

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

        ds = New DataSet()
        MyCommand.Fill(ds, "Authors")

        MyDataGrid.DataSource=new DataView(ds.Tables(0))
        MyDataGrid.DataBind()

        TimeMsg.Text = DateTime.Now.ToString("G")
    End Sub

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