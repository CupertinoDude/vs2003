<%@ Control Language="VB" Inherits="PageHeader" Src="PageHeader.vb" Description="Portal Site Page Header" %>

<!--BEGIN HEADER-->

        <table border=0 width="100%" cellspacing=0 cellpadding=0>
            <tr>
                <td align=left>
                    <img src="/Quickstart/aspplus/samples/portal/VB/images/home_<%=UserState("ColorScheme") %>.gif" >
                </td>
 
                <td align=right valign=top style="padding:5,15,5,5">
                    <font face=Arial size=-1>
                        <a href="/Quickstart/aspplus/samples/portal/VB/default.aspx">Home</a>
                        <% If (ShowSignOut) Then %>
                        - 
                        <a OnServerClick="SignOff_Click" runat="server">Sign Out</a>
                        <% End If %>
                    </font>
                </td>
            </tr>
            <tr height="8"/>
        </table>
 
<!--END HEADER-->