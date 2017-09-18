<html>
<head>
    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs) 
          If RadioButtonList1.SelectedIndex > -1 Then
              Label1.Text = "You selected: " & RadioButtonList1.SelectedItem.Text
          End If
       End Sub

       Sub chkLayout_CheckedChanged(sender As Object, e As EventArgs) 
          If chkLayout.Checked = True Then
             RadioButtonList1.RepeatLayout = RepeatLayout.Table
          Else
             RadioButtonList1.RepeatLayout = RepeatLayout.Flow
          End If   
       End Sub
       
       Sub chkDirection_CheckedChanged(sender As Object, e As EventArgs) 
          If chkDirection.Checked = True Then
             RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal
          Else
             RadioButtonList1.RepeatDirection = RepeatDirection.Vertical
          End If
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">RadioButtonList Example</font></h3>

    <form runat=server>

        <asp:RadioButtonList id=RadioButtonList1 runat="server">
            <asp:ListItem>Item 1</asp:ListItem>
            <asp:ListItem>Item 2</asp:ListItem>
            <asp:ListItem>Item 3</asp:ListItem>
            <asp:ListItem>Item 4</asp:ListItem>
            <asp:ListItem>Item 5</asp:ListItem>
            <asp:ListItem>Item 6</asp:ListItem>
        </asp:RadioButtonList>

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
