<html>
<head>

    <script language="JScript" runat="server">

       function Button1_Click(Source:Object, e:EventArgs) : void {
          Span1.InnerHtml="You clicked the button";
       }

    </script>

</head>

<body>

    <h3><font face="Verdana">Button HtmlInputButton</font></h3>

    <form runat=server>

        <p>

        <input type=button value="Button1" onServerClick="Button1_Click" runat="server">

        &nbsp;&nbsp;

        <span id=Span1 runat=server />

    </form>

</body>
</html>


