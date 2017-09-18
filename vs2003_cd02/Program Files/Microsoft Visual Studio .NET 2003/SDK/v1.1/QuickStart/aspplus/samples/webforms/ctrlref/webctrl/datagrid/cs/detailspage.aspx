<html>
<head>

<script language="C#" runat="server">

    string id;

    void Page_Load(Object sender, EventArgs e) {
        if ( Request.QueryString["id"] != null )
        {
            id = HttpUtility.HtmlEncode(Request.QueryString["id"]);
        }
        else
        {
            id = "(No Selection)";
        }
    }

</script>

</head>
<body>

    <h3><font face="Verdana">Details page for DataGrid</font></h3>

    <h4><font face="Verdana">You selected <u>Item <%= id %></u></font></h4>

</body>
</html>
