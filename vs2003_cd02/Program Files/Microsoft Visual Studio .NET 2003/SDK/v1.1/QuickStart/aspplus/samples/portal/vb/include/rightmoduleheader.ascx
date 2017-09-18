<%@ Control Language="VB" Inherits="RightModuleHeader" Src="RightModuleHeader.vb" Description="Header Control for a Right-side Portal Module" %>

<!--BEGIN MODULE HEADER-->
<table width="100%" cellpadding=5 cellspacing=0>
   <tr bgcolor="<%= UserState("HeadColor")%>">
      <td align="left" height="25" style="border-color:black;border-style:solid; border-right:0; border-width:1;">
        <font face="Arial" color="white"><b> <%= Title %></b></font>
      </td>
      <td align="right" height="25" style="border-color:black;border-style:solid; border-left:0; border-width:1;">
        &nbsp;
        <span InnerHtml=<%# CustomHtml %> runat="server"/>
        <a id="anchorEditPage" HRef="<%# EditPage %>" runat="server">
            <img Visible= <%# ShowEditButton %> src="/Quickstart/aspplus/samples/portal/VB/images/edit.gif" runat="server" border="0"/>
        </a>
        <a OnServerClick="CloseButton_Click" runat="server"><img Visible=<%# ShowCloseButton %> src="/Quickstart/aspplus/samples/portal/VB/images/x.gif" border="0" runat="server"></a>
      </td>
   </tr>
   <tr bgcolor="ffffff">
      <td colspan="2" style="padding:0,0,0,0;border-color:black;border-style:solid; border-top:0;border-width:1">
<!--END MODULE HEADER-->