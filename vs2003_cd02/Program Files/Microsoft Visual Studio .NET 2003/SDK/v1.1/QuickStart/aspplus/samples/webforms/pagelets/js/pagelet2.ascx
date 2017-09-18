
<script language="JScript" runat="server">

  public var Color : String = "blue";
  public var Text : String = "This is a simple message pagelet!";

</script>

<span id="Message" style="color:<%=Color%>"><%=Text%></span>
