<html>
<head>
    <script language="VB" runat="server">

    Dim m_id as String

    Sub Page_Load(sender As Object, e As EventArgs) 
        If Not Request.QueryString("id") Is Nothing
            m_id = HttpUtility.HtmlEncode(Request.QueryString("id"))
        Else
            m_id = "(No Selection)"
        End If
    End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Details Page for HyperLink</font></h3>

    <h4><font face="Verdana">You selected <u><%= m_id %></u></font></h4>

</body>
</html>
