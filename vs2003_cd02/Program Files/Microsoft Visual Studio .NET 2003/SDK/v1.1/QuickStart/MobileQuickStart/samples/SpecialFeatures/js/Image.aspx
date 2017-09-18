<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<mobile:Form runat=server>

  <mobile:Image runat="server" ImageURL="../html-image.gif" AlternateText="Buy Stuff!">
    <DeviceSpecific>
      <Choice Filter="PrefersBmp" ImageURL="../wml-image.bmp" />
      <Choice Filter="PrefersWBmp" ImageURL="../wml-image.wbmp" />
    </DeviceSpecific>
  </mobile:Image>

  <%-- Emit a break --%>
  <mobile:Label runat=server></mobile:Label>

  <mobile:Link runat=server NavigateURL="#TargetForm">Buy Stuff Now!</mobile:Link>

</mobile:Form>

<mobile:Form runat=server id="TargetForm">
  <mobile:Label runat=server>m-commerce Portal Here...</mobile:Label>
</mobile:Form>
