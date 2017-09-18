<%@ Register TagPrefix="Acme" TagName="Address" Src="pagelet3.ascx" %>

<html>

    <script language="C#" runat="server">

        void SubmitBtn_Click(Object sender, EventArgs E) {
        
            MyLabel.Text += "<b>Shipping Address:</b> "
                         +   ShipAddr.Address + ", " 
                         +   ShipAddr.City + ", " 
                         +   ShipAddr.State + ", " 
                         +   ShipAddr.Zip + "<br>";

            MyLabel.Text += "<b>Billing Address:</b> "
                         +   BillAddr.Address + ", " 
                         +   BillAddr.City + ", " 
                         +   BillAddr.State + ", " 
                         +   BillAddr.Zip + "<br>";
        }

    </script>

<body style="font: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>

  <form runat="server">

    <Acme:Address id="ShipAddr" Caption="Shipping Address" Address="One Microsoft Way" City="Redmond" State="WA" Zip="98052" runat="server"/>

    <p>

    <Acme:Address id="BillAddr" Caption="Billing Address" runat="server"/>

    <p>

    <asp:button Text="Submit Form" OnClick="SubmitBtn_Click" runat=server/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>