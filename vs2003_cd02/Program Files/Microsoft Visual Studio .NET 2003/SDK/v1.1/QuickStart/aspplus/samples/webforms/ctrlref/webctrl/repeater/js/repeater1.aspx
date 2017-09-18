<html>
<head>

    <script language="JScript" runat="server">

        function Page_Load(sender:Object, e:EventArgs) : void {

            if (!IsPostBack) {

                var values:ArrayList = new ArrayList();

                values.Add(new PositionData("Microsoft", "Msft"));
                values.Add(new PositionData("Intel", "Intc"));
                values.Add(new PositionData("Dell", "Dell"));

                Repeater1.DataSource = values;
                Repeater1.DataBind();

                Repeater2.DataSource = values;
                Repeater2.DataBind();
            }
        }

        public class PositionData {

            private var name:String;
            private var ticker:String;

            public function PositionData(name:String, ticker:String) {
                this.name = name;
                this.ticker = ticker;
            }

            public function get Name() : String {
                return name;
            }

            public function get Ticker() : String {
                return ticker;
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Repeater Example</font></h3>

    <form runat=server>

        <b>Repeater1:</b>

        <p>

        <asp:Repeater id=Repeater1 runat="server">

            <HeaderTemplate>

                <table border=1>
                  <tr>
                    <td><b>Company</b></td>
                    <td><b>Symbol</b></td>
                  </tr>

            </HeaderTemplate>

            <ItemTemplate>

                <tr>
                  <td> <%# DataBinder.Eval(Container.DataItem, "Name") %> </td>
                  <td> <%# DataBinder.Eval(Container.DataItem, "Ticker") %> </td>
                </tr>

            </ItemTemplate>

            <FooterTemplate>

                </table>

            </FooterTemplate>

        </asp:Repeater>

        <p>

        <b>Repeater2:</b>

        <p>

        <asp:Repeater id=Repeater2 runat="server">

            <HeaderTemplate>
                Company data:
            </HeaderTemplate>

            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "Name") %> (<%# DataBinder.Eval(Container.DataItem, "Ticker") %>)
            </ItemTemplate>

            <SeparatorTemplate>, </SeparatorTemplate>

        </asp:Repeater>

    </form>

</body>
</html>


