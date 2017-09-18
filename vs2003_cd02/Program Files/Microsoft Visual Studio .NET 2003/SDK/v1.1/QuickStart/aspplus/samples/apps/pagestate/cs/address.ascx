
<script language="C#" runat="server">

  public String Caption = "Address";
  public bool _showcaption = true;

  public Boolean ShowCaption {
      get {
          return _showcaption;
      }
      set {
          _showcaption = value;
      }
  }

  public String Address {
    get {
      return TxtAddress.Value;
    }
    set {
      TxtAddress.Value = value;
    }
  }

  public String City {
    get {
      return TxtCity.Value;
    }
    set {
      TxtCity.Value = value;
    }
  }

  public String State {
    get {
      return TxtState.Value;
    }
    set {
      TxtState.Value = value;
    }
  }

  public String Zip {
    get {
      return TxtZip.Value;
    }
    set {
      TxtZip.Value = value;
    }
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