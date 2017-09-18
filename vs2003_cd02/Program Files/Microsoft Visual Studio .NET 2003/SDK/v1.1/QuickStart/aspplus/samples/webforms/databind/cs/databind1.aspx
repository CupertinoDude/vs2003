<html>
<head>
    <script language="C#" runat="server">

        void Page_Load(Object sender, EventArgs e) {
            Page.DataBind();
        }
        
        string custID{
            get {
                return "ALFKI";
            }
        }
        
        int orderCount{
            get {
                return 11;
            }
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
