<%@ Page Language="VB" Debug="True" Inherits="Customize" Src="customize.vb" Description="Customize/Add Module Page" %>
<%@ Register TagName="PageHeader" TagPrefix="PageHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/PageHeader.ascx" %>

<html>
<head>
</head>

<body bgcolor="ffffff" style="margin:0,0,0,0">
<form  runat="server" >

<PageHeader:PageHeader runat="server"/>

<table border=0 width="100%" cellspacing=0 cellpadding=0 style="padding:0,0,0,0">
    <tr align=left>
      <td bgcolor="<%# UserState("HeadColor")%>" height="35" style="padding:0,0,0,15;border-color:black;border-style:solid; border-width:1;border-right:0;border-left:0;border-bottom:0"><font face=Arial color="white">&nbsp;<b>Personalize This Page</b></font>&nbsp;</td>
    </tr>
    <tr>
      <td width="100%" valign="top">
        <table border=0 width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td>
              <!--BEGIN MODULE-->
                <table width="100%" cellpadding=5 cellspacing=0>
                  <tr>
                    <td align="left" height="75" bgcolor="<%# UserState("SubheadColor")%>" style="padding:15,15,15,20;border-color:black;border-style:solid; border-width:1;border-right:0;border-left:0">
                     <font face="Arial"><b>Page Name</b></font> &nbsp;&nbsp;<input type="text" id="txtPageName" value=<%# pageName %> size="35" runat="server"/>
                    </td>
                    <td align="right" bgcolor="<%# UserState("SubheadColor")%>" style="padding:15,15,15,15;border-color:black;border-style:solid;border-width:1;border-left:0;border-right:0">
                        <input type="submit" value="Submit Changes" OnServerClick="Submit_Click" runat="server"/>
                    </td>
                  </tr>
                  <tr bgcolor="ffffff">
                    <td align="left" colspan="2" width="50%" height="25" style="padding:15,15,15,15;border-color:black;border-style:solid;                            border-top:0;border-width:1;border-right:0;border-left:0">
                      <asp:DataGrid id="myDataGrid" runat="server" AutoGenerateColumns="False" showfooter="false"
                        gridlines=none borderstyle=none borderwidth=0>
                        <Columns>
                          <asp:TemplateColumn>
                            <ItemTemplate>
                              <input type="checkbox" Checked=<%# CType(Container.DataItem, Hashtable).Item("IsChecked") %> id="mSelected" runat="server" >
                              <a style="color:blue;font:10pt verdana, arial" HRef=<%# CType(Container.DataItem, HashTable).Item("DemoSource") %>
                              InnerHTML=<%# CType(Container.DataItem, Hashtable).Item("Name") %> runat="server"/>
                              <font size="-2">&nbsp;( <asp:label text=<%# CType(Container.DataItem, Hashtable).Item("Type") %> id="mType" runat="server"/> ) </font><br>
                              <asp:label style="color:black;font:8pt verdana, arial" text=<%# CType(Container.DataItem, Hashtable).Item("Description") %> runat="server"/><p>
                            </ItemTemplate>
                          </asp:TemplateColumn>
                        </Columns>
                      </asp:DataGrid>
                    </td>
                  </tr>
                  <tr bgcolor="<%# UserState("SubheadColor")%>">
                    <td align="left" height="55" style="border-color:black;border-style:solid;                          border-width:1;border-top:0;border-right:0;border-left:0"> &nbsp;
                    </td>
                    <td align="right"                    style="padding:15,15,15,15;border-color:black;border-style:solid;border-width:1;border-top:0;border-right:0;border-left:0">
                      <input type="submit" value="Submit Changes" OnServerClick="Submit_Click" runat="server"/>
                    </td>
                  </tr>
                </table>
                <!--END MODULE-->
              </td>
            </tr>
          </table>
        </td>
    </tr>
</table>

</form>
</body>
</html>