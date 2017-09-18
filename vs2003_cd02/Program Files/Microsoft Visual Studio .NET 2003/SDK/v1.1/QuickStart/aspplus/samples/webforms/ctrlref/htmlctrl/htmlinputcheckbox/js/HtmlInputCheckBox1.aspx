<html>
<head>

    <script language="JScript" runat="server">

       function Button1_Click(Source:Object, e:EventArgs) : void {

          if (Check1.Checked == true) {
             Span1.InnerHtml = "Check1 is checked!";
          }
          else {
             Span1.InnerHtml = "Check1 is not checked!";
          }
       }

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


