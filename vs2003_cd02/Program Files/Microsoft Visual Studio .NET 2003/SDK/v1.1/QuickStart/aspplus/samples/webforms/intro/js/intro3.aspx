<%@ Page Language="JScript" %>

<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <body>

       <center>

       <form action="intro3.aspx">

           <h3> Name: <input name="Name" type=text value="<%=HttpUtility.HtmlEncode(Request.QueryString["Name"])%>">

           Category:  <select name="Category" size=1>

                         <%
                             var values : String [] = [ "psychology", "business", "popular_comp" ];
                             var i : int;
                             for (i=0; i<values.Length; i++) {
                          %>

                                <option <% if (Request.QueryString["Category"] == values[i]) { Response.Write("selected"); } %>>
                                   <%=values[i]%>
                                </option>

                          <% } %>

                      </select>

           </h3>

           <input type=submit name="Lookup" value="Lookup">

           <p>

           <% if (Request.QueryString["Lookup"] != null) { %>

              Hi <%=HttpUtility.HtmlEncode(Request.QueryString["Name"]) %>, you selected: <%=HttpUtility.HtmlEncode(Request.QueryString["Category"]) %>

           <% } %>

       </form>

       </center>

   </body>
</html>