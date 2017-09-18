<%@ Page Language="C#" %>
<html>
 <head>
  <title>Microsoft Windows Forms QuickStart Tutorial</title>
 </head>
    <frameset rows="83,*" border="0" frameborder="no">
        <frame scrolling="no" src="doc/toolbar.aspx" >
<% 
   // UrlMaker.ascx only works if the quickstarts
   // are hosted off of the /QuickStart/ vroot.  We
   // can take advantage of this to verify the URL
   string url = Request.QueryString["url"];
   bool verified = true;
   if ( url != null )
   {
       if ( url.ToLower().StartsWith("/quickstart/") ||
            url.ToLower().StartsWith("quickstart/")  )
       {
           verified = true;
       }
       else
       {
           verified = false;
       }
   }

   if ( url == null || !verified ) { %>
        <frame name="content" src="doc/default.aspx">
<% } else { %>
        <frame name="content" src="<%=Request.QueryString["url"]%>">
<% } %>
    </frameset>
</html>