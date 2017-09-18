
<script language="VB" runat="server">

  Public Color As String = "blue"
  Public MessageText As String = "This is a simple message user control!"

</script>

<span id="Message" style="color:<%=Color%>"><%=MessageText%></span>
