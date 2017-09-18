<%@Page Culture="en-us" UICulture="en-us" Language="JScript" Debug="true" %>
<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Threading"%>

<%@Register TagPrefix="Localized" TagName="Search" src="search.ascx" %>
<%@Register TagPrefix="Localized" TagName="Flag" src="flag.ascx" %>

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

<h3>
<Localized:Flag runat="server"/>
Welcome</h3>

<hr>

<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border=0 width="99%" align=center>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f")%></td>
<td class="contentcol">
    <b><%=DateTime.Now.AddDays(1).ToString("dddd")%></b>
    Tomorrow's weather forecast.
    <br>(<a href="../../NewsAnchor.aspx">Read more</a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f")%></td>
<td class="contentcol">
    <b>NASDAQ</b>
    Current stock charts.
    <br>(<a href="../../NewsAnchor.aspx">Read more</a>)</td>
</tr>

</table>

<form runat="server">
    <Localized:Search runat="Server"/>
</form>

</center>

</body>

</html>






