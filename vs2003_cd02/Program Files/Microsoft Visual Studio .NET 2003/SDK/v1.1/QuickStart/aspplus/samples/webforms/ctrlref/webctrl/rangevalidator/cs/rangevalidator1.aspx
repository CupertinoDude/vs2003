<%@ Page clienttarget=downlevel %>

<html>
<head>
    <script language="C#" runat="server">

        void Button1_Click(Object sender, EventArgs e) {
           rangeValInteger.Validate();
           if (rangeValInteger.IsValid) {
               lblOutput1.Text = "Result: Valid!";
           } else {
               lblOutput1.Text = "Result: Not Valid!";
           }

           rangeValDate.Validate();
           if (rangeValDate.IsValid) {
               lblOutput2.Text = "Result: Valid!";
           } else {
               lblOutput2.Text = "Result: Not Valid!";
           }

           rangeValString.Validate();
           if (rangeValString.IsValid) {
               lblOutput3.Text = "Result: Valid!";
           } else {
               lblOutput3.Text = "Result: Not Valid!";
           }

           if (Page.IsValid) {
              lblOutput.Text = "Result: Page Valid!";
           } else {
              lblOutput.Text = "Result: Page Not valid!";
           }
        }

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
