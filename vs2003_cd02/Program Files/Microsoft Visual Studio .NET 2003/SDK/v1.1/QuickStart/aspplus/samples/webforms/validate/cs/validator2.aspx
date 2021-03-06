<%@ Page ClientTarget=UpLevel %>

<html>
<head>

    <script language="C#" runat=server>

        void Page_Load() {
            if (!IsPostBack) {
                // Validate intially to force *s to appear before the first round-trip
                Validate();
            }
        }

        void ValidateBtn_Click(Object Sender, EventArgs E) {

           if (Page.IsValid == true) {
              lblOutput.Text = "Page is Valid!";
           }
           else {
              lblOutput.Text = "Some of the required fields are empty";
           }
        }

   </script>

</head>
<body>

<h3><font face="Verdana">Client-Side RequiredFieldValidator Sample</font></h3>
<p>


<form runat="server">

    <table bgcolor="#eeeeee" cellpadding=10>
    <tr valign="top">
      <td colspan=3>
        <asp:Label ID="lblOutput" Name="lblOutput" Text="Fill in the required fields below" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat=server /><br>
      </td>
    </tr>

    <tr>
      <td colspan=3>
      <font face=Verdana size=2><b>Credit Card Information</b></font>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Card Type:</font>
      </td>
      <td>
        <ASP:RadioButtonList id=RadioButtonList1 RepeatLayout="Flow" onclick="ClientOnChange();" runat=server>
            <asp:ListItem>MasterCard</asp:ListItem>
            <asp:ListItem>Visa</asp:ListItem>
        </ASP:RadioButtonList>
      </td>
      <td align=middle rowspan=1>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
            ControlToValidate="RadioButtonList1"
            ErrorMessage="*"
            Display="Static"
            InitialValue=""
            Width="100%">
        </asp:RequiredFieldValidator>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Card Number:</font>
      </td>
      <td>
        <ASP:TextBox id=TextBox1 onchange="ClientOnChange();" runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
            ControlToValidate="TextBox1"
            ErrorMessage="*"
            Display="Static"
            Width="100%">
        </asp:RequiredFieldValidator>

      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Expiration Date:</font>
      </td>
      <td>
        <ASP:DropDownList id=DropDownList1 onchange="ClientOnChange();" runat=server>
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
        <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
          ControlToValidate="DropDownList1"
          ErrorMessage="*"
          Display="Static"
          InitialValue=""
          Width="100%">
        </asp:RequiredFieldValidator>
      </td>
      <td>
    </tr>
    <tr>
      <td></td>
      <td>
        <ASP:Button id=Button1 text="Validate" OnClick="ValidateBtn_Click" runat="server" />
      </td>
      <td></td>
    </tr>
    </table>

</form>

<script language=javascript>
<!--
    function ClientOnChange() {
       if (typeof(Page_Validators) == "undefined")
          return;
       document.all["lblOutput"].innerText = Page_IsValid ? "Page is Valid!" : "Some of the required fields are empty";
    }
// -->
</script>


</body>
</html>
