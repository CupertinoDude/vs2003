<html>
<head>

    <script language="C#" runat="server">

       void SubmitBtn_Click(object Source, EventArgs e) {

         if (Password.Value == "ASP.NET")
            Span1.InnerHtml="Password correct";
         else
            Span1.InnerHtml="That password is not correct";
       }

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


