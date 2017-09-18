<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
  <script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)

       Dim Source As DataView

        ' try to retrieve item from cache
        ' if it's not there, add it

        Source = Cache("MyDataSet")

        If Source Is Nothing

            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

            Dim ds As New DataSet
            myCommand.Fill(ds, "Authors")

            Source = New DataView(ds.Tables("Authors"))
            Cache("MyDataSet") = Source

            CacheMsg.Text = "Dataset created explicitly"
        Else
            cacheMsg.Text = "Dataset retrieved from cache"
        End If

        MyDataGrid.DataSource=Source
        MyDataGrid.DataBind()
    End Sub

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


