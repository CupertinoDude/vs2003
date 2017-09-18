<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_OnClick(sender As Object, e As EventArgs)
          Span1.InnerHtml = "You clicked Button1"
       End Sub

       Sub Button2_OnClick(sender As Object, e As EventArgs)
          Span2.InnerHtml = "You clicked Button2"
       End Sub

       Sub Button3_OnClick(sender As Object, e As EventArgs)
          Span3.InnerHtml = "You clicked Button3"
       End Sub

    </script>

</head>

<body>

    <h3><font face="Verdana">Simple HtmlForm Sample</font></h3>

    <form id=ServerForm runat=server>

        <input value="Button 1" type="submit" id=Button1 
         runat="server" onServerClick="Button1_OnClick">

        &nbsp;&nbsp;

        <span id=Span1 runat=server />

        <p>

        <input value="Button 2" type="submit" id=Button2 
         runat="server" onServerClick="Button2_OnClick">

        &nbsp;&nbsp;

        <span id=Span2 runat=server />

        <p>

        <input value="Button 3" type="submit" id=Button3 
         runat="server" onServerClick="Button3_OnClick">

        &nbsp;&nbsp;

        <span id=Span3 runat=server />

    </form>

</body>

</html>


