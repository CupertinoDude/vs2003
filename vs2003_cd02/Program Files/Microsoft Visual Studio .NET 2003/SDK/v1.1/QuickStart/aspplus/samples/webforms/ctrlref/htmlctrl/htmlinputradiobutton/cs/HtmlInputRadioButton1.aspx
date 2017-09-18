<html>
<head>

    <script language="C#" runat="server">

       void Button1_Click(object Source, EventArgs e) {

          if (Radio1.Checked == true)
             Span1.InnerHtml = "Radio1 is checked";
          else if (Radio2.Checked == true)
             Span1.InnerHtml = "Radio2 is checked";
          else if (Radio3.Checked == true)
             Span1.InnerHtml = "Radio3 is checked";
       }

    </script>

</head>
<body>

    <h3><font face="Verdana">Simple HtmlInputRadioButton Sample</font></h3>

    <form runat=server>

        <input type="radio" id="Radio1" name="Mode" runat="server"/>Option 1<br>
        <input type="radio" id="Radio2" name="Mode" runat="server"/>Option 2<br>
        <input type="radio" id="Radio3" name="Mode" runat="server"/>Option 3

        <p>
        <span id=Span1 runat=server />

        <p>
        <input type=button id="Button1" value="Enter" OnServerClick="Button1_Click" runat=server>

    </form>

</body>
</html>


