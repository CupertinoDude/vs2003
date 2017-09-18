<script runat="server" language="C#">

private	void Page_Load(Object sender, EventArgs e)
{
    HttpCookie tocCookie = Request.Cookies["tocpref"];
    this.Visible = tocCookie == null || tocCookie.Value != "Yes";
}
    
</script>


<td class="toc" valign="top" width="210">
<!-- #include virtual="../include/toc.inc" -->
</td>
