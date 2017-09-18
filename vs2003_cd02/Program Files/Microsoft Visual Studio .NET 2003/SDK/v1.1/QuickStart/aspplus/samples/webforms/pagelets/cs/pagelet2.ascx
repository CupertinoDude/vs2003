
<script language="C#" runat="server">

  public String Color = "blue";
  public String Text = "This is a simple message user control!";

</script>

<span id="Message" style="color:<%=Color%>"><%=Text%></span>
