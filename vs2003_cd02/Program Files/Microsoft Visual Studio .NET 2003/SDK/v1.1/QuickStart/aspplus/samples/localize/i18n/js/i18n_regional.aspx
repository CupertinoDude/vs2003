<%@Page Language="JScript" ResponseEncoding="UTF-8"%>
<%@Import Namespace="System.Threading"%>
<%@Import Namespace="System.Globalization"%>


<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <link rel="stylesheet" href="../i18n_styles.css">

    <script runat="server">
    var _region:RegionInfo = null;

    function Page_Load(sender:Object, args:EventArgs) : void {
        if(IsPostBack) {
            try {
                _region = new RegionInfo(NewRegion.Value);
            } catch (e:ArgumentException) {
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
      var regions:String[] = [ "us", "de", "jp", "fr", "il" ];
      for(var i = 0; i < 5; i++) {
      _region = new RegionInfo(regions[i]);
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