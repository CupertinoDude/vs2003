<html>
<head>

    <script language="VB" runat="server">

      Sub Button1_Click(sender As Object, e As EventArgs)
            
          Dim s As String = "Selected items:<br>"
          Dim i As Int32

          For i = 0 to Check1.Items.Count-1
              If Check1.Items(i).Selected Then 
                  ' List the selected items
                  s = s & Check1.Items(i).Text
                  s = s & "<br>"
              End If
          Next

          Label1.Text = s
       End Sub

       Sub chkLayout_CheckedChanged(sender As Object, e As EventArgs)
       
          If chkLayout.Checked = true Then
             Check1.RepeatLayout = RepeatLayout.Table
          Else
             Check1.RepeatLayout = RepeatLayout.Flow
          End If
       End Sub
       
       Sub chkDirection_CheckedChanged(sender As Object, e As EventArgs) 
       
          If chkDirection.Checked = true Then
             Check1.RepeatDirection = RepeatDirection.Horizontal
          Else
             Check1.RepeatDirection = RepeatDirection.Vertical
          End If
       End Sub

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
