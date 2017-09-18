
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
        Dim DS As New DataSet
        Dim FS As FileStream
        Dim Reader As StreamReader

        FS = New FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read)
        Reader = New StreamReader(FS)
        DS.ReadXml(Reader)
        FS.Close()

        Dim Source As DataView
        Source = new DataView(ds.Tables(0))

        MyLiteral.Text = Source.Table.TableName
        MyDataGrid.DataSource = Source
        MyDataGrid.DataBind()
    End Sub

</script>

<body>

  <h3><font face="Verdana">XML Data for Table: <asp:Literal id="MyLiteral" runat="server" /></font></h3>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    Width="900"
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

</body>
</html>

