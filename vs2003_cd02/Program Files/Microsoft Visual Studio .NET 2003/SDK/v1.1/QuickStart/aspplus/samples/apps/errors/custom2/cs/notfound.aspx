<%@ Page Language="C#" %>
<html>
  <head>
    <title>An Error Has Occured</title>
  </head>
  <body bgcolor="ccffcc">
  <font face="verdana">
    <h4>We could not locate the page you requested...</h4>
    <% if ( Request.QueryString["aspxerrorpath"] != null ) { %>
    <%=HttpUtility.HtmlEncode(Request.QueryString["aspxerrorpath"])%>
    <% } %>
    <p>
    Perhaps you mis-typed the URL?  Please try again, or visit our search page for help.
    <p>
    <hr>
  </font>
  </body>
</html>