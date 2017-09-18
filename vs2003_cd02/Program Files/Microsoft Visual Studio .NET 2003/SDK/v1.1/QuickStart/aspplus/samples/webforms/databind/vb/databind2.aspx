<html>
<head>
    <script language="VB" runat="server">

        Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
        
          ' Rather than explictly pull out the variable from the "StateList"
          ' and then manipulate a label control, just call "Page.DataBind".
          ' This will evaluate any <%# %> expressions within the page
          
          Page.DataBind
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">DataBinding to a property of another server control</font></h3>

    <form runat=server>

        <asp:DropDownList id="StateList" runat="server">
          <asp:ListItem>CA</asp:ListItem>
          <asp:ListItem>IN</asp:ListItem>
          <asp:ListItem>KS</asp:ListItem>
          <asp:ListItem>MD</asp:ListItem>
          <asp:ListItem>MI</asp:ListItem>
          <asp:ListItem>OR</asp:ListItem>
          <asp:ListItem>TN</asp:ListItem>
          <asp:ListItem>UT</asp:ListItem>
        </asp:DropDownList>
        
        <asp:button Text="Submit" OnClick="SubmitBtn_Click" runat=server/>
        
        <p>
        
        Selected State: <asp:label text='<%# StateList.SelectedItem.Text %>' runat=server/>
        
    </form>

</body>
</html>
