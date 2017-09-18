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

               DropDown1.DataSource = values;
               DropDown1.DataBind();
            }
        }

        function SubmitBtn_Click(sender:Object, e:EventArgs) : void {
           Label1.Text = "You chose: " + DropDown1.SelectedItem.Text;
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding DropDownList</font></h3>

    <form runat=server>
    
        <asp:DropDownList id="DropDown1" runat="server" />

        <asp:button Text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="10pt" runat="server" />

    </form>

</body>
</html>

