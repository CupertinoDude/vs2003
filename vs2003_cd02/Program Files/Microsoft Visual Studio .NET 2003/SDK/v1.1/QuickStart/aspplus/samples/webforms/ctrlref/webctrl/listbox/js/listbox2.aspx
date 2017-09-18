<html>
<head>

    <script language="JScript" runat="server">

        function Page_Load(sender:Object, e:EventArgs) : void {

            if (!IsPostBack) {

               var values:ArrayList = new ArrayList();

               values.Add ("IN");
               values.Add ("KS");
               values.Add ("MD");
               values.Add ("MI");
               values.Add ("OR");
               values.Add ("TN");

               ListBox1.DataSource = values;
               ListBox1.DataBind();
            }
        }

        function SubmitBtn_Click(sender:Object, e:EventArgs) : void {
            if ( ListBox1.SelectedIndex > -1 ) {
                Label1.Text = "You chose: " + ListBox1.SelectedItem.Text;
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding ListBox</font></h3>

    <form runat=server>
    
        <asp:ListBox id="ListBox1" Width="100px" runat="server"/>

        <asp:button Text="Submit" OnClick="SubmitBtn_Click" runat="server" />
        
        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="10pt" runat="server"/>

    </form>

</body>
</html>

