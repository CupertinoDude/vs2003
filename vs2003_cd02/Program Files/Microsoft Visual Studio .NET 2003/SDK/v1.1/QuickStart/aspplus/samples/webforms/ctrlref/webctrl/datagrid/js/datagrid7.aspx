<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    public function CreateDataSource() : ICollection {
        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", Type.GetType("System.Int32,mscorlib")));
        dt.Columns.Add(new DataColumn("StringValue", Type.GetType("System.String,mscorlib")));
        dt.Columns.Add(new DataColumn("DateTimeValue", Type.GetType("System.DateTime,mscorlib")));
        dt.Columns.Add(new DataColumn("BoolValue", Type.GetType("System.Boolean,mscorlib")));
        dt.Columns.Add(new DataColumn("CurrencyValue", Type.GetType("System.Double,mscorlib")));

        for (var i:int = 0; i < 9; i++) {
            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        var dv:DataView = new DataView(dt);
        return dv;
    }

    public function Page_Load(sender:Object, e:EventArgs) : void {
        if (!IsPostBack) {
            MyDataGrid.DataSource= CreateDataSource();
            MyDataGrid.DataBind();
            Label1.Text = "Column 1's visible property is set to " + MyDataGrid.Columns[1].Visible.ToString();
        }
    }

    public function Button1_Col1Vis(sender:Object, e:EventArgs) : void {
        MyDataGrid.Columns[1].Visible = !MyDataGrid.Columns[1].Visible;
        Label1.Text = "Column 1's visible property is set to " + MyDataGrid.Columns[1].Visible.ToString();
    }

</script>

<body>

    <h3><font face="Verdana">Hiding Columns in DataGrid</font></h3>

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
            <asp:BoundColumn HeaderText="Integer" DataField="IntegerValue" />
            <asp:BoundColumn HeaderText="Date/Time (Column1)" DataField="DateTimeValue"/>
            <asp:BoundColumn HeaderText="String" DataField="StringValue"/>
            <asp:BoundColumn HeaderText="True/False" DataField="BoolValue"/>
            <asp:BoundColumn HeaderText="Price" DataField="CurrencyValue" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="right" />
          </Columns>
      </asp:DataGrid>

      <br>
      <asp:Button id="Button1" Text="Toggle Column1 Visibility" OnClick="Button1_Col1Vis" runat="server" />

      <br>
      <asp:Label id="Label1" runat="server" />
  </form>

</body>
</html>
