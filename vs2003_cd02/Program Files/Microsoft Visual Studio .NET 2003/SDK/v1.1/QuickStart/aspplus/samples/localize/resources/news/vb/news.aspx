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

<script runat="Server" Language="VB">

Dim rm as ResourceManager

Sub Page_Init(sender As Object, args As EventArgs)
    ' Get the ResourceManager from the Application object.
    rm = Application("RM")
    If(rm is Nothing) Then
  ' Do something sensible if resources are not available.
  Server.Transfer("noresource.aspx")
    End If

    ' Fill the drop-down list with the supported culture values.
    MyUICulture.Items.Add("Choose another language")
    MyUICulture.Items.Add("de (German)")
    MyUICulture.Items.Add("en-US (US English)")
    MyUICulture.Items.Add("ja (Japanese)")
    MyUICulture.AutoPostBack = True
End Sub

Sub Page_Load(sender As Object, args As EventArgs)
    ' this code strips everything but the culture title at the front of the string in the listbox
    Dim iLen As Integer

    If MyUICulture.SelectedItem.Text.IndexOf(" ") >= 0 Then
        iLen = MyUICulture.SelectedItem.Text.IndexOf(" ")
    Else
        iLen = MyUICulture.SelectedItem.Text.Length
    End If

    Dim selectedCulture As String

    If 8 <= iLen Then
        selectedCulture = MyUICulture.SelectedItem.Text.Substring(0, 8)
    Else
        selectedCulture = MyUICulture.SelectedItem.Text.Substring(0, iLen)
    End If

    If(Not selectedCulture.StartsWith("Choose")) Then
        ' If another culture was selected, use that instead.
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(selectedCulture)
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture
    End If

    ' Using culture within a script block.
    Try 
        ' this try block attempts to load the parent so that the match for the ads is more liberal
	TopAdRotator.KeywordFilter = Thread.CurrentThread.CurrentUICulture.Parent.Name
    Catch e As Exception
	TopAdRotator.KeywordFilter = Thread.CurrentThread.CurrentUICulture.Name
    End Try


    ' Using culture within a script block.
    TopAdRotator.AdvertisementFile = "ads.xml"
End Sub

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






