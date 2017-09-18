<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Collections" %>
<%@ Register TagPrefix="Acme" TagName="SourceCtrl" Src="SrcCtrl.ascx"%>

<script runat="server" language="c#">

String _source = String.Empty;
private const String sampleDirectory = "/MobileQuickstart/Samples/";
private Hashtable srcFiles = new Hashtable();

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        String font = Request.QueryString["font"];
        if (font != null) 
        {
            FontSize.SelectedIndex = (Int32.Parse(font) - 1);
        } 
        else 
        {
            font = (String) Session["SrcViewer.FontSize"];
            if ( font != null ) 
            {
                FontSize.SelectedIndex = (Int32.Parse(font) - 1);
            } 
            else 
            {
                FontSize.SelectedIndex = 2;
            }
        }
    }

    MySourceCtrl.FontSize = Int32.Parse(FontSize.SelectedItem.Value);

    try
    {
        String filename = Request.QueryString["src"];
        if (filename == null)
        {
            return;
        }

        LoadDescription(filename);

        String sourceFile = Request.QueryString["file"];
        if (sourceFile == null)
        {
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
            sourceFile = LoadFileList(filename, sourceFileType);
        }
        else
        {
            LoadFileList(filename, null);
        }

        LoadFile(sourceFile);
    }
    catch
    {
    }
}

private void LoadDescription(String src)
{
    int ext = src.IndexOf(".src");
    if (ext == -1)
    {
        throw new HttpException();
    }

    String descriptionFile = String.Concat(sampleDirectory, src.Substring(0, ext), ".desc");
    if(descriptionFile.IndexOf("..") != -1)
        return;
    String filename = Server.MapPath(descriptionFile);

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

private String LoadFileList(String src, String fileType)
{
    String defaultFile = null;
    String srcFile = String.Concat(sampleDirectory, src);
    if(srcFile.IndexOf("..") != -1)
        return defaultFile;
    String filename = Server.MapPath(srcFile);
    int slash = srcFile.LastIndexOf('/');
    if (slash == -1)
    {
        throw new Exception();
    }
    String samplePath = srcFile.Substring(0, slash + 1);

    FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
    StreamReader sr = new StreamReader(fs);

    StringBuilder fileLinks = new StringBuilder();
    fileLinks.Append("<table>");
    String line;
    while ((line = sr.ReadLine()) != null && line.Length > 0)
    {
        line = line.Trim();

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

        String[] files = line.Substring(colon + 1).Split(new char[] { ',' });
        String fileDescription = line.Substring(0, colon);

        if (fileType != null)
        {
            if (fileType == line.Substring(0, space))
            {
                defaultFile = files[0];
                fileType = null;
            }
        }

        fileLinks.Append("<tr><td>");
        fileLinks.Append(fileDescription);
        fileLinks.Append("</td><td>&nbsp;&nbsp;&nbsp;&nbsp;");
        for (int i = 0; i < files.Length; i++)
        {
            srcFiles[files[i]] = samplePath + files[i];
            if (i > 0)
            {
                fileLinks.Append(", ");
            }
            fileLinks.Append("<a href=\"SrcView.aspx?src=");
            fileLinks.Append(src);
            fileLinks.Append("&file=");
            fileLinks.Append(Server.UrlEncode(files[i]));
            fileLinks.Append("\">");
            fileLinks.Append(files[i]);
            fileLinks.Append("</a>");
        }
        fileLinks.Append("</td></tr>");
    }
    fileLinks.Append("</table>");

    fs.Close();

    FileLinks.InnerHtml = fileLinks.ToString();
    return defaultFile;
}

private void LoadFile(String file)
{
    String filename = (String)srcFiles[file];
    if (filename == null)
    {
        _source = "Exception occurred with" + file;
        DataBind();
        throw new HttpException();
    }

    if(filename.IndexOf("..") != -1)
        return;
    filename = Server.MapPath(filename);
    MySourceCtrl.filename = filename;
}

public void Size_Select(Object sender, EventArgs e)
{
    MySourceCtrl.FontSize = Int32.Parse(FontSize.SelectedItem.Value);
    Session["SrcViewer.FontSize"] = FontSize.SelectedItem.Value.ToString();
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
<form runat="server">
<table style="border:2px solid darkred; background-color:f1e0c6; width:100%">
<tr><td>
<table width="100%">
<tr>
<td><h4 runat="server" id="SampleTitle"></h4></td>
<td align="right">
    <span class="SampleTitle">Font Size:</span>
    <asp:DropDownList class="Select" id="FontSize" OnSelectedIndexChanged="Size_Select" AutoPostBack runat="server">
      <asp:ListItem value="1" runat="server">1</asp:ListItem>
      <asp:ListItem value="2" runat="server">2</asp:ListItem>
      <asp:ListItem value="3" runat="server">3</asp:ListItem>
      <asp:ListItem value="4" runat="server">4</asp:ListItem>
      <asp:ListItem value="5" runat="server">5</asp:ListItem>
      <asp:ListItem value="6" runat="server">6</asp:ListItem>
      <asp:ListItem value="7" runat="server">7</asp:ListItem>
    </asp:DropDownList>
</td>
</tr>
</table>
<span runat="server" id="SampleDescription"></span><br>
<span runat="server" id="FileLinks"></span><br>
</td></tr>
</table>

<p>

<Acme:SourceCtrl id="MySourceCtrl" runat="server" />

</form>

</body>
</html>

