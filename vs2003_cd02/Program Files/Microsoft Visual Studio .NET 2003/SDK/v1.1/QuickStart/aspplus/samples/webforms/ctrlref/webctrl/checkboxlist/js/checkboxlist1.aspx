<html>
<head>

    <script language="JScript" runat="server">

        function Button1_Click(sender:Object, e:EventArgs) : void {

            var s:String = "Selected items:<br>";

            for (var i:int=0; i < Check1.Items.Count; i++) {
                if ( Check1.Items[ i ].Selected ) {
                    // List the selected items
                    s = s + Check1.Items[i].Text;
                    s = s + "<br>";
                }    
            }

            Label1.Text = s;
        }

        function chkLayout_CheckedChanged(sender:Object, e:EventArgs) : void {

            if (chkLayout.Checked == true) {
                Check1.RepeatLayout = RepeatLayout.Table;
            } else {
                Check1.RepeatLayout = RepeatLayout.Flow;
            }     
        }
       
        function chkDirection_CheckedChanged(sender:Object, e:EventArgs) : void {
       
            if (chkDirection.Checked == true) {
                Check1.RepeatDirection = RepeatDirection.Horizontal;
            } else {
                Check1.RepeatDirection = RepeatDirection.Vertical;
            }  
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">CheckBoxList Example</font></h3>

    <form runat=server>

        <asp:CheckBoxList id=Check1 runat="server">
            <asp:ListItem>Item 1</asp:ListItem>
            <asp:ListItem>Item 2</asp:ListItem>
            <asp:ListItem>Item 3</asp:ListItem>
            <asp:ListItem>Item 4</asp:ListItem>
            <asp:ListItem>Item 5</asp:ListItem>
            <asp:ListItem>Item 6</asp:ListItem>
        </asp:CheckBoxList>

        <p>
        
        <asp:CheckBox id=chkLayout OnCheckedChanged="chkLayout_CheckedChanged" Text="Display Table Layout" Checked=true AutoPostBack="true" runat="server" />

        <br>
        
        <asp:CheckBox id=chkDirection OnCheckedChanged="chkDirection_CheckedChanged" Text="Display Horizontally" AutoPostBack="true" runat="server" />

        <p>
        
        <asp:Button id=Button1 Text="Submit" onclick="Button1_Click" runat="server"/>

        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="8pt" runat="server"/>

    </form>

</body>
</html>
