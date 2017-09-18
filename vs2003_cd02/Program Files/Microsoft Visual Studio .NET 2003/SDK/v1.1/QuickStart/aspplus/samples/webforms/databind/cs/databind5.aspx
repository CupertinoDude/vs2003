<html>
<head>

    <script language="C#" runat="server">

        void Page_Load(Object sender, EventArgs e) {
            if (!Page.IsPostBack) {

                Hashtable h = new Hashtable();
                h.Add ("key1", "value1");
                h.Add ("key2", "value2");
                h.Add ("key3", "value3");

                MyDataList.DataSource = h;
                MyDataList.DataBind();
            }
        }

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
                <%# ((DictionaryEntry)Container.DataItem).Key %> :
                <%# ((DictionaryEntry)Container.DataItem).Value %>
            </ItemTemplate>

        </asp:DataList>

    </form>

</body>
</html>
