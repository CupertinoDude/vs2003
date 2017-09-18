<html>
<head>
    <script language="JScript" runat="server">

       function SubmitBtn_Click(sender:Object, e:EventArgs) : void {
       
          if (Check1.Checked == true) {
             Label1.Text = "Check1 is checked!";
          }
          else {
             Label1.Text = "Check1 is not checked!";
          }
       }

    </script>

</head>
<body>

    <h3><font face="Verdana">CheckBox Example</font></h3>
    
    <form runat=server>

        <asp:CheckBox id=Check1 Text="CheckBox 1" runat="server" />

        &nbsp;&nbsp;

        <asp:button text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <p>
        
        <asp:Label id=Label1 font-name="arial" font-size="10pt" runat="server"/>
        
    </form>

</body>
</html>
