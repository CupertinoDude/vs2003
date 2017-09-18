<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Function CreateDataSource() As ICollection

        Dim dt As DataTable
        Dim dr As DataRow
        Dim i As Integer

        'create a DataTable
        dt = New DataTable
        dt.Columns.Add(New DataColumn("IntegerValue", GetType(Integer)))
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
        dt.Columns.Add(New DataColumn("DateTimeValue", GetType(DateTime)))
        dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))
        dt.Columns.Add(new DataColumn("CurrencyValue", GetType(Double)))

        'Make some rows and put some sample data in
        For i = 1 To 9
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " + i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
            If (i Mod 2 <> 0) Then
                dr(3) = True
            Else
                dr(3) = False
            End If
            dr(4) = 1.23 * (i+1)
            'add the row to the datatable
            dt.Rows.Add(dr)
        Next

        'return a DataView to the DataTable
        CreateDataSource = New DataView(dt)

    End Function

    Sub Page_Load(sender As Object, e As EventArgs)
        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind
    End Sub

</script>

<body>

    <h3><font face="Verdana">Using a HyperLinkColumn in DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        CellPadding="3"
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        AutoGenerateColumns="false"
      >
          <Columns>
            <asp:HyperLinkColumn
                HeaderText="Details"
                DataNavigateUrlField="IntegerValue"
                DataNavigateUrlFormatString="detailspage.aspx?id={0}"
                DataTextField="StringValue"
                Target="_new"
            />
            <asp:BoundColumn HeaderText="Date/Time" DataField="DateTimeValue"/>
            <asp:BoundColumn HeaderText="True/False" DataField="BoolValue"/>
            <asp:BoundColumn HeaderText="Price"
                DataField="CurrencyValue"
                DataFormatString="{0:c}"
                ItemStyle-HorizontalAlign="right"
                />
          </Columns>

      </asp:DataGrid>

  </form>

</body>
</html>
