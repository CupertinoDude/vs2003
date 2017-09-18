<html>
<head>
    <script language="VB" runat="server">

       Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
       
          If Check1.Checked = true Then
             Label1.Text = "Check1 is checked!"
          Else
             Label1.Text = "Check1 is not checked!"
          End If
          
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">CheckBox Example</font></h3>
    
    <form runat=server>

        <asp:CheckBox id=Check1 Text="CheckBox 1" runat="server" />

        &nbsp&nbsp

        <asp:button text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <p>
        
        <asp:Label id=Label1 font-name="arial" font-size="10pt" runat="server"/>
        
    </form>

</body>
</html>
