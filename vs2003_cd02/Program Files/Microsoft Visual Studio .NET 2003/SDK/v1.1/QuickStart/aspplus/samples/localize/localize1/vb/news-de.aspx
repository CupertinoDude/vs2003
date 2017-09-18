<%@Page Culture="de-DE" Language="VB" %>
<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Threading"%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css" href="../../i18n/i18n_styles.css" >
<link rel="stylesheet" type="text/css" href="../../news.css" >

</head>



<body>

<h3><img src="../../flags/de-DE.jpg" alt="Deutsch" />
Willkommen</h3>

<hr>

<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border=0 width="99%" align=center>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", Nothing)%></td>
<td class="contentcol">
    <b><%=DateTime.Now.AddDays(1).ToString("dddd", Nothing)%></b>
    Das Wetter von morgen.
    <br>(<a href="../../NewsAnchor.aspx">Weiter ...</a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", Nothing)%></td>
<td class="contentcol">
    <b>NASDAQ</b>
    Aktuelle Börsenkurse.
    <br>(<a href="../../NewsAnchor.aspx">Weiter ...</a>)</td>
</tr>

</table>

</center>

</body>

</html>






