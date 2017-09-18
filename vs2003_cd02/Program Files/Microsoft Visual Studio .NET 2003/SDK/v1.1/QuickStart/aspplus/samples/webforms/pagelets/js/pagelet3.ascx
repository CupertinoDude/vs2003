
<script language="JScript" runat="server">

  public var Caption : String = "Address";

  public function get Address() : String {
     return TxtAddress.Value;
  }

  public function set Address(value : String) {
      TxtAddress.Value = value;
  }

  public function get City() : String {
      return TxtCity.Value;
  }

  public function set City(value : String) {
      TxtCity.Value = value;
  }

  public function get StateName() : String  {
      return TxtState.Value;
  }

  public function set StateName(value : String) {
    TxtState.Value = value;
  }

  public function get Zip() : String {
    return TxtZip.Value;
  }
  public function set Zip(value : String) {
      TxtZip.Value = value;
  }

</script>

<p>
<table style="font: 10pt verdana">
  <tr>
    <td colspan="6" style="padding-bottom:10">
      <b><%=Caption%></b>
    </td>
  </tr>
  <tr>
    <td>
      Address: 
    </td>
    <td colspan="5">
      <input id="TxtAddress" size="50" type="text" runat="server">
    </td>
  </tr>
  <tr>
    <td>
      City: 
    </td>
    <td>
      <input id="TxtCity" type="text" runat="server">
    </td>
    <td>
      State: 
    </td>
    <td>
      <input id="TxtState" size="2" type="text" runat="server">
    </td>
    <td>
      Zip: 
    </td>
    <td>
      <input id="TxtZip" size="5" type="text" runat="server">
    </td>
  </tr>
</table>