<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs)
            If Not IsPostBack Then

                Dim h As Hashtable = new Hashtable()
                h.Add ("key1", "value1")
                h.Add ("key2", "value2")
                h.Add ("key3", "value3")

                MyDataList.DataSource = h
                MyDataList.DataBind
            End If
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding to a Hashtable</font></h3>

    <form runat=server>

        <asp:DataList id="MyDataList" runat="server"
          BorderColor="black"
          BorderWidth="1"
          GridLines="Both"
          CellPadding="4"
          CellSpacing="0"
          >

            <ItemTemplate>
                <%# Container.DataItem.Key %> :
                <%# Container.DataItem.Value %>
            </ItemTemplate>

        </asp:DataList>

    </form>

</body>
</html>
