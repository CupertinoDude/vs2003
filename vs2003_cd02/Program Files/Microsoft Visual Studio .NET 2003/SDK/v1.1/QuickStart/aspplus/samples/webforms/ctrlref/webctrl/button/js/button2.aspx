<html>
<head>
    <script language="JScript" runat="server">

        protected function Page_Load(sender:Object, e:EventArgs) : void {

            if (!Page.IsPostBack) {

                var values:ArrayList = new ArrayList();

                values.Add(new PositionData("Microsoft", "Msft", "150 shares"));
                values.Add(new PositionData("Intel", "Intc", "25 shares"));
                values.Add(new PositionData("Dell", "Dell", "115 shares"));

                repeater1.DataSource = values;
                repeater1.DataBind();
            }
        }

        function Repeater1_ItemCommand(sender:Object, e:RepeaterCommandEventArgs) : void {

            lblResult.Text = "<u>Command</u> is: <b>" + e.CommandName + "</b>, <u>CommandArgument</u> is: <b>" + e.CommandArgument + "</b>";
        }

        public class PositionData {

            private var name:String;
            private var ticker:String;
            private var shares:String;

            public function PositionData(name:String, ticker:String, shares:String) {
                this.name = name;
                this.ticker = ticker;
                this.shares = shares;
            }

            public function get Name() : String {
                return name;
            }

            public function get Ticker() : String {
                return ticker;
            }

            public function get Shares() : String {
                return shares;
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Bubbling Button Clicks Within a List</font></h3>
    <p></p>

    <form runat=server>
      <font face="Verdana" size="-1">

        <asp:Repeater id=repeater1 onitemcommand="Repeater1_ItemCommand" runat="server">

            <ItemTemplate>
                <asp:Button id=btnBuy Text="Buy" CommandName="buy" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Ticker") %>' runat="server" />

                &nbsp;&nbsp;

                <asp:Button id=btnSell Text="Sell" CommandName="sell" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Shares") %>' runat="server" />

                &nbsp;&nbsp;

                <asp:Label id=lblCompany Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' Font-Bold="true" runat=server />

                <p>

            </ItemTemplate>

        </asp:Repeater>

        <asp:Label id=lblResult runat="server" />

      </font>
    </form>

</body>
</html>


