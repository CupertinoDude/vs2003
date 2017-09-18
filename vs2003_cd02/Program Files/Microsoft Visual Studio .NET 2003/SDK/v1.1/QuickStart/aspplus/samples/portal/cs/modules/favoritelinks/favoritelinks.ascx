<%@ Control Language="C#" Inherits="FavoriteLinks" Src="FavoriteLinks.cs" Description="Favorite Links UI Module" %>
<%@ Register TagPrefix="Portal" Tagname="RightModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleFooter.ascx" %>

<!--BEGIN FAVORITE LINKS MODULE-->

<Portal:RightModuleHeader Title="Favorite Links" ModuleSource="Modules\FavoriteLinks\FavoriteLinks.ascx" EditPage="/QuickStart/aspplus/samples/portal/CS/modules/favoritelinks/favoritelinks_edit.aspx" runat="server"/>

<table width="100%" bgcolor="ffffff" style="font: 8pt verdana, arial">
    <tr>
        <td height="25" align="left" valign="top" width="50%" style="padding:15,15,15,15">
            <span id="mySpan" MaintainState="false" runat="server"/>
        </td>
    </tr>
</table>

<Portal:RightModuleFooter runat="server"/>

<!--END FAVORITE LINKS MODULE-->
