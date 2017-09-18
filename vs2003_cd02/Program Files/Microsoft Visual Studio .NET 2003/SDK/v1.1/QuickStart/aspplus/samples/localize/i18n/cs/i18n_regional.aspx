<%@Page Language="C#" ResponseEncoding="UTF-8"%>
<%@Import Namespace="System.Threading"%>
<%@Import Namespace="System.Globalization"%>


<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="../i18n_styles.css">

    <script runat="server">
    RegionInfo _region = null;

    void Page_Load(Object sender, EventArgs args) {
        if(IsPostBack) {
            try {
                _region = new RegionInfo(NewRegion.Value);
            } catch (System.ArgumentException) {
                // unknown region
                _region = null;
            }
        } else {
            _region = RegionInfo.CurrentRegion;
        }
    }

    </script>

   </head>

   <body>


    <h3>I18N: Regional Settings</h3>
    <p>This sample demonstrates using the RegionInfo class. In the case of the Japanese businessman in Sweden, this class would reflect the location Sweden.
    </p>


  <% if(_region != null) { %>
      Current region is <%= _region.EnglishName %> (<%=_region.DisplayName%>),
      currency is <%= _region.CurrencySymbol %>.
  <% } else { %>
            <b>Region "<%=NewRegion.Value%>" not supported.</b>
  <% }%>


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
      String[] regions = {"us", "de", "jp", "fr", "il"};
      foreach(String s in regions) {
      _region = new RegionInfo(s);
  %>
  <tr>
    <td><%=_region.Name%></td>
    <td><%=_region.EnglishName%></td>
    <td><%=_region.DisplayName%></td>
    <td><%=_region.CurrencySymbol%></td>
    <td><%=_region.IsMetric%></td>
  </tr>
  <%
      }
  %>

  </table>


       </center>

   </body>
</html>