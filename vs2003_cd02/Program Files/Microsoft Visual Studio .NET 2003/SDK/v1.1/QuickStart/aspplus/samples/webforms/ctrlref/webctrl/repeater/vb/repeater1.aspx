<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs)

            If Not IsPostBack Then
                Dim values As ArrayList = New ArrayList()

                values.Add(new PositionData("Microsoft", "Msft"))
                values.Add(new PositionData("Intel", "Intc"))
                values.Add(new PositionData("Dell", "Dell"))

                Repeater1.DataSource = values
                Repeater1.DataBind

                Repeater2.DataSource = values
                Repeater2.DataBind
            End If
        End Sub

        class PositionData

            Dim m_name As String
            Dim m_ticker As String

            Public Sub New(name As String, ticker As String)
                MyBase.New
                m_name = name
                m_ticker = ticker
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

        End Class

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


