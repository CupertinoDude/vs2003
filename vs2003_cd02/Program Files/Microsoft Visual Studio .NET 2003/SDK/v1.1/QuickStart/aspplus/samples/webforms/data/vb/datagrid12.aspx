
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs)

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid("au_id")
        End If
    End Sub

    Sub MyDataGrid_Sort(Src As Object, E As DataGridSortCommandEventArgs)

        BindGrid(E.SortExpression)
    End Sub

    Sub BindGrid(SortField As String)

        Dim DS As DataSet
        Dim MyCommand As SqlDataAdapter
        MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

        DS = new DataSet()
        MyCommand.Fill(DS, "Authors")

        Dim Source As DataView = DS.Tables("Authors").DefaultView
        Source.Sort = SortField

        MyDataGrid.DataSource = Source
        MyDataGrid.DataBind()
    End Sub

</script>

<body>

  <h3><font face="Verdana">Sorting Data in a DataGrid Control w/ Bound Columns</font></h3>

  <form runat="server">

    <ASP:DataGrid id="MyDataGrid" runat="server" OnSortCommand="MyDataGrid_Sort"
      Width="700"
      BackColor="#ccccff"
      BorderColor="black"
      ShowFooter="false"
      CellPadding=3
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      AllowSorting="true"
      AutoGenerateColumns="false"
    >

      <Columns>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_lname" SortExpression="au_lname" DataField="au_lname"/>
        <asp:BoundColumn HeaderText="au_fname" SortExpression="au_fname" DataField="au_fname"/>
        <asp:BoundColumn HeaderText="phone" SortExpression="phone" DataField="phone"/>
        <asp:BoundColumn HeaderText="address" SortExpression="address" DataField="address"/>
        <asp:BoundColumn HeaderText="city" SortExpression="city" DataField="city"/>
        <asp:BoundColumn HeaderText="state" SortExpression="state" DataField="state"/>
        <asp:BoundColumn HeaderText="zip" SortExpression="zip" DataField="zip"/>
        <asp:BoundColumn HeaderText="contract" SortExpression="contract" DataField="contract"/>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
