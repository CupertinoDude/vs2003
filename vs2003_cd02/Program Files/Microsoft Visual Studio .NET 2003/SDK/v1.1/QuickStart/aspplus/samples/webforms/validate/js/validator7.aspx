<%@ Page clienttarget="downlevel" %>

<html>
<head>

    <script language="JScript" runat=server>

        function ValidateBtn_Click(Sender : Object , e : EventArgs) : void {
 
            if (Page.IsValid) {
               lblOutput.Text = "Page is valid!";
            }
            else {
               lblOutput.Text = "Page is not valid! :-(";
            }
        }

   </script>

</head>
<body>

<h3><font face="Verdana">More Regular Expression Examples</font></h3>
<p>

<form runat="server">

    <table cellpadding=10>
    <tr valign="top">
      <td colspan=3>
        <asp:Label ID="lblOutput" Text="Enter values for each field" Font-Name="Verdana" Font-Size="10pt" runat="server" />
      </td>
    </tr>

    <tr>
      <td colspan=3>
      <font face=Verdana size=2><b>Personal Information</b></font>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Email:</font>
      </td>
      <td>
        <ASP:TextBox id=TextBox1 runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
            ControlToValidate="TextBox1"
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="10pt"
            >
            *
        </asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server"
            ControlToValidate="TextBox1"
            ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
            Display="Static"
            Font-Name="verdana" Font-Size="10pt">
                Please enter a valid e-mail address
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Phone:</font>
      </td>
      <td>
        <ASP:TextBox id=TextBox2 runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
            ControlToValidate="TextBox2"
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="10pt">
            *
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator id="RegularExpressionValidator2"
            ControlToValidate="TextBox2"
            ValidationExpression="(^x\s*[0-9]{5}$)|(^(\([1-9][0-9]{2}\)\s)?[1-9][0-9]{2}-[0-9]{4}(\sx\s*[0-9]{5})?$)"
            Display="Static"
            Font-Name="verdana" Font-Size="10pt"
            runat=server>
               Must be in form: (XXX) XXX-XXXX
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Zip Code:</font>
      </td>
      <td>
        <ASP:TextBox id=TextBox3 runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
            ControlToValidate="TextBox3"
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="10pt">
              *
        </asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator id="RegularExpressionValidator3"
            ControlToValidate="TextBox3"
            ValidationExpression="^\d{5}$"
            Display="Static"
            Width="100%"
            Font-Name="verdana" Font-Size="10pt"
            runat=server>
               Zip code must be 5 numeric digits
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <ASP:Button text="Validate" OnClick="ValidateBtn_Click" runat=server />
      </td>
      <td></td>
    </tr>
    </table>

</form>

</body>
</html>
