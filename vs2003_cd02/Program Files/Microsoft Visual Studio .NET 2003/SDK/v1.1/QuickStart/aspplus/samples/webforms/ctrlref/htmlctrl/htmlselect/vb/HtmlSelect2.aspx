<html>
<head>

    <script language="VB" runat="server">

       Sub Page_Load(sender As Object, e As EventArgs) 
            If Not IsPostBack Then

               Dim values as ArrayList= new ArrayList()

               values.Add ("IN")
               values.Add ("KS")
               values.Add ("MD")
               values.Add ("MI")
               values.Add ("OR")
               values.Add ("TN")

               StateSelect.DataSource = values
               StateSelect.DataBind
            End If
        End Sub

        Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
           Span1.InnerHtml = "You chose: " & StateSelect.Value
        End Sub

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


