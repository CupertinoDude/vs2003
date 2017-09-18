<html>
  <head>
    <title>Microsoft QuickStart Tutorials</title>
  </head>
  <script language="C#" runat="server">
      public void Page_Load(Object sender, EventArgs e) {

          String path = Request.QueryString["path"];

          if (path != null) {

              HttpCookie cookie = new HttpCookie("__quickstart_ver1");
              cookie.Values.Add("installroot", path);
              cookie.Expires = DateTime.MaxValue;
              cookie.Path = "/";

              Response.Cookies.Add(cookie);
          }
      }
  </script>
    <frameset rows="83,*" border="0" frameborder="no">
        <frame scrolling="no" src="doc/toolbar.aspx" >
        <frame name="content" src="doc/default.aspx">
    </frameset>
</html>