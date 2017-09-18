<%@ Control Language="C#" Inherits="PageHeader" Src="PageHeader.cs" Description="Portal Site Page Header" %>

<!--BEGIN HEADER-->

        <table border=0 width="100%" cellspacing=0 cellpadding=0>
            <tr>
                <td align=left>
                    <img src="/QuickStart/aspplus/samples/portal/CS/images/home_<%=UserState["ColorScheme"] %>.gif""  >
                </td>
 
                <td align=right valign=top style="padding:5,15,5,5">
                    <font face=Arial size=-1>
                        <a href="/QuickStart/aspplus/samples/portal/CS/default.aspx">Home</a>
                        <% if (ShowSignOut) { %>
                        - 
                        <a OnServerClick="SignOff_Click" runat="server">Sign Out</a>
                        <% } %>
                    </font>
                </td>
            </tr>
            <tr height="8"/>
        </table>
 
<!--END HEADER-->