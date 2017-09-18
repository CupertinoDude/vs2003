<script language="C#" runat="server">

    String GenLink() {
        String url = Request.Url.ToString();
        String app = null;

        // Strip off the http://
        url = url.Substring(7);

        // Strip off the hostname
        url = url.Substring(url.IndexOf("/"));

        // Figure out the app root
        app = url.Substring(12);
        app = app.Substring(0, app.IndexOf("/"));

        url = "/QuickStart/" + app + "/default.aspx?url=" + url;

        return url;
    }

</script>
<style>
span.GetURLButton {
  font-weight: bold;
  font-size: 8pt;
  color: darkred;
}
</style>
<a style="color:darkred" href="<%=GenLink()%>" target="_top">
  <i>Get URL for this page</i>
</a>