<%@ Page Language="C#" Inherits="PortalModulePage" Description="Intermediate Login Page" %>

<%@ Register TagPrefix="Portal" TagName="LoginModule" Src="modules/login/login.ascx" %>
<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>

<html>
<head>

</head>
<body bgcolor="ffffff" style="margin:0,0,0,0">

<Portal:PageHeader ShowSignOut="false" runat="server"/>

<table border=0 width="100%" cellspacing=0 cellpadding=0 >
    <tr>
        <td align=left bgcolor="<%= UserState["HeadColor"]%>" width="100%">
            <table bgcolor="<%= UserState["HeadColor"]%>" border=0 width="100%" cellspacing=0 cellpadding=2>
                <tr align=left>
                    <td><font face=Arial >&nbsp;<b>Please Login</b></font>&nbsp;</td>
                </tr>
                <tr align=left bgcolor="<%= UserState["SubheadColor"]%>">
                    <td><font face=Arial size=-1>&nbsp;You need to supply a unique username and password that we can use to identify your personal settings</font>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table border=0 width="100%" cellspacing=0 cellpadding=0 style="padding:0,0,0,0">

    <tr>
        <td width="1%" valign="top">
            <table border=0 width="100%" cellspacing=5 cellpadding=0 style="padding:5,0,0,0">
                <tr>
                  <td>
                     <form runat="server"> 
                        <Portal:LoginModule runat="server"/>
                     </form>
                  </td>
                </tr>
            </table>
        </td>
        <td width="99%" valign="top">
            <table border=0 width="100%" cellspacing=10 cellpadding=0>
                <tr>
                  <td>
                    <table width="100%" cellpadding=5 cellspacing=0 border=0>
                      <tr>
                        <td align="left" height="25">
                            <font face="Arial"><b>Create a Custom Home Page!</b></font>
                        </td>
                      </tr>
                      <tr bgcolor="ffffff">
                        <td align="left">
                           <font face="Arial" size="-1">
                               The ASP.NET Portal can be customized with your own personal settings.  You can choose which modules to display, personalize their default content, manage your page's layout, color scheme, and more!  To get started, enter a login name and password at the left side of this page.
                               Note that if you have logged in before, we will attempt to retrieve your previous customization settings.
                           </font>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
            </table>
        </td>
    </tr>

</table> 
</body>
</html>