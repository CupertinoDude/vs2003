<html>
<head>

    <script language="JScript" runat="server">

       function Page_Load(Source:Object, e:EventArgs) : void {

          if (Page.IsPostBack) {
             Span1.InnerHtml="Hidden value: <b>" + HiddenValue.Value + "</b>";
          }
       }

       function SubmitBtn_Click(Source:Object, e:EventArgs) : void {

          HiddenValue.Value=StringContents.Value;
       }

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


