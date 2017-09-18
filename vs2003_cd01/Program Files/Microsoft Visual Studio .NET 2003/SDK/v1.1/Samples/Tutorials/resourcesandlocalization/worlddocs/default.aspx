<%@Page Description="Localized Page" %>
<%@ OutputCache Duration="1" VaryByParam="none" %>

<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Resources"%>
<%@Import Namespace="System.Threading"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script runat="Server" Language="C#">

ResourceManager rm;

void Page_Init(Object sender, EventArgs args) {
    // Get the ResourceManager from the Application object.
    rm = (ResourceManager) Application["RM"];
    if(rm == null) 
    {
  // Do something sensible if resources are not available.
  Server.Transfer("noresource.aspx");
    }

    // Fill the drop-down list with the supported culture values.
    MyUICulture.Items.Add("Choose another language");
    MyUICulture.Items.Add("de-DE");
    MyUICulture.Items.Add("en-US");
    MyUICulture.Items.Add("ja-JP");
    MyUICulture.AutoPostBack = true;
}

void Page_Load(Object sender, EventArgs args) {
    String SelectedCulture = MyUICulture.SelectedItem.Text;
    if(! SelectedCulture.StartsWith("Choose")) 
    {
  // If another culture was selected, use that instead.
  Thread.CurrentThread.CurrentCulture = new CultureInfo(SelectedCulture);
  Thread.CurrentThread.CurrentUICulture = new CultureInfo(SelectedCulture);
    }

}

</script>

<title>Localized Page</title>

</head>


<body>

<h3>
<%--
    Display the flag as declarative control, 
      get the greeting string from a resource.
--%>
<img src="Flags/<%=CultureInfo.CurrentCulture%>.jpg">
<%=rm.GetString("greeting")%>
</h3>

<%--
    Give the user the opportunity to override browser language.
--%>

<form runat="server">

<asp:DropDownList id="MyUICulture" runat="server"/>

<hr>


<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border="0"
    style="border-style:solid; border-width:2; border-color:Wheat"
    width="99%" align=center>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("D", CultureInfo.CurrentCulture)%></td>
<td class="contentcol"><%=rm.GetString("article1")%></td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("D", CultureInfo.CurrentCulture)%></td>
<td class="contentcol"><%=rm.GetString("article2")%></td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("D", CultureInfo.CurrentCulture)%></td>
<td class="contentcol"><%=rm.GetString("article3")%></td>
</tr>

</table>

</center>

</form>

</body>

</html>






