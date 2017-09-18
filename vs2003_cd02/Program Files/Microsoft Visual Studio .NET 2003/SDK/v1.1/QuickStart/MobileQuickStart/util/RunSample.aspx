<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>

<script runat="server" language="c#">

String _srcFile;
String _filename;
String sampleDirectory = "/MobileQuickStart/Samples/";
private Hashtable srcFiles = new Hashtable();

protected void Page_Load(Object sender, EventArgs e)
{
    if (IsPostBack)
    {
        _filename = PageRef.Value;
    }
    else
    {
        _filename = Request.QueryString["src"];
        PageRef.Value = _filename;
    }

    LoadFileList(_filename);
    HttpCookie codeCookie = Page.Request.Cookies["langpref"];
    String sourceFileType;
    if (codeCookie != null)
    {
        sourceFileType = codeCookie.Value;
    }
    else
    {
        sourceFileType = "VB";
    }

    _srcFile = (String)srcFiles[sourceFileType];

    if (_srcFile == null)
    {
        _srcFile = String.Empty;
    }

    int ext = _filename.IndexOf(".src");
    int slash = _filename.LastIndexOf('/');
    if (ext != -1 && slash != -1 && slash < ext)
    {
        String filename = _filename.Substring(0, ext) + ".desc";
        if(sampleDirectory.IndexOf("..") != -1)
            return;
        if(filename.IndexOf("..") != -1)
            return;
        filename = Server.MapPath(sampleDirectory + filename);

        try
        {
            FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);

            SampleTitle.InnerText = sr.ReadLine();

            StringBuilder description = new StringBuilder();
            String s;
            while ((s = sr.ReadLine()) != null)
            {
                description.Append(s);
                description.Append("\r\n");
            }
            SampleDescription.InnerHtml = description.ToString();

            fs.Close();
        }
        catch (Exception ex)
        {
            SampleTitle.InnerText = "Unknown Sample";
        }
    }
}

protected void Page_Reload(Object sender, EventArgs e)
{
    // Do nothing. This just reloads the page.
}

private String GetSourceCodeReference()
{
    String sourceRef = _filename;
    int ext = sourceRef.IndexOf (".aspx");
    if (ext != -1)
    {
        sourceRef = sourceRef.Substring (0, ext) + ".src";
    }
    return "/MobileQuickstart/util/srcview.aspx?src=" + Server.UrlEncode(sourceRef);
}

private String GetSelfReference()
{
    return Request.Url + "?src=" + Server.UrlEncode(_filename);
}

private void LoadFileList(String src)
{
    String srcFile = String.Concat(sampleDirectory, src);
    String filename = Server.MapPath(srcFile);
    int slash = srcFile.LastIndexOf('/');
    if (slash == -1)
    {
        throw new Exception();
    }
    String samplePath = srcFile.Substring(0, slash + 1);

    FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
    StreamReader sr = new StreamReader(fs);

    String line;
    while ((line = sr.ReadLine()) != null && line.Length > 0)
    {
        int space = line.IndexOf(' ');
        if (space <= 0)
        {
            throw new Exception();
        }

        int colon = line.IndexOf(':');
        if (colon <= space)
        {
            throw new Exception();
        }

        String key = line.Substring(0, space);
        String[] files = line.Substring(colon + 1).Split(new char[] { ',' });
        String fileDescription = line.Substring(0, colon);

        srcFiles[key] = samplePath + files[0];
    }

    fs.Close();
}

</script>

<html>
<head>
<link rel="stylesheet" href="/MobileQuickstart/include/qsstyle.css">
</head>

<script language="jscript">
window.focus();
</script>

<body>
<table style="border:2px solid darkred; background-color:f1e0c6; width:100%">
<tr><td>
<h4 runat="server" id="SampleTitle"></h4>
<span runat="server" id="SampleDescription"></span>
</td></tr>
</table>

<p>

<center>
<table style="border:1px solid black; width:244; height:324" cellpadding="0" cellspacing="0">
<tr><td>
<iframe width="244" height="324" frameborder="0" marginwidth="2" marginheight="2" src="<%= _srcFile %>"></iframe>
</td></tr>
</table>

<table width="240" cellpadding="0" cellspacing="0">
<tr><td>
<form runat="server">
[<a runat="server" OnServerClick="Page_Reload">Reload Sample</a>] 
[<a href="<%= GetSourceCodeReference() %>">View Source</a>] 
<input runat="server" type="hidden" id="PageRef"></input>
</form>
</td></tr>
</table>


</center>


</body>
</html>

