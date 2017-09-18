<%@ Page Language="JScript" %>

<html>
<head>
    <script runat="server">

    public var id:String;

    protected function Page_Load(Sender:Object, e:EventArgs) : void
    {
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

    <h3><font face="Verdana">Details page for HtmlAnchor</font></h3>

    <h4><font face="Verdana">You selected <u><%= id %></u></font></h4>

</body>
</html>
