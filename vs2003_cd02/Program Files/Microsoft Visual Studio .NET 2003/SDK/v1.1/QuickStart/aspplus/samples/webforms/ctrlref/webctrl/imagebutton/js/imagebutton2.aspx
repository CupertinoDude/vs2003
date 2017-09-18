<html>
<head>

    <script language="JScript" runat="server">

        function ImageButton1_OnClick(sender:Object, e:ImageClickEventArgs) : void {
            var x:int=e.X;
            var y:int=e.Y;

            Label1.Text = "X: " + x.ToString();
            Label2.Text = "Y: " + y.ToString();

            if ( x >= 60 ) {
                Label3.Text = "You clicked on the Purple Rain!";
            } else {
                Label3.Text = "You clicked on some Extreme Orange!";
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Using ImageButton as an Image Map</font></h3>

    <form runat=server>

        <table width="100%" border=0>
          <tr>
            <td width="25%">
                <asp:ImageButton id=Button1 ImageUrl="/quickstart/aspplus/images/imagebutton4.gif" BorderWidth="2px" onclick="ImageButton1_OnClick" runat="server" />
            </td>
            <td>
                <asp:Label id=Label1 Text="X:" runat="SERVER"/>

                <br>

                <asp:Label id=Label2 Text="Y:" runat="SERVER"/>
            </td>
          </tr>
        </table>

        <asp:Label id=Label3 font-bold="true" Text="" runat="SERVER"/>

    </form>

</body>
</html>


