<html>
<head>
    <script language="C#" runat="server">

        void Page_Load(Object Sender, EventArgs e) {

            if (!Page.IsPostBack) {

                ArrayList values = new ArrayList();

                values.Add(new PositionData("Microsoft", "Msft", "150 shares"));
                values.Add(new PositionData("Intel", "Intc", "25 shares"));
                values.Add(new PositionData("Dell", "Dell", "115 shares"));

                repeater1.DataSource = values;
                repeater1.DataBind();
            }
        }

        void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e) {

            lblResult.Text = "<u>Command</u> is: <b>" + e.CommandName + "</b>, <u>CommandArgument</u> is: <b>" + e.CommandArgument + "</b>";
        }

        public class PositionData {

            private string name;
            private string ticker;
            private string shares;

            public PositionData(string name, string ticker, string shares) {
                this.name = name;
                this.ticker = ticker;
                this.shares = shares;
            }

            public string Name {
                get {
                    return name;
                }
            }

            public string Ticker {
                get {
                    return ticker;
                }
            }

            public string Shares {
                get {
                    return shares;
                }
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


