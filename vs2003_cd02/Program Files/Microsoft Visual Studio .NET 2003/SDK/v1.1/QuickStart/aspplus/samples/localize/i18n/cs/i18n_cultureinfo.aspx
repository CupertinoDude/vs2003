<%@Page Language="C#" ResponseEncoding="utf-8" %>
<%@Import Namespace="System.Threading"%>
<%@Import Namespace="System.Globalization"%>


<html>
   <head>
    <link rel="stylesheet" href="../i18n_styles.css">

    <script runat="server">
    CultureInfo culture = null;

    void Page_Load(Object sender, EventArgs args) {
        if(IsPostBack) {
            try {
                culture = new CultureInfo(NewCulture.Value);
                // if a neutral culture is entered, create a specific culture
                culture = CultureInfo.CreateSpecificCulture(culture.ToString());
            } catch (System.ArgumentException) {
                // unknown culture
                culture = null;
            }
        } else {
            culture = CultureInfo.CurrentCulture;
        } 
    }

    </script>

   </head>

   <body>


    <h3>I18N: CultureInfo class</h3>
    <p>
    This sample demonstrates using the CultureInfo class. 
    In the case of the Japanese businessman in Sweden, this class 
    would reflect the origin of the user, Japan.
    </p>


  <% if(culture != null) { 
        Thread.CurrentThread.CurrentCulture = culture;
  %>
      Current Culture is <%= CultureInfo.CurrentCulture.Name %>
      (<%=Thread.CurrentThread.CurrentCulture.Name%>),
      <%= CultureInfo.CurrentCulture.EnglishName %>/<%=CultureInfo.CurrentCulture.NativeName%>,
      The localized date is: <%= DateTime.Now.ToString("D", CultureInfo.CurrentCulture) %>
  <% } else { %>
            <b>Culture "<%=NewCulture.Value%>" not supported.</b>
  <% }%>


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
      String[] cultures = {"en-us", "de-de", "ja-jp", "fr-fr"};
      foreach(String s in cultures) {
      culture = new CultureInfo(s);     
  %>
  <tr>
    <td><%=culture.Name%></td>
    <td><%=culture.EnglishName%></td>
    <td><%=culture.NativeName%></td>
    <td><%=culture.LCID%></td>
  </tr>
  <%
      }
  %>

  </table>


       </center>

   </body>
</html>







