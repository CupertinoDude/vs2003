<%@ Page Language="VB" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<html>
<script language="VB" runat="server">
    Sub Page_Load(Sender As Object, E As EventArgs)
        Dim doc As XmlDocument = New XmlDocument()
        doc.Load(Server.MapPath("people.xml"))

        Dim trans As XslTransform = new XslTransform()
        trans.Load(Server.MapPath("peopletable.xsl"))

        xml1.Document = doc
        xml1.Transform = trans
    End Sub
</script>
<body>

    <h3><font face="Verdana">Xml Example</font></h3>

    <form runat=server>

        <asp:Xml id="xml1" runat="server" />

    </form>

</body>
</html>
