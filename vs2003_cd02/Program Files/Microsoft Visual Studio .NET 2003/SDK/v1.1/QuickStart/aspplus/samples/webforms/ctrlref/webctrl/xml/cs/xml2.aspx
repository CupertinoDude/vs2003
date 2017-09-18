<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<html>
<script language="C#" runat="server">
    void Page_Load(Object sender, EventArgs e) {
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("people.xml"));

        XslTransform trans = new XslTransform();
        trans.Load(Server.MapPath("peopletable.xsl"));

        xml1.Document = doc;
        xml1.Transform = trans;
    }
</script>
<body>

    <h3><font face="Verdana">Xml Example</font></h3>

    <form runat=server>

        <asp:Xml id="xml1" runat="server" />

    </form>

</body>
</html>
