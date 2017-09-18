<%@ Page Language="C#" Debug="true" Src="updatingdata.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.ADONET" %>

<script language="C#" runat="server">

protected void Page_Load(Object Src, EventArgs E) 
{
  StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  updatingdata myupdatingdata = new updatingdata();
  myupdatingdata.Run();
  output.InnerHtml = writer.ToString();
}

</script>


<html>
<body style="background-color:f6e4c6">
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
</body>
</html>

