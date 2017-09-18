<%@ Page Language="VB" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>

<script language="VB" runat="server">
    Sub Page_Load(Sender As Object, E As EventArgs)
        Dim clicker As HtmlButton = New HtmlButton()
        clicker.InnerText = "Button 1"
        Bullseye.Controls.Add(clicker)

        clicker = New HtmlButton()
        clicker.InnerText = "Button 2"
        Bullseye.Controls.Add(clicker)

        clicker = New HtmlButton()
        clicker.InnerText = "Button 3"
        Bullseye.Controls.Add(clicker)

        clicker = New HtmlButton()
        clicker.InnerText = "Button 4"
        Bullseye.Controls.Add(clicker)
    End Sub
</script>
<html>
<body>

    <h3><font face="Verdana">PlaceHolder Example</font></h3>

    <asp:PlaceHolder id="Bullseye" runat="server" />

</body>
</html>
