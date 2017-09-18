<html>
<head>

    <script language="JScript" runat="server">

       function Button1_Click(Source:Object, e:ImageClickEventArgs) : void {

          Span1.InnerHtml="You clicked button1";
       }

       function Button2_Click(Source:Object, e:ImageClickEventArgs) : void {

          Span1.InnerHtml="You clicked button2";
       }

    </script>

</head>
<body>

    <h3><font face="Verdana">HtmlInputImage Sample</font></h3>

    <form runat=server>

        <input type=image id="InputImage1" src="/quickstart/aspplus/images/mango.jpg" OnServerClick="Button1_Click" runat="server">
        
        <p>

        <input type=image id="InputImage2" src="/quickstart/aspplus/images/mango.jpg"
            onmouseover="this.src='/quickstart/aspplus/images/banana.jpg';"
            onmouseout="this.src='/quickstart/aspplus/images/mango.jpg';"
            OnServerClick="Button2_Click"
            runat="server">

        &nbsp;With rollover effect (HTML 4.0)

        <p>

        <span id=Span1 runat=server />

    </form>

</body>
</html>


