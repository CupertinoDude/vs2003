<html>
<head>
    <script language="JScript" runat="server">

        function Page_Load(sender : Object, e : EventArgs) : void {
            Page.DataBind();
        }
        
        function get custID() : String {
            return "ALFKI";
        }
        
        function get orderCount() : int {
            return 11;
        }


    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding to a Property on the Page</font></h3>

    <form runat=server>
    
        Customer: <b><%# custID %></b><br>
        Open Orders: <b><%# orderCount %></b>

    </form>

</body>
</html>
