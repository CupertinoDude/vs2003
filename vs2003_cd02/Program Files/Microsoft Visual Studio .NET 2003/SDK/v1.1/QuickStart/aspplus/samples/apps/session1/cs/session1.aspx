
<html>

  <script language="C#" runat="server">

      String GetStyle(String key) {
        return Session[key].ToString();       
      }

  </script>

  <style>

    body {
      font: <%=GetStyle("FontSize")%> <%=GetStyle("FontName")%>;
      background-color: <%=GetStyle("BackColor")%>;
    }

    a { color: <%=GetStyle("LinkColor")%> }

  </style>

  <body style="color:<%=GetStyle("ForeColor")%>">

    <h3><font face="Verdana">Storing Volatile Data in Session State</font></h3>

    <b><a href="customize.aspx">Customize This Page</a></b><p>

    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>
    Imagine some content here ...<br>

  </body>
  
</html>
