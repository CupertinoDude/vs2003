<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs) 
            If Not IsPostBack Then

               Dim values as ArrayList= new ArrayList()

               values.Add ("IN")
               values.Add ("KS")
               values.Add ("MD")
               values.Add ("MI")
               values.Add ("OR")
               values.Add ("TN")

               ListBox1.DataSource = values
               ListBox1.DataBind
            End If
        End Sub

        Sub SubmitBtn_Click(sender As Object, e As EventArgs)
            If ListBox1.SelectedIndex > -1 Then
                Label1.Text = "You chose: " + ListBox1.SelectedItem.Text
            End If
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding ListBox</font></h3>

    <form runat=server>
    
        <asp:ListBox id="ListBox1" Width="100px" runat="server" />

        <asp:button Text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="10pt" runat="server" />

    </form>

</body>
</html>

