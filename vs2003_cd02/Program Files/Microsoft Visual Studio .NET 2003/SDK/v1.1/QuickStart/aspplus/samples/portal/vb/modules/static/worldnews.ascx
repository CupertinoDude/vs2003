<%@ Control Language="VB" Inherits="PortalModuleControl" Description="World News Module" %>

<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/Quickstart/aspplus/samples/portal/VB/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="World News" ModuleSource="Modules\Static\WorldNews.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana;margin:15,15,15,15">
  <tr>
    <td>
      <b>ASP.NET Takes the World by Storm!</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      <b>NASDAQ Climbs to Record High</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="constr.aspx">more...</a>
      <p>
    </td>
  <tr>
  <tr>
    <td>
      <b>Noteworthy Accomplishments of the 21st Century</b><br>
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt.
      <br>
      <a href="constr.aspx">more...</a>
      <p>
    </td>
  </tr>
  <tr>
    <td>
      [ <a href="constr.aspx">Top Stories</a> 
      | <a href="constr.aspx">Market News</a> 
      | <a href="constr.aspx">Tech News</a> 
      | <a href="constr.aspx">National Weather</a> ]
    </td>
  </tr>
  <tr height="35">
      <td style="color:red">
          This module is for demonstration purposes, it doesn't actually do anything... 
      </td>
  </tr>
</table>

<Portal:RightModuleFooter runat="server"/>
