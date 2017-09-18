<%@ Page CodeBehind="validator8.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Validate.Vb.validator8" %>

<html>
<body>

<h3><font face="Verdana">CustomValidator Example</font></h3>
<p>

<form runat="server">

    <asp:Label id=lblOutput runat="server" Text="Enter an even number:" Font-Name="Verdana" Font-Size="10pt" /><br>

    <p>

    <asp:TextBox id=Text1 runat="server" />
    
    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
        ControlToValidate="Text1" 
        ErrorMessage="Please enter a number"
        Display="Dynamic"
        Font-Name="verdana" Font-Size="10pt">
    </asp:RequiredFieldValidator>

    <asp:CustomValidator id="CustomValidator1" runat="server"
        ControlToValidate="Text1"
        ClientValidationFunction="ClientValidate"
        Display="Static"
        Font-Name="verdana" Font-Size="10pt">
           Not an even number!
    </asp:CustomValidator>

    <p>

    <asp:Button id=ValidateBtn text="Validate" runat="server" />

    <script language="javascript">

       function ClientValidate(source, value)
       {
          // even number?
          if (value%2 == 0)
            return true;
          else
            return false;
       }

    </script>

</form></p>


</body>
 </html>
