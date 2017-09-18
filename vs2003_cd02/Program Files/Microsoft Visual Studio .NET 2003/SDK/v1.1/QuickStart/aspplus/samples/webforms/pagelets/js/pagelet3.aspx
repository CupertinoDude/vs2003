<%@ Register TagPrefix="Acme" TagName="Address" Src="pagelet3.ascx" %>

<html>

    <script language="JScript" runat="server">

        function SubmitBtn_Click(sender : Object,  E : EventArgs) : void {
        
            MyLabel.Text += "<b>Shipping Address:</b> "
                         +   ShipAddr.Address + ", " 
                         +   ShipAddr.City + ", " 
                         +   ShipAddr.StateName + ", " 
                         +   ShipAddr.Zip + "<br>";

            MyLabel.Text += "<b>Billing Address:</b> "
                         +   BillAddr.Address + ", " 
                         +   BillAddr.City + ", " 
                         +   BillAddr.StateName + ", " 
                         +   BillAddr.Zip + "<br>";
        }

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