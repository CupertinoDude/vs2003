<%@ Page Language="JScript" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<html>
<script language="JScript" runat="server">
    function Page_Load(sender:Object, e:EventArgs) : void {
        var doc:XmlDocument = new XmlDocument();
        doc.Load(Server.MapPath("people.xml"));

        var trans:XslTransform = new XslTransform();
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
