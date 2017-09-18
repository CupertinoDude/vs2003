<%@ Page Debug="true" Language="C#" Inherits="SiteDirectoryEdit" Src="SiteDirectory_Edit.cs" Description="Site Directory Module Edit Page" %>
<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="EditModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/EditModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="EditModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/EditModuleFooter.ascx" %>

<html>
<head>

</head>

<body bgcolor="ffffff" style="margin:0,0,0,0">

<Portal:PageHeader runat="server"/>
<Portal:EditModuleHeader Title="Site Directory" runat="server"/>

    <form runat="server">

        <table>
            <tr>
                <td style="padding:15,15,15,15">

                    <font face="Arial" size="-1">Select the links to display on the Site Directory module, then click "Submit Changes" to accept the settings.</font>
                    <p>
                     <asp:DataGrid id="myDataGrid" runat="server" AutoGenerateColumns="False" showfooter="false"
                        gridlines=none borderstyle=none borderwidth=0>
                        <Columns>
                          <asp:TemplateColumn>
                            <ItemTemplate>
                              <input type="checkbox" Checked=<%#((Hashtable)Container.DataItem)["IsChecked"] %> id="mSelected" runat="server" >
                              <a style="color:blue;font:10pt verdana, arial" HRef=<%#((Hashtable) Container.DataItem)["LinkRef"] %>
                              InnerHTML=<%# ((Hashtable) Container.DataItem)["LinkName"] %> runat="server" id="Link" />

                            </ItemTemplate>
                          </asp:TemplateColumn>
                        </Columns>
                      </asp:DataGrid>
                </td>
            </tr>
        </table>

        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="<%=UserState["SubheadColor"]%>">
            <tr><td align="center" width="100%" style="padding:10,10,10,10;border-color:black;border-style:solid;border-width:1;border-left:0;border-right:0;border-bottom:0" >
                <input type="submit" value="Submit Changes" runat="server" OnServerClick="Submit_Click">
            </td></tr>
        </table>

<Portal:EditModuleFooter runat="server"/>

</form>
</body>
</html>