<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

</script>

<mobile:Form runat="server" Wrapping="NoWrap">
    <mobile:Label runat="server" StyleReference="title" Text="Today's Weather" />
    <mobile:List runat="server">
        <Item Text="Sydney: Sunny, 52F" />
        <Item Text="Tel Aviv: Sunny, 75F" />
        <Item Text="New York: Rainy, 58F" />
        <Item Text="Madrid: Cloudy, 70F" />
        <Item Text="Tokyo: Cloudy, 65F" />
    </mobile:List>
</mobile:Form>


