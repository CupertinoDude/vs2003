<%@Page Description="Localized Page" %>
<%@ OutputCache Duration="1" VaryByParam="none" %>

<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Resources"%>
<%@Import Namespace="System.Threading"%>

<%@Register TagPrefix="Localized" TagName="Search" src="search.ascx" %>
<%@Register TagPrefix="Localized" TagName="Flag" src="flag.ascx" %>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css" href="../../../i18n/i18n_styles.css" >
<link rel="stylesheet" type="text/css" href="../../../news.css" >

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
    MyUICulture.Items.Add("de (German)");
    MyUICulture.Items.Add("en-US (US English)");
    MyUICulture.Items.Add("ja (Japanese)");

    MyUICulture.AutoPostBack = true;
}

void Page_Load(Object sender, EventArgs args) {

    //this code strips everything but the culture title at the front of the string in the listbox
    int iLen = MyUICulture.SelectedItem.Text.IndexOf(" ") >= 0
                ? MyUICulture.SelectedItem.Text.IndexOf(" ") : MyUICulture.SelectedItem.Text.Length;
    String SelectedCulture = MyUICulture.SelectedItem.Text.Substring( 0, (8 <= iLen ? 8 : iLen));

    if(! SelectedCulture.StartsWith("Choose"))
    {
        // If another culture was selected, use that instead.
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(SelectedCulture);
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
    }

    // Using culture within a script block.
    try {
        // this try block attempts to load the parent so that the match for the ads is more liberal
	TopAdRotator.KeywordFilter = Thread.CurrentThread.CurrentUICulture.Parent.Name;
    } catch (Exception) {
	TopAdRotator.KeywordFilter = Thread.CurrentThread.CurrentUICulture.Name;
    }

    TopAdRotator.AdvertisementFile = "ads.xml";
}

</script>

<title>Localized Page</title>

</head>


<body>

<center>
<asp:AdRotator id="TopAdRotator" Runat="server" Target="_newwindow" />
</center>


<h3>
<%--
    Display the flag as declarative control,
      get the greeting string from a resource.
--%>
<Localized:Flag runat="server"/>
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
<td class="contentcol"><%=rm.GetString("article1")%>
      <br>(<a href="..\..\..\NewsAnchor.aspx"><%=rm.GetString("more")%></a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("D", CultureInfo.CurrentCulture)%></td>
<td class="contentcol"><%=rm.GetString("article2")%>
      <br>(<a href="..\..\..\NewsAnchor.aspx"><%=rm.GetString("more")%></a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("D", CultureInfo.CurrentCulture)%></td>
<td class="contentcol"><%=rm.GetString("article3")%>
      <br>(<a href="..\..\..\NewsAnchor.aspx"><%=rm.GetString("more")%></a>)</td>
</tr>

</table>


    <Localized:Search runat="Server" />

</center>

</form>

</body>

</html>






