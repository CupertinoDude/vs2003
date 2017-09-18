<%@ Control Language="VB" Inherits="PortalModuleControl" Description="Local News Module" %>

<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="Local News" ModuleSource="Modules\Static\LocalNews.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana;margin:15,15,15,15">
  <tr>
    <td>
      <b>City Police Chief Resigns</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      <b>Benefit Funds New Schools</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">more...</a>
      <p>
    </td>
  <tr>
  <tr>
    <td>
      <b>Gardening Tips for the Summer</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      [ <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">Top Stories</a> 
      | <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">Lifestyle</a> 
      | <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">Movie Listings</a> 
      | <a href="/Quickstart/aspplus/samples/portal/VB/constr.aspx">Humor</a> ]
    </td>
  </tr>
  <tr height="35">
      <td style="color:red">
          This module is for demonstration purposes, it doesn't actually do anything... 
      </td>
  </tr>
</table>

<Portal:RightModuleFooter runat="server"/>
