
<html>

  <script language="VB" runat="server">

      Function GetStyle(Key As String) As String
        Return Session(Key).ToString()
      End Function

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
