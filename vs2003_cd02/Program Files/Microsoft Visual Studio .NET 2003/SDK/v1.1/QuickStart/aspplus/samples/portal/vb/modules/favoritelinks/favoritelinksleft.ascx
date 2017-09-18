<%@ Control Language="VB" Inherits="FavoriteLinksLeft" Src="FavoriteLinksLeft.vb" Description="Favorite Links UI Module" %>
<%@ Register TagPrefix="Portal" Tagname="LeftModuleHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/LeftModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleFooter" Src="/Quickstart/aspplus/samples/portal/VB/include/LeftModuleFooter.ascx" %>

<!--BEGIN FAVORITE LINKS MODULE-->

<Portal:LeftModuleHeader Title="Favorite Links" ModuleSource="Modules\FavoriteLinks\FavoriteLinksLeft.ascx" EditPage="/Quickstart/aspplus/samples/portal/VB/modules/favoritelinks/favoritelinks_edit.aspx?side=Left" runat="server"/>

<table width="100%" style="font: 8pt verdana, arial">
    <tr>
        <td height="25" align="left" valign="top" width="100%" style="padding:15,15,15,15">
            <span id="mySpan" MaintainState="false" runat="server"/>
        </td>
    </tr>
</table>

<Portal:LeftModuleFooter runat="server"/>

<!--END FAVORITE LINKS MODULE-->
