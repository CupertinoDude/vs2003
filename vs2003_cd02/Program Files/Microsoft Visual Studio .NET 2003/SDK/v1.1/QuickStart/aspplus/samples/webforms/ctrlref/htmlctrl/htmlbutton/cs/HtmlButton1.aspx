<html>

<head>
    <script language="C#" runat="server">

       void Button1_OnClick(object Source, EventArgs e) {

          Span1.InnerHtml="You clicked Button1";
       }

       void Button2_OnClick(object Source, EventArgs e) {

          Span1.InnerHtml="You clicked Button2";
       }

    </script>
</head>

<body>

    <h3><font face="Verdana">HtmlButton Sample</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">

        <p>
        <button id="Button1" onServerClick="Button1_OnClick" style="font: 8pt verdana;background-color:lightgreen;border-color:black;height=30;width:100" runat="server">
            <img src="/quickstart/aspplus/images/right4.gif"> Click me!
        </button>

        &nbsp;With embedded &lt;img&gt; tag
        <p>

        <button id=Button2 onServerClick="Button2_OnClick" 
                style="font: 8pt verdana;background-color:lightgreen;border-color:black;height=30;width:100"
                onmouseover="this.style.backgroundColor='yellow'"
                onmouseout="this.style.backgroundColor='lightgreen'"
                runat="server">

            Click me too!
        </button>

        &nbsp;With rollover effect

        <p>

        <span id=Span1 runat=server />

    </font>
    </form>

</body>
</html>

