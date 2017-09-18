
<script language="VB" runat="server">

  Public BackColor As String = "white"

  Public Property UserId As String
    Get
      Return UserName.Text
    End Get
    Set
      UserName.Text = Value
    End Set
  End Property

  Public Property Password As String
    Get
      Return Pass.Text
    End Get
    Set
      Pass.Text = Value
    End Set
  End Property

</script>

<table style="background-color:<%=BackColor%>;font: 10pt verdana;border-width:1;border-style:solid;border-color:black;" cellspacing=15>
  <tr>
    <td><b>Login: </b></td>
    <td><ASP:TextBox id="UserName" runat="server"/></td>
  </tr>
  <tr>
    <td><b>Password: </b></td>
    <td><ASP:TextBox id="Pass" TextMode="Password" runat="server"/></td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button Text="Submit" runat="server"/></td>
  </tr>
</table>
