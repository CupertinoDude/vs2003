<%@ Page Language="C#" Inherits="PortalModulePage" Description="Under Contruction Page" %>

<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="PageSubHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageSubHeader.ascx" %>

<html>
<head>
<title>Under Construction</title>
</head>
<body bgcolor="ffffff" style="margin:0,0,0,0">

<Portal:PageHeader ShowSignOut="false" runat="server"/>
<Portal:PageSubHeader Title="Please pardon our dust..." runat="server"/>

<table border=0 width="100%" cellspacing=0 cellpadding=0 style="padding:0,0,0,0">

    <tr>
        <td width="1%" valign="top">
            <table border=0 width="100%" cellspacing=5 cellpadding=0 style="padding:5,0,0,0">
                <tr>
                  <td>
                     <img src="/quickstart/aspplus/images/warning.gif">
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
                            <font face="Arial"><b>Under Construction</b></font>
                        </td>
                      </tr>
                      <tr bgcolor="ffffff">
                        <td align="left">
                           <font face="Arial" size="-1">
                               This page has not been completed.  Please visit us another time. <p>
                               [ <a href="/quickstart/aspplus/samples/portal/CS/default.aspx"> Go back to Home Page </a> ]
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