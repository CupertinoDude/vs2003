
<%@ Control Inherits="PortalModuleControl" Description="Weather Module" Language="C#"%>

<%@ Register TagPrefix="Portal" TagName="LeftModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/LeftModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/LeftModuleFooter.ascx" %>

<Portal:LeftModuleHeader Title="Weather" ModuleSource="Modules\Static\Weather.ascx" ShowEditButton="false" runat="server"/>

<table style="font: 8pt verdana" width="200">
  <tr height="45">
    <td colspan="1" style="font: 10pt verdana;padding-left:10">
        <b> City: </b>
    </td>
    <td colspan="2" style="font: 10pt verdana">
        <select>
          <option>Seattle, WA</option>
          <option>Olympia, WA</option>
          <option>Hoquiam, WA</option>
        </select>
    </td>
  </tr>
  <tr height="25">
    <td colspan="2" style="padding-left:10">
      <b><u>Conditions</u></b>
    </td>
    <td>
      <b><u>Hi/Low</u></b>
    </td>
  </tr>
  <tr>
    <td width="70" align="center">
      <img src="/quickstart/aspplus/samples/portal/CS/images/sunny.gif" border=1>
    </td>
    <td>
      Monday
   </td>
    <td>
      78/75
    </td>
  </tr>
  <tr>
    <td width="70" align="center">
      <img src="/quickstart/aspplus/samples/portal/CS/images/partly_cloudy.gif" border=1>
    </td>
    <td>
      Tuesday
    </td>
    <td>
      78/75
    </td>
  </tr>
  <tr>
    <td width="70" align="center">
      <img src="/quickstart/aspplus/samples/portal/CS/images/overcast.gif" border=1>
    </td>
    <td>
      Wednesday
    </td>
    <td>
      78/75
    </td>
  </tr>
 <tr>
    <td width="70" align="center">
      <img src="/quickstart/aspplus/samples/portal/CS/images/overcast.gif" border=1>
    </td>
    <td>
      Thursday
    </td>
    <td>
      78/75
    </td>
  </tr>
 <tr>
    <td width="70" align="center">
      <img src="/quickstart/aspplus/samples/portal/CS/images/sunny.gif" border=1>
    </td>
    <td>
      Friday
    </td>
    <td>
      78/75
    </td>
  </tr>
  <tr height="65">
    <td colspan="3" style="color:red;padding-left:10">
        This module is for demonstration purposes, it doesn't actually do anything... 
    </td>
  </tr>
</table>

<Portal:LeftModuleFooter runat="server"/>
