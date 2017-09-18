
<script language="VB" runat="server">

    Sub Session_Start(Sender As Object, E As EventArgs)
    
      Session("BackColor") = "beige"
      Session("ForeColor") = "black"
      Session("LinkColor") = "blue"
      Session("FontSize") = "8pt"
      Session("FontName") = "verdana"
    End Sub

</script>