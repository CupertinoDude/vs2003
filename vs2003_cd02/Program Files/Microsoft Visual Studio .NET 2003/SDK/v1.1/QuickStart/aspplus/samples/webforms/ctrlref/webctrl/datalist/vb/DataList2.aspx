<%@ Import Namespace="System.Data" %>

<html>
<head>

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

        'Make some rows and put some sample data in
        For i = 1 To 9
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " & i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
            dt.Rows.Add(dr)
        Next

        'return a DataView to the DataTable
        CreateDataSource = New DataView(dt)

    End Function

    Sub Page_Load(sender As Object, e As EventArgs)

        If Not IsPostBack Then
            BindList
        End If

    End Sub

    Sub BindList
        DataList1.DataSource= CreateDataSource()
        DataList1.DataBind
    End Sub

    Sub DataList_ItemCommand(sender As Object, e As DataListCommandEventArgs)
        Dim cmd As String = e.CommandSource.CommandName
        If cmd = "select" Then
            DataList1.SelectedIndex = e.Item.ItemIndex
        End If

        BindList
    End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Using a SelectedItemTemplate with DataList</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">

        <asp:DataList id="DataList1" runat="server"
            BorderColor="black"
            BorderWidth="1"
            GridLines="Both"
            CellPadding="3"
            Font-Name="Verdana"
            Font-Size="8pt"
            Width="150px"
            HeaderStyle-BackColor="#aaaadd"
            AlternatingItemStyle-BackColor="Gainsboro"
            SelectedItemStyle-BackColor="yellow"
            OnItemCommand="DataList_ItemCommand"
            >
              <HeaderTemplate>
                Items
              </HeaderTemplate>
              <ItemTemplate>
                <asp:LinkButton id="button1" runat="server" Text="Show details" CommandName="select" />
                <%# DataBinder.Eval(Container.DataItem, "StringValue") %>
              </ItemTemplate>
              <SelectedItemTemplate>
                Item:
                <%# Container.DataItem("StringValue")  %>
                <br>
                Order Date:
                <%# DataBinder.Eval(Container.DataItem, "DateTimeValue", "{0:d}") %>
                <br>
                Quantity:
                <%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:N1}") %>
                <br>
              </SelectedItemTemplate>

        </asp:DataList>

    </font>
    </form>

</body>
</html>


