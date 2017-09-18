<html>
<head>

    <script language="VB" runat="server">

       Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
         If Password.Value = "ASP.NET" Then
            Span1.InnerHtml = "Password correct"
         Else
            Span1.InnerHtml = "That password is not correct"
         End If    
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Text and Password HtmlInputText Example</font></h3>

    <form runat=server>

        Enter Name: <input id="Name" type=text size=40 runat=server>

        <p>

        Enter Password: <input id="Password" type=password size=40 runat=server> &nbsp;(pssst! it's "ASP.NET")

        <p>
        <input type=submit value="Enter" OnServerClick="SubmitBtn_Click" runat=server>

        <p>
        <span id="Span1" style="color:red" runat=server></span>

    </form>

</body>
</html>


