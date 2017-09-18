<html>
<head>

    <style>
        .applyBorder { border:0.2cm solid blue }
        .removeBorder { border:0.2cm solid gainsboro }
    </style>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As ImageClickEventArgs)
          Label1.Text="You clicked button1"
       End Sub

       Sub Button2_Click(sender As Object, e As ImageClickEventArgs)
          Label1.Text="You clicked button2"
       End Sub

       Sub Button3_Click(sender As Object, e As ImageClickEventArgs)
          Label1.Text="You clicked button3"
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Mouse-Over Effects on ImageButton</font></h3>

    <form runat=server>

        <asp:ImageButton id=Button1 runat="server"
            ImageUrl="/quickstart/aspplus/images/banana.jpg"
            BorderWidth="0.2cm"
            BorderColor="Gainsboro"
            onmouseover="this.style.border='0.2cm solid black';"
            onmouseout="this.style.border='0.2cm solid gainsboro';"
            onclick="Button1_Click" />

            &nbsp;&nbsp;
            Applies an inline CSS style...

        <br>

        <asp:ImageButton id=Button2 runat="server"
            ImageUrl="/quickstart/aspplus/images/banana.jpg"
            CssClass="removeBorder"
            onmouseover="this.className='applyBorder'"
            onmouseout="this.className='removeBorder'"
            onclick="Button2_Click" />

            &nbsp;&nbsp;
            Applies a predefined CSS style...

        <br>

        <asp:ImageButton id=Button3 runat="server"
            ImageUrl="/quickstart/aspplus/images/banana.jpg"
            BorderWidth="0.2cm"
            BorderColor="Gainsboro"
            onmouseover="this.src='/quickstart/aspplus/images/mango.jpg';"
            onmouseout="this.src='/quickstart/aspplus/images/banana.jpg';"
            onclick="Button3_Click" />

            &nbsp;&nbsp;
            Changes the source image...

        <p>
        
        <asp:Label id=Label1 runat=server />

    </form>

</body>
</html>


