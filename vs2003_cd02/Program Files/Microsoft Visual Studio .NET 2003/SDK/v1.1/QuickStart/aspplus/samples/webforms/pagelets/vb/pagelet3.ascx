
<script language="VB" runat="server">

  Public Caption As String = "Address"

  Public Property Address As String
    Get
      Return TxtAddress.Value
    End Get
    Set
      TxtAddress.Value = Value
    End Set
  End Property

  Public Property City As String
    Get
      Return TxtCity.Value
    End Get
    Set
      TxtCity.Value = Value
    End Set
  End Property

  Public Property StateName As String
    Get
      Return TxtState.Value
    End Get
    Set
      TxtState.Value = Value
    End Set
  End Property

  Public Property Zip As String
    Get
      Return TxtZip.Value
    End Get
    Set
      TxtZip.Value = Value
    End Set
  End Property

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