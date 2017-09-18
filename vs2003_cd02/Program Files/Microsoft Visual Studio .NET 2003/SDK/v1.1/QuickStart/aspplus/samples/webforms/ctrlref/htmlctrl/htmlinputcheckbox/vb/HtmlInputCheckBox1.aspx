<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs) 

          If Check1.Checked Then
             Span1.InnerHtml = "Check1 is checked!"
          Else 
             Span1.InnerHtml = "Check1 is not checked!"
          End If
       End Sub

    </script>

</head>

<body>

    <h3><font face="Verdana">HtmlInputCheckBox Sample</font></h3>

    <form runat=server>

        <input id="Check1" type=checkbox runat="server"> CheckBox1 &nbsp;&nbsp;

        <span id=Span1 style="color:red" runat=server />

        <p>

        <input type=button id="Button1" value="Enter" OnServerClick="Button1_Click" runat=server>

    </form>

</body>
</html>


