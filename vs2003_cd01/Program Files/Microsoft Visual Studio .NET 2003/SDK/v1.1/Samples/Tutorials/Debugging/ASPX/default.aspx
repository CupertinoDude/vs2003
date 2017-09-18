<%@Page Description="Localized Page" Inherits="MyCodeBehind" Src="default.cs" trace="false"%>
<%@ OutputCache Duration="1" VaryByParam="none" %>

<%@Import Namespace="System.Globalization"%>
<%@Import Namespace="System.Resources"%>
<%@Import Namespace="System.Threading"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Localized Page</title>

</head>


<body>

<h3>
<%--
    Display the flag as declarative control, 
      get the greeting string from a resource.
--%>
<img src="Flags/<%=CultureInfo.CurrentCulture%>.jpg">
<%=rm.GetString("greeting") %>
</h3>

<%--
    Give the user the opportunity to override browser language.
--%>

<form runat="server">

<asp:DropDownList id="MyUICulture" AutoPostBack="true" width=200 runat="server">
	<asp:listitem>Choose another language</asp:listitem>
	<asp:listitem>de-DE</asp:listitem>
	<asp:listitem>en-US</asp:listitem>
	<asp:listitem>ja-JP</asp:listitem>
</asp:DropDownList>

<asp:RequiredFieldValidator ControlToValidate="MyUICulture" Display="Dynamic" InitialValue="Choose another language" errormessage="You must select a language!" runat=server/> 

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






