<%@ Control Language="C#" Inherits="SiteDirectory" Src="SiteDirectory.cs" Description="Site Directory UI Module" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/LeftModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="LeftModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/LeftModuleFooter.ascx" %>

<!--BEGIN SITE DIRECTORY MODULE-->

<Portal:LeftModuleHeader Title="Site Directory" ModuleSource="Modules\SiteDirectory\SiteDirectory.ascx" EditPage="/QuickStart/aspplus/samples/portal/CS/modules/sitedirectory/sitedirectory_edit.aspx" runat="server"/>

    <table width="100%">
        <tr>
            <td width="100%" align="left" style="padding:15,15,0,15">
                <asp:DataList id="myDataGrid" ShowHeader="false" showFooter="false"
                     maintainstate="false" GridLines="none" runat="server" borderstyle=none borderwidth=0>
                    <ItemTemplate>
                        <font face="Arial" size=-1>
                            <img src="/QuickStart/aspplus/samples/portal/CS/images/bullet.gif" align="middle">
                            <a Href=<%# ((Hashtable) Container.DataItem)["LinkRef"] %> InnerHTML=<%# ((Hashtable) Container.DataItem)["LinkName"] %> style="font:8pt verdana, arial" runat="server"/><br>
                        </font>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>

<br>

<Portal:LeftModuleFooter runat="server"/>

<!--END SITE DIRECTORY MODULE-->
