<%@Page Language="VB" ResponseEncoding="UTF-8"%>
<%@Import Namespace="System.Threading"%>
<%@Import Namespace="System.Globalization"%>


<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="../i18n_styles.css">

    <script runat="server" Language="VB">
    Dim _region as RegionInfo = Nothing

    Sub Page_Load(sender As Object, args As EventArgs)
	If(IsPostBack) Then
	    Try
		_region = new RegionInfo(NewRegion.Value)
	    Catch
		' unknown region
		_region = Nothing
	    End Try
	Else
	    _region = RegionInfo.CurrentRegion
	End If
    End Sub

    </script>

   </head>

   <body>


    <h3>I18N: Regional Settings</h3>
    <p>This sample demonstrates using the RegionInfo class. In the case of the Japanese businessman in Sweden, this class would reflect the location Sweden.
    </p>


	<% If(Not(_region is Nothing)) Then %>
	    Current region is <%= _region.EnglishName %> (<%=_region.DisplayName%>),
	    currency is <%= _region.CurrencySymbol %>.
	<% Else %>
            <b>Region "<%=NewRegion.Value%>" not supported.</b>
	<% End If %>


	<form runat="server">
	Change to <input id="NewRegion" type="text" runat="server">
	</form>

	<hr>


       <center>
Some sample regions:
	<table width="99%">


	<tr>
        <td><b>Name</b></td>
		<td><b>English Name</b></td>
		<td><b>Display Name</b></td>
		<td><b>Currency</b></td>
		<td><b>Metric</b></td>
	</tr>

	<%
	    Dim regions() As String = {"us", "de", "jp", "fr", "il"}
            Dim obj As Object
            For Each obj In regions
               _region = new RegionInfo(obj.ToString())
	%>
	<tr>
		<td><%=_region.Name%></td>
		<td><%=_region.EnglishName%></td>
		<td><%=_region.DisplayName%></td>
		<td><%=_region.CurrencySymbol%></td>
		<td><%=_region.IsMetric%></td>
	</tr>
	<%
	    Next
	%>

	</table>


       </center>

   </body>
</html>







