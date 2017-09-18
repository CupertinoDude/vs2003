<html>
<head>

    <script language="C#" runat="server">

        void Page_Load(Object Src, EventArgs E) {

            if (!Page.IsPostBack) {

               ArrayList values = new ArrayList();

               values.Add (0);
               values.Add (1);
               values.Add (2);
               values.Add (3);
               values.Add (4);
               values.Add (5);
               values.Add (6);

               DataList1.DataSource = values;
               DataList1.DataBind();
            }
        }

        String EvenOrOdd(int number) {
            if ((number % 2) == 0)
              return "Even";
            else
              return "Odd";
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding to Methods and Expressions</font></h3>

    <form runat=server>

      <asp:DataList id="DataList1" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        CellPadding="3"
        CellSpacing="0"
        >

        <ItemTemplate>
          Number Value: <%# Container.DataItem %>
          Even/Odd: <%# EvenOrOdd((int) Container.DataItem) %>
        </ItemTemplate>

      </asp:datalist>

    </form>

</body>
</html>
