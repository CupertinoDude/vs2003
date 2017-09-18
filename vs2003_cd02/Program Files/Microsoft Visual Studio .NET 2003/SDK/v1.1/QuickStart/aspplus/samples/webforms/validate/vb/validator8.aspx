<html>
<head>
    <script language="VB" runat="server">

        Sub ValidateBtn_OnClick(sender As Object, e As EventArgs)
            If (Page.IsValid) Then
              lblOutput.Text = "Page is Valid!"
           Else
              lblOutput.Text = "Page is InValid! :-("
           End If
        End Sub

        Sub ServerValidate (sender As Object, value As ServerValidateEventArgs)
            Try
                Dim num As Int32 = Int32.Parse(value.Value)
                If num Mod 2 = 0 Then
                    value.IsValid = True
                    Exit Sub
                End If
            Catch exc As Exception
            End Try

            value.IsValid = False
        End Sub

   </script>

</head>
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
        OnServerValidate="ServerValidate"
        Display="Static"
        Font-Name="verdana" Font-Size="10pt">
           Not an even number!
    </asp:CustomValidator>

    <p>

    <asp:Button text="Validate" onclick="ValidateBtn_OnClick" runat="server" />

    <script language="javascript">

       function ClientValidate(source, arguments)
       {
          // even number?
          if (arguments.Value%2 == 0)
            arguments.IsValid = true;
          else
            arguments.IsValid = false;
       }

    </script>

</form>


</body>
</html>
