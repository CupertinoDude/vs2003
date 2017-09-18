<html>
<head>
    <script language="JScript" runat="server">

    var id:String;

    protected function Page_Load(sender:Object, e:EventArgs) : void {
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

    <h3><font face="Verdana">Details Page for HyperLink</font></h3>

    <h4><font face="Verdana">You selected <u><%= id %></u></font></h4>

</body>
</html>
