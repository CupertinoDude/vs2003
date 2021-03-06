<%@ Page Language="JScript" %>

<html>
<body>

    <h3><font face="Verdana">Sign In Form Validation Sample</font></h3>

    <form method=post runat=server>
    <hr width=600 size=1 noshade>

    <center>
    <asp:ValidationSummary ID="valSum" runat="server"
        HeaderText="You must enter a valid value in the following fields:"
        DisplayMode="SingleParagraph"
        Font-Name="verdana"
        Font-Size="12"
        />
    <p>

    <!-- sign-in -->
    <table border=0 width=600>
    <tr><td colspan=3>
        <table border=0 cellpadding=0 cellspacing=0 width="100%">
        <tr><td>
            <font face=geneva,arial size=-1><b>Sign-In Information</b></font>
        </td></tr>
        </table>
    </td></tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Email Address:</font>
      </td>
      <td>
        <asp:TextBox id=email width=200px maxlength=60 runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="emailReqVal"
            ControlToValidate="email"
            ErrorMessage="Email. "
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="12"
            runat=server>
            *
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator id="emailRegexVal"
            ControlToValidate="email"
            ErrorMessage="Email. "
            Display="Static"
            ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
            Font-Name="Arial" Font-Size="11"
            runat=server>
            Not a valid e-mail address.  Must follow email@host.domain.
        </asp:RegularExpressionValidator>
      </td>
    </tr>

    <tr>
      <td align=right>
        <font face=Arial size=2>Password:</font>
      </td>
      <td>
        <asp:TextBox id=passwd TextMode="Password" maxlength=20 runat=server/>
      </td>
      <td>
          <asp:RequiredFieldValidator id="passwdReqVal"
              ControlToValidate="passwd"
              ErrorMessage="Password. "
              Display="Dynamic"
              Font-Name="Verdana" Font-Size="12"
              runat=server>
              *
          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator id="passwdRegexBal"
              ControlToValidate="passwd"
              ErrorMessage="Password. "
              ValidationExpression=".*[!@#$%^&*+;:].*"
              Display="Static"
              Font-Name="Arial" Font-Size="11"
              Width="100%" runat=server>
              Password must include one of these (!@#$%^&amp;*+;:)
          </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Re-enter Password:</font>
      </td>
      <td>
        <asp:TextBox id=passwd2 TextMode="Password" maxlength=20 runat=server/>
      </td>
      <td>
        <asp:RequiredFieldValidator id="passwd2ReqVal"
            ControlToValidate="passwd2"
            ErrorMessage="Re-enter Password. "
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="12"
            runat=server>
            *
        </asp:RequiredFieldValidator>
        <asp:CompareValidator id="CompareValidator1"
            ControlToValidate="passwd2" ControlToCompare="passwd"
            ErrorMessage="Re-enter Password. "
           Display="Static"
            Font-Name="Arial" Font-Size="11"
            runat=server>
            Password fields don't match
        </asp:CompareValidator>
      </td>
    </tr>
    <tr><td colspan=3>&nbsp;</td></tr>


    <!-- personalization information -->
    <tr><td colspan=3>
        <table border=0 cellpadding=0 cellspacing=0 width="100%">
        <tr><td><font face=geneva,arial size=-1>
            <b>Personal Information</b></font>
        </td></tr>
        </table>
    </td></tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>First Name:</font>
      </td>
      <td>
        <asp:TextBox id=fn maxlength=20 width=200px runat=server />
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Last Name:</font>
      </td>
      <td>
        <asp:TextBox id=ln maxlength=40 width=200px runat=server />
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Address:</font>
      </td>
      <td>
        <asp:TextBox id=address width=200px runat=server />
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>State:</font>
      </td>
      <td>
        <asp:TextBox id=state width=30px maxlength=2 runat=server />&nbsp;
        <font face=Arial size=2>Zip Code:</font>&nbsp;
        <ASP:TextBox id=zip width=60px maxlength=5 runat=server />
      </td>
      <td>
        <asp:RegularExpressionValidator id="RegularExpressionValidator1"
            ControlToValidate="zip"
            ErrorMessage="Zip Code. "
            ValidationExpression="^\d{5}$"
            Display="Static"
            Font-Name="Arial" Font-Size="11"
            runat=server>
            Zip code must be 5 numeric digits
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Phone:</font>
      </td>
      <td>
        <asp:TextBox id="phone" maxlength=20 runat="server" />
      </td>
      <td>
        <asp:RequiredFieldValidator id="phoneReqVal"
            ControlToValidate="phone"
            ErrorMessage="Phone. "
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="12"
            runat=server>
            *
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator id="phoneRegexVal"
            ControlToValidate="phone"
            ErrorMessage="Phone. "
            ValidationExpression="(^x\s*[0-9]{5}$)|(^(\([1-9][0-9]{2}\)\s)?[1-9][0-9]{2}-[0-9]{4}(\sx\s*[0-9]{5})?$)"
            Display="Static"
            Font-Name="Arial" Font-Size="11"
            runat=server>
            Must be in form: (XXX) XXX-XXXX
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr><td colspan=3>&nbsp;</td></tr>

    <!-- Credit Card Info -->
    <tr>
      <td colspan=3>
      <font face=Arial size=2><b>Credit Card Information</b></font>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Card Type:</font>
      </td>
      <td>
        <ASP:RadioButtonList id=ccType Font-Name="Arial" RepeatLayout="Flow" runat=server>
            <asp:ListItem>MasterCard</asp:ListItem>
            <asp:ListItem>Visa</asp:ListItem>
        </ASP:RadioButtonList>
      </td>
      <td>
        <asp:RequiredFieldValidator id="ccTypeReqVal"
            ControlToValidate="ccType"
            ErrorMessage="Card Type. "
            Display="Static"
            InitialValue=""
            Font-Name="Verdana" Font-Size="12"
            runat=server>
            *
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Card Number:</font>
      </td>
      <td>
        <ASP:TextBox id="ccNum" runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="ccNumReqVal"
            ControlToValidate="ccNum"
            ErrorMessage="Card Number. "
            Display="Dynamic"
            Font-Name="Verdana" Font-Size="12"
            runat=server>
            *
        </asp:RequiredFieldValidator>
        <asp:CustomValidator id="ccNumCustVal"
            ControlToValidate="ccNum"
            ErrorMessage="Card Number. "
            clientvalidationfunction="ccClientValidate"
            Display="Static"
            Font-Name="Arial" Font-Size="11"
            runat=server>
            Not a valid credit card number.  Must contain 16 digits.
        </asp:CustomValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Arial size=2>Expiration Date:</font>
      </td>
      <td>
        <ASP:DropDownList id=expDate runat=server>
            <asp:ListItem></asp:ListItem>
            <asp:ListItem >06/00</asp:ListItem>
            <asp:ListItem >07/00</asp:ListItem>
            <asp:ListItem >08/00</asp:ListItem>
            <asp:ListItem >09/00</asp:ListItem>
            <asp:ListItem >10/00</asp:ListItem>
            <asp:ListItem >11/00</asp:ListItem>
            <asp:ListItem >01/01</asp:ListItem>
            <asp:ListItem >02/01</asp:ListItem>
            <asp:ListItem >03/01</asp:ListItem>
            <asp:ListItem >04/01</asp:ListItem>
            <asp:ListItem >05/01</asp:ListItem>
            <asp:ListItem >06/01</asp:ListItem>
            <asp:ListItem >07/01</asp:ListItem>
            <asp:ListItem >08/01</asp:ListItem>
            <asp:ListItem >09/01</asp:ListItem>
            <asp:ListItem >10/01</asp:ListItem>
            <asp:ListItem >11/01</asp:ListItem>
            <asp:ListItem >12/01</asp:ListItem>
        </ASP:DropDownList>
      </td>
      <td>
        <asp:RequiredFieldValidator id="expDateReqVal"
          ControlToValidate="expDate"
          ErrorMessage="Expiration Date. "
          Display="Static"
          InitialValue=""
          Font-Name="Verdana" Font-Size="12"
          runat=server>
          *
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    </table>

    <p>
    <input runat="server" type=submit value="Sign In">
    <p>

    <hr width=600 size=1 noshade>

    <script language="javascript">

        function ccClientValidate(source, arguments)
        {
            var cc = arguments.Value;
            var ccSansSpace;
            var i, digits, total;

            // SAMPLE ONLY.  Not a real world actual credit card algo.
            // Based on ANSI X4.13, the LUHN formula (also known as the modulus 10 -- or mod 10 -- algorithm )
            // is used to generate and/or validate and verify the accuracy of some credit-card numbers.

            // Get the number, parse out any non digits, should have 16 left
            ccSansSpace = cc.replace(/\D/g, "");
            if(ccSansSpace.length != 16) {
                arguments.IsValid = false;
                return;   // invalid ccn
            }

            // Convert to array of digits
            digits = new Array(16);
            for(i=0; i<16; i++)
                digits[i] = Number(ccSansSpace.charAt(i));

            // Double & sum digits of every other number
            for(i=0; i<16; i+=2) {
                digits[i] *= 2;
                if(digits[i] > 9)   digits[i] -= 9;
            }

            // Sum the numbers
            total = 0;
            for(i=0; i<16; i++)     total += digits[i];

            // Results
            if( total % 10 == 0 )   {
                arguments.IsValid = true;
                return;    // valid ccn
            }
            else  {
                arguments.IsValid = false;
                return;   // invalid ccn
            }
        }

    </script>
</form>
</center>


</body>
</html>
