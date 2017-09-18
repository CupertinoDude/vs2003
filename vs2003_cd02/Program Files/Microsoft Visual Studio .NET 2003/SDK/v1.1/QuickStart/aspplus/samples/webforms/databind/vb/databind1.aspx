<html>
<head>
    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs) 
            Page.DataBind
        End Sub
        
        ReadOnly Property custID() As String
            Get
                Return "ALFKI"
            End Get
        End Property
        
        ReadOnly Property orderCount() As Integer
            Get
                Return 11
            End Get
        End Property    

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
