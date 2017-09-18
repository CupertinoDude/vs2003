<%@Page Language="VB" ResponseEncoding="utf-8" %>
<%@Import Namespace="System.Threading"%>
<%@Import Namespace="System.Globalization"%>


<html>
   <head>
    <link rel="stylesheet" href="../i18n_styles.css">

    <script language="VB" runat="server">
    Dim cult as CultureInfo

    Sub Page_Load(sender as Object,args as EventArgs)
        If(IsPostBack) Then
	    Try
                cult = new CultureInfo(NewCulture.Value)
                ' if a neutral culture is entered, create a specific culture
                cult = CultureInfo.CreateSpecificCulture(cult.ToString())
            Catch
		' unknown culture
		cult = Nothing
            End Try
        Else
	    cult = CultureInfo.CurrentCulture
        End If
    End Sub

    </script>

   </head>

   <body>

    <h3>I18N: CultureInfo class</h3>
    <p>
    This sample demonstrates using the CultureInfo class.
    In the case of the Japanese businessman in Sweden, this class
    would reflect the origin of the user, Japan.
    </p>


	<% If(Not (cult is Nothing)) Then
	      Thread.CurrentThread.CurrentCulture = cult
	%>
	    Current Culture is <%= CultureInfo.CurrentCulture.Name %>
	    (<%=Thread.CurrentThread.CurrentCulture.Name%>),
	    <%= CultureInfo.CurrentCulture.EnglishName %>/<%=CultureInfo.CurrentCulture.NativeName%>,
	    The localized date is: <%= DateTime.Now.ToString("D", CultureInfo.CurrentCulture) %>
	<% Else  %>
            <b>Culture "<%=NewCulture.Value%>" not supported.</b>
	<% End If %>


	<form runat="server">
	Change to <input id="NewCulture" type="text" runat="server">
	</form>

	<hr>


       <center>
Some sample cultures:
	<table width="99%">


	<tr>
	        <td><b>Name</b></td>
		<td><b>English Name</b></td>
		<td><b>Native Name</b></td>
		<td><b>LCID</b></td>
	</tr>

	<%
	    Dim cultures() As String = { "en-us", "de-de", "ja-jp", "fr-fr" }
            Dim obj As Object
	    For Each obj In cultures
                cult = new CultureInfo(obj.ToString())
	%>
	<tr>
		<td><%=cult.Name%></td>
		<td><%=cult.EnglishName%></td>
		<td><%=cult.NativeName%></td>
		<td><%=cult.LCID%></td>
	</tr>
	<%
            Next
	%>

	</table>


       </center>

   </body>
</html>







