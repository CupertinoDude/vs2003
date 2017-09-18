<html>
<head>

    <script language="VB" runat="server">

       Sub Page_Load(sender As Object, e As EventArgs) 

          If IsPostBack Then
             Span1.InnerHtml="Hidden value: <b>" & HiddenValue.Value & "</b>"
          End If
       End Sub

       Sub SubmitBtn_Click(sender As Object, e As EventArgs) 

          HiddenValue.Value = StringContents.Value
       End Sub

    </script>

</head>

<body>

    <h3><font face="Verdana">Simple HtmlInputHidden Sample</font></h3>

    <form runat=server>

        <input id="HiddenValue" type=hidden value="Initial Value" runat=server>

        Enter a string: <input id="StringContents" type=text size=40 runat=server>

        <p>
        <input type=submit value="Enter" OnServerClick="SubmitBtn_Click" runat=server>

        <p>
        <span id=Span1 runat=server>This label will display the previously entered string.</span>

    </form>

</body>
</html>


