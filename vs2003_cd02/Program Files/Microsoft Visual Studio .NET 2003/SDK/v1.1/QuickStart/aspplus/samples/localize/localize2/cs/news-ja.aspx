<%@Page Culture="ja-JP" UICulture="ja-JP" Language="C#" %>
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

</head>



<body>

<h3>
<Localized:Flag runat="server"/>
ようこそ</h3>

<hr>

<center>

<p>

<table bgcolor="#FFFFFF" cellpadding="5" cellspacing="5" border=0 width="99%" align=center>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", null)%></td>
<td class="contentcol">
    <b><%=DateTime.Now.AddDays(1).ToString("dddd", null)%></b>
    明日の天気予報。
    <br>(<a href="../../NewsAnchor.aspx">詳細 ...</a>)</td>
</tr>

<tr>
<td class="infocol"><%=DateTime.Now.ToString("f", null)%></td>
<td class="contentcol">
    <b>東京証券取引所</b>
    現在の日経平均株価。
    <br>(<a href="../../NewsAnchor.aspx">詳細 ...</a>)</td>
</tr>

</table>

<form runat="server">
    <Localized:Search runat="Server"/>
</form>

</center>

</body>

</html>












