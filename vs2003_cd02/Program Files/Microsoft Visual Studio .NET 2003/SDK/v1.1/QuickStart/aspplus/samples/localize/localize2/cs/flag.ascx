<%@Import Namespace="System.Globalization"%>

<script runat="Server" Language="C#">
    
override protected void Render(HtmlTextWriter writer) 
{
    FlagImage.Src = "../../flags/" + CultureInfo.CurrentCulture + ".jpg";
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName;
  base.Render(writer);
}

</script>


<img runat="server" id="FlagImage" /> 
