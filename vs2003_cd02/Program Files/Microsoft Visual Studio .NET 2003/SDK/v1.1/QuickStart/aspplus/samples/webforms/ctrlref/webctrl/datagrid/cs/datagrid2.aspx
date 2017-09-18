<%@ Page Debug="true" %>
<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    ICollection CreateDataSource() {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(DateTime)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));
        dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

        for (int i = 0; i < 9; i++) {
            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        DataView dv = new DataView(dt);
        return dv;
    }

    void Page_Load(Object sender, EventArgs e) {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
    }

</script>

<body>

    <h3><font face="Verdana">Specifying Columns in DataGrid</font></h3>

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
        AutoGenerateColumns="false">
          <Columns>
            <asp:BoundColumn HeaderText="Integer" DataField="IntegerValue" />
            <asp:BoundColumn HeaderText="Date/Time" DataField="DateTimeValue"/>
            <asp:BoundColumn HeaderText="String" DataField="StringValue"/>
            <asp:BoundColumn HeaderText="True/False" DataField="BoolValue"/>
            <asp:BoundColumn HeaderText="Price" DataField="CurrencyValue" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="right" />
          </Columns>

      </asp:DataGrid>

  </form>

</body>
</html>
