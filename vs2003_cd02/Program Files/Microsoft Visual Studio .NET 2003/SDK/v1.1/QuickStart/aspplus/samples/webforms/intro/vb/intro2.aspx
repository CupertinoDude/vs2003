<%@ Page Language="VB" %>
<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <body>

       <center>

       <form action="intro2.aspx" method="post">

           <h3> Name: <input id="Name" type=text>

           Category:  <select id="Category" size=1>
                          <option>psychology</option>
                          <option>business</option>
                          <option>popular_comp</option>
                      </select>

           </h3>

           <input type=submit value="Lookup">

           <p>

           <% Dim I As Integer
              For I = 0 to 7 %>
              <font size="<%=I%>"> Welcome to ASP.NET </font> <br>
           <% Next %>

       </form>

       </center>

   </body>
</html>