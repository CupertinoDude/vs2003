<%@ OutputCache Duration="60" VaryByParam="state" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Acme" %>

<html>
  <script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter
        Dim ds As DataSet
        Dim queryState As String
        Dim selectCmd As String

        queryState = Request.QueryString("state")
        If queryState = Nothing OrElse Not InputValidator.IsValidAnsiTwoCharacterState(queryState)
            selectCmd = "select * from Authors"
        Else
            selectCmd = "select * from Authors where state = '" + queryState + "'"
        End If

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter(selectCmd, MyConnection)

        ds = New DataSet()
        MyCommand.Fill(ds, "Authors")

        MyDataGrid.DataSource=new DataView(ds.Tables(0))
        MyDataGrid.DataBind()

        ' capture the time of the current request
        ' subsequent requests while we're still cached
        ' will  show the original time
        TimeMsg.Text = DateTime.Now.ToString("G")
    End Sub

  </script>

  <body>
    <h3><font face="Verdana">Using the Output Cache</font></h3>

    <b>Authors by State:</b>

    <table cellspacing="0" cellpadding="3" rules="all" style="background-color:#AAAADD;border-color:black;border-color:black;width:700px;border-collapse:collapse;">
        <tr>
          <td><a href="outputcache3.aspx?state=CA">CA</a></td>
          <td><a href="outputcache3.aspx?state=IN">IN</a></td>
          <td><a href="outputcache3.aspx?state=KS">KS</a></td>
          <td><a href="outputcache3.aspx?state=MD">MD</a></td>
          <td><a href="outputcache3.aspx?state=MI">MI</a></td>
          <td><a href="outputcache3.aspx?state=OR">OR</a></td>
          <td><a href="outputcache3.aspx?state=TN">TN</a></td>
          <td><a href="outputcache3.aspx?state=UT">UT</a></td>
      </tr>
    </table>

    <p>

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
    />

    <p>

    <i>Last generated on:</i> <asp:label id="TimeMsg" runat="server"/>

  </body>
</html>


