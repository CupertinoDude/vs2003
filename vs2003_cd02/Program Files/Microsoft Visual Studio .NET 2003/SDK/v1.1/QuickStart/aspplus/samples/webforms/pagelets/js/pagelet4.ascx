
<script language="JScript" runat="server">

  public var BackColor : String = "white";

  public function get UserId() : String {
    return User.Text;
  }

  public function set UserId( value : String ) {
    User.Text = value;
  }

  public function get Password() : String {
    return Pass.Text;
  }

  public function set Password( value : String ) {
    Pass.Text = value;
  }

</script>

<table style="background-color:<%=BackColor%>;font: 10pt verdana;border-width:1;border-style:solid;border-color:black;" cellspacing=15>
  <tr>
    <td><b>Login: </b></td>
    <td><ASP:TextBox id="User" runat="server"/></td>
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
