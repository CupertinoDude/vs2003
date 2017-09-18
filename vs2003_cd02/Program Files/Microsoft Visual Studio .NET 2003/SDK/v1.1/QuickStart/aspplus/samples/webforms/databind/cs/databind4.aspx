<%@ Import namespace="System.Data" %>

<html>
<head>

    <script language="C#" runat="server">

        void Page_Load(Object sender, EventArgs e ) {
        
            if (!Page.IsPostBack) {
            
                DataTable dt = new DataTable();
                DataRow dr;

                dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
                dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
                dt.Columns.Add(new DataColumn("DateTimeValue", typeof(DateTime)));
                dt.Columns.Add(new DataColumn("BooleanValue", typeof(bool)));

                for (int i = 1; i <= 9; i++) {
                
                    dr = dt.NewRow();

                    dr[0] = i;
                    dr[1] = "Item " + i.ToString();
                    dr[2] = DateTime.Now;
                    dr[3] = (i % 2 != 0) ? true : false;

                    dt.Rows.Add(dr);
                }
           
                dataGrid1.DataSource = new DataView(dt);
                dataGrid1.DataBind();
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding to a DataView</font></h3>

    <form runat=server>

        <asp:DataGrid id="dataGrid1" runat="server"
          BorderColor="black"
          BorderWidth="1"
          GridLines="Both"
          CellPadding="3"
          CellSpacing="0"
          HeaderStyle-BackColor="#aaaadd"
        />

    </form>

</body>
</html>
