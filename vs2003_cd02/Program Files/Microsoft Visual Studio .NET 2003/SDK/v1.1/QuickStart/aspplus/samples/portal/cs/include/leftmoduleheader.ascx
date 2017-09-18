<%@ Control Language="C#" Inherits="LeftModuleHeader" Src="LeftModuleHeader.cs" Description="Header Control for a Left-side Portal Module" %>

<!--BEGIN MODULE HEADER-->
<table width="205" cellpadding=5 cellspacing=0>
  <tr bgcolor="<%= UserState["HeadColor"]%>">
     <td align="left" height="25" style="border-color:black;border-style:solid; border-right:0; border-width:1;">
        <font face="Arial" color="white"><b> <%= Title %>  </b></font>
     </td>
     <td align="right" height="25" style="border-color:black;border-style:solid; border-left:0; border-width:1;">
&nbsp;
        <a HRef=<%# EditPage %> id="anchorEditPage" runat="server">
            <img Visible= <%# ShowEditButton %>  src="/QuickStart/aspplus/samples/portal/CS/images/edit.gif" runat="server" border="0"/>
        </a>
        <a OnServerClick="CloseButton_Click" runat="server"><img Visible=<%# ShowCloseButton %> src="/QuickStart/aspplus/samples/portal/CS/images/x.gif" border="0" runat="server"></a>
     </td>
  </tr>
  <tr bgcolor="<%= UserState["LeftColor"]%>">
     <td colspan="2" height="25" style="padding:0,0,0,0;border-color:black;border-style:solid; border-top:0;border-width:1">
<!--END MODULE HEADER-->
