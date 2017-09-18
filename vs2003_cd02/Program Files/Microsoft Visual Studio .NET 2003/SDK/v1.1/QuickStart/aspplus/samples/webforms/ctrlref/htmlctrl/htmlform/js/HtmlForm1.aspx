<html>

<head>

    <script language="JScript" runat="server">

       function Button1_OnClick(Source:Object, e:EventArgs) : void {
          Span1.InnerHtml="You clicked Button1";
       }

       function Button2_OnClick(Source:Object, e:EventArgs) : void {
          Span2.InnerHtml="You clicked Button2";
       }

       function Button3_OnClick(Source:Object, e:EventArgs) : void {
          Span3.InnerHtml="You clicked Button3";
       }

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


