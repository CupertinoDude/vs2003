<%@ Page Language="C#"%>
<html>
  <head>
    <title>Microsoft QuickStart Setup</title>
  </head>
    <frameset rows="83,*" border="0" frameborder="no">
        <frame scrolling="no" src="doc/toolbar.aspx" >
        <frame name="content" src="doc/cookie.aspx?ReturnUrl=<%=HttpUtility.HtmlEncode(Request.QueryString["ReturnUrl"])%>">
    </frameset>
</html>
