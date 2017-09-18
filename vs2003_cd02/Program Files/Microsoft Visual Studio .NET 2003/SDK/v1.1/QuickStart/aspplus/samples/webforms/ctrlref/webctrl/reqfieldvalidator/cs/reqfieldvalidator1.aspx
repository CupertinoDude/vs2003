<html>
<body>

    <h3><font face="Verdana">RequiredFieldValidator Example</font></h3>

    <form runat=server>

        Name: <asp:TextBox id=Text1 runat="server"/>

        <asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="Text1" Font-Name="Arial" Font-Size="11" runat="server">
            Required field!
        </asp:RequiredFieldValidator>

        <p>
        
        <asp:Button id="Button1" runat="server" Text="Validate" />

    </form>

</body>
</html>


