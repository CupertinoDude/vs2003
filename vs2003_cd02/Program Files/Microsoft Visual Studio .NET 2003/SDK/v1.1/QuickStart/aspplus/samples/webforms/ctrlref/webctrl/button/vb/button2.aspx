<html>
<head>
    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs)

            if Not IsPostBack Then
                dim values as ArrayList
                values = new ArrayList()

                values.Add(new PositionData("Microsoft", "Msft", "150 shares"))
                values.Add(new PositionData("Intel", "Intc", "25 shares"))
                values.Add(new PositionData("Dell", "Dell", "115 shares"))

                repeater1.DataSource = values
                repeater1.DataBind
            End If

        End Sub

        Sub Repeater1_ItemCommand(sender As Object, e As RepeaterCommandEventArgs)

            lblResult.Text = "<u>Command</u> is: <b>" & e.CommandName & "</b>, <u>CommandArgument</u> is: <b>" & e.CommandArgument & "</b>"

        End Sub

        class PositionData

            Dim m_name As String
            Dim m_ticker As String
            Dim m_shares As String

            Public Sub New(name As String, ticker As String, shares As String)
                MyBase.New
                m_name = name
                m_ticker = ticker
                m_shares = shares
            End Sub

            ReadOnly Property Name As String
              Get
                Return m_name
              End Get
            End Property

            ReadOnly Property Ticker As String
              Get
                Return m_ticker
              End Get
            End Property

            ReadOnly Property Shares As String
              Get
                Return m_shares
              End Get
            End Property

        End Class

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


