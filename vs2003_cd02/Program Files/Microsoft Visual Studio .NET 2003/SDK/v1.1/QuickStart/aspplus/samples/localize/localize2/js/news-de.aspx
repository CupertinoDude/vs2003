<%@Page Culture="de-DE" UICulture="de-DE" Language="JScript" %>
<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Threading"%>

<%@Register TagPrefix="Localized" TagName="Flag" src="flag.ascx" %>
<%@Register TagPrefix="Localized" TagName="Search" src="search.ascx" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css" href="../../i18n/i18n_styles.css" >
<link rel="stylesheet" type="text/css" href="../../news.css" >

</style>

<script runat="server">
</script>

</head>



<body>

<h3><Localized:Flag runat="server"/>
Willkommen</h3>

<hr>

<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border=0 width="99%" align=center>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f")%></td>
<td class="contentcol">
    <b><%=DateTime.Now.AddDays(1).ToString("dddd")%></b>
    Das Wetter von morgen.
    <br>(<a href="../../NewsAnchor.aspx">Weiter</a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f")%></td>
<td class="contentcol">
    <b>Frankfurter Börse</b>
    Die aktuellen Aktienkurse.
    <br>(<a href="../../NewsAnchor.aspx">Weiter</a>)</td>
</tr>

</table>

<form runat="server">
    <Localized:Search runat="Server"/>
</form>

</center>

</body>

</html>






