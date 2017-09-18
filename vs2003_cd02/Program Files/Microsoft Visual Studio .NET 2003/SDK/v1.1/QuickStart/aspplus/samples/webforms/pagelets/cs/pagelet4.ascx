
<script language="C#" runat="server">

  public String BackColor = "white";

  public String UserId {
    get {
      return User.Text;
    }
    set {
      User.Text = value;
    }
  }

  public String Password {
    get {
      return Pass.Text;
    }
    set {
      Pass.Text = value;
    }
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
