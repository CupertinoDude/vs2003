<%@Import Namespace="System.Globalization"%>

<script runat="Server" Language="JScript">

protected function Render(writer:HtmlTextWriter) : void {
    FlagImage.Src = "../../../flags/" + CultureInfo.CurrentCulture + ".jpg";
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName;
    super.Render(writer);
}

</script>


<img runat="server" id="FlagImage" />
