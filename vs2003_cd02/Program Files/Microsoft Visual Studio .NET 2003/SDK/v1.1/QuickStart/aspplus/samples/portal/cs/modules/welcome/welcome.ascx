<%@ Control Language="C#" Inherits="PortalModuleControl" Description="Welcome Module" %>

<%@ Register TagPrefix="Portal" TagName="RightModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="RightModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/RightModuleFooter.ascx" %>

<Portal:RightModuleHeader Title="Welcome to the ASP.NET Portal!" ModuleSource="Modules\Welcome\Welcome.ascx" showEditButton="false" runat="server"/>

    <table width="100%" cellpadding=0 cellspacing=0 style="font: 8pt verdana, arial;">
        <tr>
            <td align="left" valign=top style="padding:0,0,0,0">
               <img align="left" border=0 src="/quickstart/aspplus/samples/portal/CS/images/sidebar_<%=UserState["ColorScheme"]%>.gif">
            </td>
            <td align="left" style="padding:15,15,15,15">

                <b>What is ASP.NET Anyway?</b> ASP.NET is the next generation platform for building middle tier web applications.
                ASP.NET provides a host of application framework services for building powerful web applications.  
                These include:

                <ul> 
                   <li>Web Forms Page Framework (for programming HTML UI)</li>
                   <li>XML Web services Framework (for exposing programatic XML entrypoints)</li>
                   <li>Powerful Caching Architecture (we now provide full page and partial page caching on the server)</li>
                   <li>Scalable State Services (we now scale session state across machines)</li>
                   <li>Flexible Security Infrastructure (pluggable authentication, role based security, sandboxing)</li>
                   <li>Painless Deployment (no more regsrv32, no more locked dlls on server -- just copy an app and it works)</li>
                </ul>

                Please explore this site and it's source code to see how ASP.NET makes web programming simple, fast, and fun!

            </td>
        </tr>
    </table>

<Portal:RightModuleFooter runat="server"/>

