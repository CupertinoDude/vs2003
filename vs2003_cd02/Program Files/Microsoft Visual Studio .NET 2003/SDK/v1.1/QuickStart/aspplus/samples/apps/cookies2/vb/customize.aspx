
<html>

  <script language="VB" runat="server">

      Sub Page_Load(Sender As Object, E As EventArgs)

        If Not (IsPostBack)
          Dim Cookie As HttpCookie = Request.Cookies("preferences2")
          ViewState("Referer") = Request.Headers("Referer")

          If Not Cookie Is Nothing
            BackColor.Value = CStr(Cookie.Values("BackColor"))
            ForeColor.Value = CStr(cookie.Values("ForeColor"))
            LinkColor.Value = CStr(cookie.Values("LinkColor"))
            FontSize.Value = CStr(cookie.Values("FontSize"))
            FontName.Value = CStr(cookie.Values("FontName"))
          End If
        End If
      End Sub

      Sub Submit_Click(Sender As Object, E As EventArgs)

        Dim Cookie As HttpCookie
        Cookie = New HttpCookie("preferences2")
        Cookie.Values.Add("ForeColor",ForeColor.Value)
        Cookie.Values.Add("BackColor",BackColor.Value)
        Cookie.Values.Add("LinkColor",LinkColor.Value)
        Cookie.Values.Add("FontSize",FontSize.Value)
        Cookie.Values.Add("FontName",FontName.Value)
        Cookie.Expires = DateTime.MaxValue ' Never Expires
        Response.Cookies.Add(Cookie)

        If Not ViewState("Referer") Is Nothing Then
          Response.Redirect(ViewState("Referer").ToString())
        End If
      End Sub

      Sub Cancel_Click(Sender As Object, E As EventArgs)
        If Not ViewState("Referer") Is Nothing Then
          Response.Redirect(ViewState("Referer").ToString())
        End If
      End Sub

      Function GetStyle(Key As String) As String

        Dim Cookie As HttpCookie
        Cookie = Request.Cookies("preferences2")

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

    table {
      font: <%=GetStyle("FontSize")%> <%=GetStyle("FontName")%>;
      background-color: <%=GetStyle("BackColor")%>;
      foreground-color: <%=GetStyle("ForeColor")%>
    }

    a { color: <%=GetStyle("LinkColor")%> }

  </style>

  <body style="color:<%=GetStyle("ForeColor")%>">

    <form runat="server">

    <h3><font face="Verdana">Customize This Page</font></h3>

    <b>Select Your Preferences: </b><p>

    <table style="color:<%=GetStyle("ForeColor")%>">
      <tr>
        <td>Background Color:</td>
        <td>
          <select id="BackColor" runat="server">
            <option>beige</option>
            <option>yellow</option>
            <option>red</option>
            <option>blue</option>
            <option>lightblue</option>
            <option>lightgreen</option>
            <option>black</option>
            <option>white</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Foreground Color:</td>
        <td>
          <select id="ForeColor" runat="server">
            <option>black</option>
            <option>beige</option>
            <option>yellow</option>
            <option>red</option>
            <option>blue</option>
            <option>lightblue</option>
            <option>lightgreen</option>
            <option>white</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Hyperlink Color:</td>
        <td>
          <select id="LinkColor" runat="server">
            <option>blue</option>
            <option>beige</option>
            <option>yellow</option>
            <option>red</option>
            <option>lightblue</option>
            <option>lightgreen</option>
            <option>black</option>
            <option>white</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Font Size:</td>
        <td>
          <select id="FontSize" runat="server">
            <option>8pt</option>
            <option>10pt</option>
            <option>12pt</option>
            <option>14pt</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Font Name:</td>
        <td>
          <select id="FontName" runat="server">
            <option>verdana</option>
            <option>tahoma</option>
            <option>arial</option>
            <option>times</option>
          </select>
        </td>
      </tr>
    </table>

    <p>

    <input type="submit" OnServerClick="Cancel_Click" Value="Cancel" runat="server"/>
    <input type="submit" OnServerClick="Submit_Click" Value="Submit" runat="server"/>

    </form>

  </body>
</html>
