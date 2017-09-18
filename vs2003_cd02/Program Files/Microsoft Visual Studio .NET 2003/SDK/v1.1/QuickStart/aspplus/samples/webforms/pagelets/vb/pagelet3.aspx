<%@ Register TagPrefix="Acme" TagName="Address" Src="pagelet3.ascx" %>

<html>

    <script language="VB" runat="server">

        Sub SubmitBtn_Click(Sender As Object, E As EventArgs)
        
            MyLabel.Text &= "<b>Shipping Address:</b> " _
                         &   ShipAddr.Address & ", "  _
                         &   ShipAddr.City & ", "  _
                         &   ShipAddr.StateName & ", "  _
                         &   ShipAddr.Zip & "<br>"

            MyLabel.Text &= "<b>Billing Address:</b> " _
                         &   BillAddr.Address & ", "  _
                         &   BillAddr.City & ", "  _
                         &   BillAddr.StateName & ", "  _
                         &   BillAddr.Zip & "<br>"
        End Sub

    </script>

<body style="font: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>

  <form runat="server">

    <Acme:Address id="ShipAddr" Caption="Shipping Address" Address="One Microsoft Way" City="Redmond" StateName="WA" Zip="98052" runat="server"/>

    <p>

    <Acme:Address id="BillAddr" Caption="Billing Address" runat="server"/>

    <p>

    <asp:button Text="Submit Form" OnClick="SubmitBtn_Click" runat=server/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>