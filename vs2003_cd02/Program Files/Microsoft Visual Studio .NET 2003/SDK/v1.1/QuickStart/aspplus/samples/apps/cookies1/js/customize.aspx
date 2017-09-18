<html>

  <script language="JScript" runat="server">

      function Page_Load(sender:Object, e:EventArgs) : void {
      
        if (!IsPostBack){
          var cookie:HttpCookie = Request.Cookies["preferences1"];
          ViewState["Referer"] = Request.Headers["Referer"];
          
          if ( cookie != null ){
            BackColor.Value = String(cookie.Values["BackColor"]);
            ForeColor.Value = String(cookie.Values["ForeColor"]);
            LinkColor.Value = String(cookie.Values["LinkColor"]);
            FontSize.Value = String(cookie.Values["FontSize"]);
            FontName.Value = String(cookie.Values["FontName"]);
          }
        }
      }

      function Submit_Click(sender:Object, e:EventArgs) : void {
      
        var cookie:HttpCookie = new HttpCookie("preferences1");
        cookie.Values.Add("ForeColor",ForeColor.Value);
        cookie.Values.Add("BackColor",BackColor.Value);
        cookie.Values.Add("LinkColor",LinkColor.Value);
        cookie.Values.Add("FontSize",FontSize.Value);
        cookie.Values.Add("FontName",FontName.Value);
        Response.Cookies.Add(cookie);

        if ( ViewState["Referer"] != null ){
          Response.Redirect(ViewState["Referer"].ToString());
        }
      }

      function Cancel_Click(sender:Object, e:EventArgs) : void {
        if ( ViewState["Referer"] != null ){
          Response.Redirect(ViewState["Referer"].ToString());
        }
      }

      function GetStyle(key:String) : String {
      
        var cookie:HttpCookie = Request.Cookies["preferences1"];
     
        if (cookie != null) {
        
          switch (key) {
          
            case "ForeColor" : 
              return cookie.Values["ForeColor"]; 
              break;
              
            case "BackColor" : 
              return cookie.Values["BackColor"]; 
              break;
              
            case "LinkColor" : 
              return cookie.Values["LinkColor"]; 
              break;
              
            case "FontSize" : 
              return cookie.Values["FontSize"]; 
              break;
              
            case "FontName" : 
              return cookie.Values["FontName"]; 
              break;
          }
        }
        return "";      
      }

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
