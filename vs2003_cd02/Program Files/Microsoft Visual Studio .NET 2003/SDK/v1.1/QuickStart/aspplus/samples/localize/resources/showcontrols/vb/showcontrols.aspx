<%@Page Language="VB" UICulture="en-us" Description="Localized Controls" %>
<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Resources"%>
<%@Import Namespace="System.Threading"%>

<%@Import Namespace="LocalizedControlsVB" %>
<%@Register TagPrefix="Loc" namespace="LocalizedControlsVB" Assembly="LocalizedControlsVB" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" type="text/css" href="../../../i18n/i18n_styles.css" >
<link rel="stylesheet" type="text/css" href="../../../news.css" >

<title>Show Controls</title>

</head>


<body>
<h3>Localizing Code-Behind Controls</h3>

The buttons below are all instances of the same code-behind control
<code>LocalizedControls.LocalizedButton</code>. This control uses
satellite assemblies to display a localized string at the rendering
stage.
<p>

<form runat="server">
<table border="1">

<tr>
<td>
<% Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-us") %>
Current UICulture is
    <%=CultureInfo.CurrentUICulture.Name%>
    (<%=CultureInfo.CurrentUICulture.EnglishName%>)
</td>
<td>
<Loc:LocalizedButton runat="server" Text="ok" />
<Loc:LocalizedButton runat="server" Text="cancel" />
<Loc:LocalizedButton runat="server" Text="continue" />
<Loc:LocalizedButton runat="server" Text="close" />
</td>
</tr>


<tr>
<td>
<% Thread.CurrentThread.CurrentUICulture = new CultureInfo("de") %>
Current UICulture is
    <%=CultureInfo.CurrentUICulture.Name%>
    (<%=CultureInfo.CurrentUICulture.EnglishName%>)
</td>
<td>
<Loc:LocalizedButton runat="server" Text="ok" />
<Loc:LocalizedButton runat="server" Text="cancel" />
<Loc:LocalizedButton runat="server" Text="continue" />
<Loc:LocalizedButton runat="server" Text="close" />
</td>
</tr>

<tr>
<td>
<% Thread.CurrentThread.CurrentUICulture = new CultureInfo("ja") %>
Current UICulture is
    <%=CultureInfo.CurrentUICulture.Name%>
    (<%=CultureInfo.CurrentUICulture.EnglishName%>)
</td>
<td>
<Loc:LocalizedButton runat="server" Text="ok" />
<Loc:LocalizedButton runat="server" Text="cancel" />
<Loc:LocalizedButton runat="server" Text="continue" />
<Loc:LocalizedButton runat="server" Text="close" />
</td>
</tr>
</table>
</form>

</body>
</html>
