<%@ Import namespace="System.Data" %>

<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs)

            If Not IsPostBack Then
                Dim dt As DataTable
                Dim dr As DataRow
                Dim i As Integer

                'create a DataTable
                dt = New DataTable
                dt.Columns.Add(New DataColumn("IntegerValue", GetType(Integer)))
                dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
                dt.Columns.Add(New DataColumn("DateTimeValue", GetType(DateTime)))
                dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))

                'Make some rows and put some sample data in
                For i = 0 To 8
                    dr = dt.NewRow()
                    dr(0) = i
                    dr(1) = "Item " + i.ToString()
                    dr(2) = DateTime.Now.ToShortTimeString
                    If (i Mod 2 <> 0) Then
                        dr(3) = True
                    Else
                        dr(3) = False
                    End If
                    'add the row to the datatable
                    dt.Rows.Add(dr)
                Next

                dataList1.DataSource = new DataView(dt)
                dataList1.DataBind
            End If
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding Using DataBinder.Eval</font></h3>

    <form runat=server>

        <asp:DataList id="dataList1" runat="server"
          RepeatColumns="3"
          Width="80%"
          BorderColor="black"
          BorderWidth="1"
          GridLines="Both"
          CellPadding="4"
          CellSpacing="0"
          >

            <ItemTemplate>

                Order Date: <%# DataBinder.Eval(Container.DataItem, "DateTimeValue", "{0:d}") %>

                <p>

                Quantity: <%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:N2}") %>

                <p>

                Item: <%# DataBinder.Eval(Container.DataItem, "StringValue") %>

                Order Date: <asp:CheckBox id=chk1 Checked='<%# DataBinder.Eval(Container.DataItem, "BoolValue") %>' runat=server/>

                <p>

            </ItemTemplate>

        </asp:Datalist>

    </form>

</body>
</html>
