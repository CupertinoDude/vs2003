<script runat="server" language="C#">

public String Path = "";

private	String GetRunReference()
{
    return "/MobileQuickstart/util/RunSample.aspx?src=" + Server.UrlEncode(Path) + ".src";
}
    
private	String GetViewSourceReference()
{
    return "/MobileQuickstart/util/SrcView.aspx?src=" + Server.UrlEncode(Path) + ".src";
}
    
private	String GetFileName()
{
    String filename = Path;
    int slash = filename.LastIndexOf ("/");
    if (slash != -1)
    {
        filename = filename.Substring (slash + 1);
    }
    
    return filename + ".aspx";
}
    
</script>

&nbsp;&nbsp;&nbsp;
[<a target="_openview" href="<%= GetRunReference() %>">Run Sample</a>] | 
[<a target="_openview" href="<%= GetViewSourceReference() %>">View Source</a>]

