<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>

<script language="C#" runat="server">
    void Page_Load(Object sender, EventArgs e) {
        HtmlButton clicker = new HtmlButton();
        clicker.InnerText = "Button 1";
        Bullseye.Controls.Add(clicker);

        clicker = new HtmlButton();
        clicker.InnerText = "Button 2";
        Bullseye.Controls.Add(clicker);

        clicker = new HtmlButton();
        clicker.InnerText = "Button 3";
        Bullseye.Controls.Add(clicker);

        clicker = new HtmlButton();
        clicker.InnerText = "Button 4";
        Bullseye.Controls.Add(clicker);
    }
</script>
<html>
<body>

    <h3><font face="Verdana">PlaceHolder Example</font></h3>

    <asp:PlaceHolder id="Bullseye" runat="server" />

</body>
</html>
