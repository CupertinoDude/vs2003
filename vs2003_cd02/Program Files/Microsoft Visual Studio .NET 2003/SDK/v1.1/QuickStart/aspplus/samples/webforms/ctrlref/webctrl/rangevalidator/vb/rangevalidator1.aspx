<%@ Page clienttarget=downlevel %>

<html>
<head>
    <script language="VB" runat="server">

        Sub Button1_Click(sender As Object, e As EventArgs)
           rangeValInteger.Validate()
           If (rangeValInteger.IsValid) Then
               lblOutput1.Text = "Result: Valid!"
           Else
               lblOutput1.Text = "Result: Not Valid!"
           End If

           rangeValDate.Validate()
           If (rangeValDate.IsValid) Then
               lblOutput2.Text = "Result: Valid!"
           Else
               lblOutput2.Text = "Result: Not Valid!"
           End If

           rangeValString.Validate()
           If (rangeValString.IsValid) Then
               lblOutput3.Text = "Result: Valid!"
           Else
               lblOutput3.Text = "Result: Not Valid!"
           End If

           If (Page.IsValid) Then
              lblOutput.Text = "Result: Page Valid!"
           Else
              lblOutput.Text = "Result: Page Not valid!"
           End If
        End Sub

   </script>

</head>
<body>

    <h3><font face="Verdana">RangeValidator Sample</font></h3>
    <p>

    <form runat="server">

      <table bgcolor="#eeeeee" cellpadding=10>
      <tr valign="top">
        <td>
            <h5><font face="Verdana">Value to Check:</font></h5>
            <asp:TextBox Selected id="txtComp1" runat="server"/>
        </td>
        <td>
            <h5><font face="Verdana">Data Type: Integer Min(1), Max(10)</font></h5>
        </td>
        <td>
             <asp:Label id="lblOutput1" Font-Name="verdana" Font-Size="10pt" runat="server" />
        </td>
      </tr>
      <tr valign="top">
        <td>
            <h5><font face="Verdana">Value to Check:</font></h5>
            <asp:TextBox Selected id="txtComp2" runat="server"/>
        </td>
        <td>
            <h5><font face="Verdana">Data Type: Date Min(2000/1/1), Max(2001/1/1)</font></h5>
        </td>
        <td>
             <asp:Label id="lblOutput2" Font-Name="verdana" Font-Size="10pt" runat="server" />
        </td>
      </tr>
      <tr valign="top">
        <td>
            <h5><font face="Verdana">Value to Check:</font></h5>
            <asp:TextBox Selected id="txtComp3" runat="server"/>
        </td>
        <td>
            <h5><font face="Verdana">Data Type: String Min(Aardvark), Max(Zebra)</font></h5>
        </td>
        <td>
             <asp:Label id="lblOutput3" Font-Name="verdana" Font-Size="10pt" runat="server" />
        </td>
      </tr>
     </table>

     <asp:Button Text="Validate" ID="Button1" onclick="Button1_Click" runat="server" />

     <asp:RangeValidator
        id="rangeValInteger"
        Type="Integer"
        ControlToValidate="txtComp1"
        MaximumValue="10"
        MinimumValue="1"
        runat="server"/>

     <asp:RangeValidator
        id="rangeValDate"
        Type="Date"
        ControlToValidate="txtComp2"
        MaximumValue="2001/1/1"
        MinimumValue="2000/1/1"
        runat="server"/>

     <asp:RangeValidator
        id="rangeValString"
        Type="String"
        ControlToValidate="txtComp3"
        MaximumValue="Zebra"
        MinimumValue="Aardvark"
        runat="server"/>
     <br>

     <asp:Label id="lblOutput" Font-Name="verdana" Font-Size="10pt" runat="server" />

    </form>

</body>
</html>
