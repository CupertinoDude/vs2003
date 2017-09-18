<%@Import Namespace="System.Globalization"%>

<script runat="Server" Language="VB">
Overrides Protected Sub Render(Writer As HtmlTextWriter) 

    FlagImage.Src = "../../../flags/" & CultureInfo.CurrentCulture.ToString() & ".jpg"
    FlagImage.Alt = CultureInfo.CurrentCulture.NativeName
    MyBase.Render(writer)
End Sub
</script>


<img runat="server" id="FlagImage" /> 
