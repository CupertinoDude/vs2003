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
                dt.Columns.Add(New DataColumn("BooleanValue", GetType(Boolean)))

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
                    'add the row to the datatable
                    dt.Rows.Add(dr)
                Next

                dataGrid1.DataSource = new DataView(dt)
                dataGrid1.DataBind

            End If
        End Sub

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
