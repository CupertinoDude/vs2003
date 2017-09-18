<%@Page Culture="en-us" Language="C#" %>
<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Threading"%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css" href="../../i18n/i18n_styles.css" >
<link rel="stylesheet" type="text/css" href="../../news.css" >

</style>

</head>



<body>

<h3><img src="../../flags/en-US.jpg" alt="English - US" />
Welcome</h3>

<hr>

<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border="0" width="99%" align="center">

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", Thread.CurrentThread.CurrentCulture)%></td>
<td class="contentcol">
    <b><%=DateTime.Now.AddDays(1).ToString("dddd", Thread.CurrentThread.CurrentCulture)%></b>
    Tomorrow's weather forecast.
    <br>(<a href="../../NewsAnchor.aspx">Read more</a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", Thread.CurrentThread.CurrentCulture)%></td>
<td class="contentcol">
    <b>NASDAQ</b>
    Current stock charts.
    <br>(<a href="../../NewsAnchor.aspx">Read more</a>)</td>
</tr>

</table>

</center>

</body>

</html>






