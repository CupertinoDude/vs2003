
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs) 

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        Dim SelectCmd As String = "select t.title_id, t.type, t.pub_id, t.price "  _
                         & "from titles t, titleauthor ta, authors a " _
                         & "where  ta.au_id=@Id AND ta.title_id=t.title_id AND ta.au_id = a.au_id"

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter(SelectCmd, MyConnection)

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
        MyCommand.SelectCommand.Parameters("@Id").Value = Request.QueryString("id")

        DS = new DataSet()
	Try
	    MyCommand.Fill(DS, "Titles")
	    MyDataGrid.DataSource = DS.Tables("Titles").DefaultView
	    MyDataGrid.DataBind()
	Catch
	End Try

    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

    <h4><font face="Verdana">Details for Author </font><%=Request.QueryString("id")%></h4>

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
