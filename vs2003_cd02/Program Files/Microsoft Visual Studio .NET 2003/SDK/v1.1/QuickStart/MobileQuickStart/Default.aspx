<%@ Page Language="C#" %>
<html>
 <head>
  <title>Microsoft Mobile Controls QuickStart Tutorial</title>
 </head>
    <frameset rows="83,*" border="0" frameborder="no">
        <frame scrolling="no" src="doc/toolbar.aspx" >
<% if ( Request.QueryString["url"] == null ) { %>
        <frame name="content" src="doc/introduction.aspx">
<% } else { %>
        <frame name="content" src="<%=Request.QueryString["url"]%>">
<% } %>
    </frameset>
</html>