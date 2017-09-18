<html>
<head>

    <script language="JScript" runat="server">

        function Page_Load(Sender:Object, E:EventArgs) : void {

            if (!IsPostBack) {

               var values:ArrayList = new ArrayList();

               values.Add ("IN");
               values.Add ("KS");
               values.Add ("MD");
               values.Add ("MI");
               values.Add ("OR");
               values.Add ("TN");

               StateSelect.DataSource = values;
               StateSelect.DataBind();
            }
        }

        function SubmitBtn_Click(sender:Object, e:EventArgs) : void {

           Span1.InnerHtml = "You chose: " + StateSelect.Value;
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding HtmlSelect</font></h3>

    <form runat=server>

        Select a state:<br>

        <select id="StateSelect" runat="server" />

        <input type="submit" value="Copy to span" OnServerClick="SubmitBtn_Click" runat="server">

        <p>

        <span id="Span1" runat="server" />

    </form>

</body>
</html>


