<%@ Control Language="C#" Inherits="PortalModuleControl" Description="Local News Module" %>

<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="Local News" ModuleSource="Modules\Static\LocalNews.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana;margin:15,15,15,15">
  <tr>
    <td>
      <b>City Police Chief Resigns</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      <b>Benefit Funds New Schools</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">more...</a>
      <p>
    </td>
  <tr>
  <tr>
    <td>
      <b>Gardening Tips for the Summer</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      [ <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">Top Stories</a> 
      | <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">Lifestyle</a> 
      | <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">Movie Listings</a> 
      | <a href="/quickstart/aspplus/samples/portal/CS/constr.aspx">Humor</a> ]
    </td>
  </tr>
  <tr height="35">
      <td style="color:red">
          This module is for demonstration purposes, it doesn't actually do anything... 
      </td>
  </tr>
</table>

<Portal:RightModuleFooter runat="server"/>
