<html>
<head>

    <script language="VB" runat="server">

       Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
            Span1.InnerHtml = "You wrote: <br>" & TextArea1.Value
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">HtmlTextArea Example</font></h3>

    <form runat=server>

      <font face="Verdana" size="-1">

        What do you like best about ASP.NET?: <br>

        <textarea id="TextArea1" cols=40 rows=4 runat=server />

        <input type=submit value="Submit" OnServerClick="SubmitBtn_Click" runat=server>

        <p>

        <span id="Span1" runat="server" />

      </font>

    </form>

</body>
</html>

