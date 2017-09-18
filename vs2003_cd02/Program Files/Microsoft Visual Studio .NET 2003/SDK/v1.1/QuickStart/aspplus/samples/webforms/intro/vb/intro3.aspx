<%@ Page Language="VB" %>

<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <body>

       <center>

       <form action="intro3.aspx">

           <h3> Name: <input name="Name" type=text value="<%=HttpUtility.HtmlEncode(Request.QueryString("Name"))%>">

           Category:  <select name="Category" size=1>

                         <%
                             Dim I As Integer
                             Dim Values(2) As String
                             Values(0) = "psychology"
                             Values(1) = "business"
                             Values(2) = "popular_comp"

                             For I = 0 To Values.Length - 1
                          %>

                                <% If (Request.QueryString("Category") = Values(i)) %>
                                  <option selected>
                                <% Else %>
                                  <option>
                                <% End If %>
                                   <%=Values(i)%>
                                </option>

                          <% Next %>

                      </select>
           </h3>

           <input type=submit name="Lookup" value="Lookup">

           <p>

           <% If (Not Request.QueryString("Lookup") = Nothing) %>

              Hi <%=HttpUtility.HtmlEncode(Request.QueryString("Name")) %>, you selected: <%=HttpUtility.HtmlEncode(Request.QueryString("Category")) %>

           <% End If %>

       </form>

       </center>

   </body>
</html>