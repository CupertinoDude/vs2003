<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script language="C#" runat="server">

void AdCreated_Event(Object sender, AdCreatedEventArgs e)
{
    Message.Text = String.Format("The ad '{0}' was selected.", e.AlternateText);
}

</script>

<mobile:Form runat=server>
    <mobile:AdRotator runat=server AdvertisementFile="../Ads.xml" OnAdCreated="AdCreated_Event" >

      <%-- Use different elements in ad file for different image formats.
           Defaults to ImageUrl, where we have a GIF image --%>
      <DeviceSpecific>
        <Choice Filter="PrefersBmp" ImageKey="BmpImageUrl"/>
        <Choice Filter="PrefersWBmp" ImageKey="WBmpImageUrl"/>
      </DeviceSpecific>

    </mobile:AdRotator>

    <%-- Use empty label for a break --%>
    <mobile:Label runat=server/>
    <mobile:Label runat=server>The above advertisement is randomly chosen from three ads every time you reload this page.</mobile:Label>
    <mobile:Label runat=server Font-Bold="true" id="Message"/>
</mobile:Form>
