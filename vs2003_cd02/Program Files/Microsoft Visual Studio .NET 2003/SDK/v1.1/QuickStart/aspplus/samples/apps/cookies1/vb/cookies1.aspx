<html>

  <script language="VB" runat="server">

      Sub Page_Load(Sender As Object, E As EventArgs)

        If Request.Cookies("preferences1") Is Nothing

          Dim Cookie As HttpCookie
          Cookie = New HttpCookie("preferences1")
          Cookie.Values.Add("ForeColor","black")
          Cookie.Values.Add("BackColor","beige")
          Cookie.Values.Add("LinkColor","blue")
          Cookie.Values.Add("FontSize","8pt")
          Cookie.Values.Add("FontName","Verdana")
          Response.Cookies.Add(Cookie)
        End If
      End Sub

      Protected Function GetStyle(Key As String) As String

        Dim Cookie As HttpCookie
        Cookie = Request.Cookies("preferences1")

        If Not Cookie Is Nothing

          Select (Key)

            Case "ForeColor" :
              Return Cookie.Values("ForeColor")

            Case "BackColor" :
              Return Cookie.Values("BackColor")

            Case "LinkColor" :
              Return Cookie.Values("LinkColor")

            Case "FontSize" :
              Return Cookie.Values("FontSize")

            Case "FontName" :
              Return Cookie.Values("FontName")
          End Select
        End If

        Return ""
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

    <h3><font face="Verdana">Storing Volatile Data with Client-Side Cookies</font></h3>

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
