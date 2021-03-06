<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Function CreateDataSource() As ICollection

        Dim dt As DataTable
        Dim dr As DataRow
        Dim i As Integer

        'create a DataTable
        dt = New DataTable
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))

        'Make some rows and put some sample data in
        For i = 1 To 10
            dr = dt.NewRow()
            dr(0) = "Item " & i.ToString()
            dt.Rows.Add(dr)
        Next

        'return a DataView to the DataTable
        CreateDataSource = New DataView(dt)

    End Function

    Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            DataList1.DataSource = CreateDataSource()
            DataList1.DataBind
        End If
    End Sub

    Sub Button1_Click(sender As Object, e As EventArgs)
        If DropDown1.SelectedIndex = 0
            DataList1.RepeatDirection = RepeatDirection.Horizontal
        Else
            DataList1.RepeatDirection = RepeatDirection.Vertical
        End If

        If DropDown2.SelectedIndex = 0
            DataList1.RepeatLayout = RepeatLayout.Table
        Else
            DataList1.RepeatLayout = RepeatLayout.Flow
        End If

        If Check1.Checked And DataList1.RepeatLayout = RepeatLayout.Table Then
            DataList1.BorderWidth = Unit.Pixel(1)
            DataList1.GridLines = GridLines.Both
        Else
            DataList1.BorderWidth = Unit.Pixel(0)
            DataList1.GridLines = GridLines.None
        End If

        DataList1.RepeatColumns=DropDown3.SelectedIndex + 1
    End Sub

</script>

<body>

    <h3><font face="Verdana">Simple &lt;asp:DataList&gt; Sample</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">

        <asp:DataList id="DataList1" runat="server"
            BorderColor="black"
            CellPadding="3"
            Font-Name="Verdana"
            Font-Size="8pt"
            HeaderStyle-BackColor="#aaaadd"
            AlternatingItemStyle-BackColor="Gainsboro"
            >
              <HeaderTemplate>
                Items
              </HeaderTemplate>
              <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "StringValue") %>
              </ItemTemplate>
        </asp:DataList>

        <p>
        <hr noshade align="left" width="300px">
        RepeatDirection:
        <asp:DropDownList id=DropDown1 runat="server">
            <asp:ListItem>Horizontal</asp:ListItem>
            <asp:ListItem>Vertical</asp:ListItem>
        </asp:DropDownList><br>

        RepeatLayout:
        <asp:DropDownList id=DropDown2 runat="server">
            <asp:ListItem>Table</asp:ListItem>
            <asp:ListItem>Flow</asp:ListItem>
        </asp:DropDownList><br>

        RepeatColumns:
        <asp:DropDownList id=DropDown3 runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList><br>

        Show Borders:
        <asp:CheckBox id=Check1 runat="server" /><p>

        <asp:LinkButton id=Button1 Text="Refresh DataList" OnClick="Button1_Click" runat="server"/>


    </font>
    </form>

</body>
</html>
