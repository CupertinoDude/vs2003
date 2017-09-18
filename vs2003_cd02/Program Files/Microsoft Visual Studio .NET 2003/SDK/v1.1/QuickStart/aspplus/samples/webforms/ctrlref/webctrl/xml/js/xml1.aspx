<%@ Page Language="JScript" %>
<html>
<body>

    <h3><font face="Verdana">Xml Example</font></h3>

    <form runat=server>

        <asp:Xml id="xml1" DocumentSource="people.xml" TransformSource="peopletable.xsl" runat="server" />

    </form>

</body>
</html>
