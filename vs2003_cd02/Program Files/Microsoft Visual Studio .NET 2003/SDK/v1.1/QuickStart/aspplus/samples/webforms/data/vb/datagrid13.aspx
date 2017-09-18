
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

        DS = new DataSet()
        MyCommand.Fill(ds, "Authors")

        MyDataGrid.DataSource=ds.Tables("Authors").DefaultView
        MyDataGrid.DataBind()
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Working with Master-Detail Relationships</font></h3>

    <span id="Message" EnableViewState="false" style="font: arial 11pt;" runat="server"/><p>

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
      DataKeyField="au_id"
    >

      <Columns>
          <asp:HyperLinkColumn
            DataNavigateUrlField="au_id"
            DataNavigateUrlFormatString="datagrid13_details.aspx?id={0}"
            Text="Get Details"
          />
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
