
<script language="JScript" runat="server">

  private var _caption:String = "Address";
  private var _showcaption:Boolean = true;

  public function get Caption() : String {
      return _caption;
  }
  public function set Caption(value:String) {
      _caption = value;
  }

  public function get ShowCaption() : Boolean {
      return _showcaption;
  }
  public function set ShowCaption(value:Boolean) {
      _showcaption = value;
  }

  public function get Address() : String {
      return TxtAddress.Value;
  }
  public function set Address(value:String) {
      TxtAddress.Value = value;
  }

  public function get City() : String {
      return TxtCity.Value;
  }
  public function set City(value:String) {
      TxtCity.Value = value;
  }

  public function get State() : String {
      return TxtState.Value;
  }
  public function set State(value:String) {
      TxtState.Value = value;
  }

  public function get Zip() : String {
      return TxtZip.Value;
  }
  public function set Zip(value:String) {
      TxtZip.Value = value;
  }

</script>

<span ></span>
<p>
<table style="font: 10pt verdana">
<% if (ShowCaption) { %>
  <tr>
    <td colspan="6" style="padding-bottom:10">
      <b><%=Caption%></b>
    </td>
  </tr>
<% } %>
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