<%@ Control Language="VB" Inherits="SiteDirectory" Src="sitedirectory.vb" Description="Site Directory UI Module" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/LeftModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleFooter" Src="/Quickstart/aspplus/samples/portal/VB/include/LeftModuleFooter.ascx" %>

<!--BEGIN SITE DIRECTORY MODULE-->

<Portal:LeftModuleHeader Title="Site Directory" ModuleSource="Modules\SiteDirectory\SiteDirectory.ascx" EditPage="/Quickstart/aspplus/samples/portal/VB/modules/sitedirectory/sitedirectory_edit.aspx" runat="server"/>

    <table width="100%">
        <tr>
            <td width="100%" align="left" style="padding:15,15,0,15">
                <asp:DataList id="myDataGrid" ShowHeader="false" showFooter="false"
                     maintainstate="false" GridLines="none" runat="server" borderstyle=none borderwidth=0>
                    <ItemTemplate>
                        <font face="Arial" size=-1>
                            <img src="/Quickstart/aspplus/samples/portal/VB/images/bullet.gif" align="middle">
                            <a Href=<%# CType(Container.DataItem, Hashtable)("LinkRef") %> InnerHTML=<%# CType(Container.DataItem, Hashtable)("LinkName") %> style="font:8pt verdana, arial" runat="server"/><br>
                        </font>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>

<br>

<Portal:LeftModuleFooter runat="server"/>

<!--END SITE DIRECTORY MODULE-->
