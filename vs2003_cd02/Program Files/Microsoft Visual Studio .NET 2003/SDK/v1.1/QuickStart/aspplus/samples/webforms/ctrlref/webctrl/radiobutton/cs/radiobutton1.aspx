<html>
<head>

    <script language="C#" runat="server">

        void SubmitBtn_Click(Object Sender, EventArgs e) {
        
            if (Radio1.Checked) {
                Label1.Text = "You selected " + Radio1.Text;
            }
            else if (Radio2.Checked) {
                Label1.Text = "You selected " + Radio2.Text;
            }
            else if (Radio3.Checked) {
                Label1.Text = "You selected " + Radio3.Text;
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">RadioButton Example</font></h3>

    <form runat=server>
    
        <h4>Select the type of installation you wish to perform:</h4>
    
        <asp:RadioButton id=Radio1 Text="Typical" Checked="True" GroupName="RadioGroup1" runat="server" /><br>
        
        This option installs the features most typically used.  <i>Requires 1.2 MB disk space.</i><p>
            
        <asp:RadioButton id=Radio2 Text="Compact" GroupName="RadioGroup1" runat="server"/><br>
        
        This option installs the minimum files required to run the product.  <i>Requires 350 KB disk space.</i><p>
         
        <asp:RadioButton id=Radio3 runat="server" Text="Full" GroupName="RadioGroup1" /><br>
        
        This option installs all features for the product.  <i>Requires 4.3 MB disk space.</i><p>

        <asp:button text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <asp:Label id=Label1 font-bold="true" runat="server" />
            
    </form>

</body>
</html>
