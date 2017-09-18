<%@ Page Language="VB" Inherits="DeletePage" Src="DeletePage.vb" Description="Delete Page" %>
<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="/Quickstart/aspplus/samples/portal/VB/include/PageHeader.ascx" %>
 
<html>
<head>
</head>
<body bgcolor="ffffff" style="margin:0,0,0,0">

<Portal:PageHeader ShowSignOut="true" runat="server"/>

<table border=0 width="100%" cellspacing=0 cellpadding=0 >
    <tr>
        <td align=left bgcolor="<%=UserState("HeadColor")%>" width="100%">
            <table bgcolor="<%=UserState("HeadColor")%>" border=0 width="100%" cellspacing=0 cellpadding=2>
                <tr align=left>
                    <td bgcolor="<%=UserState("HeadColor")%>" height="35" style="padding:0,0,0,15;border-color:black;border-style:solid; border-width:1;border-right:0;border-left:0;"><font face=Arial color="white">&nbsp;<b>Confirm Delete</b></font>&nbsp;</td>
                </tr>
                <tr align=left bgcolor="<%=UserState("SubheadColor")%>">
                    <td style="padding:10,0,10,20;border-color:black;border-style:solid; border-width:1;border-right:0;border-left:0;border-top:0"><font face="Arial"><b>Are you sure you want to delete "<%=pageName%>"?</b></font></td>
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
                  <td width="200">
                  </td>
                </tr>
            </table>
        </td>
        <td width="99%" valign="top">
            <table border=0 width="100%" cellspacing=10 cellpadding=0>
                <tr>
                  <td>
                    <!--BEGIN MODULE-->
                    <table width="100%" cellpadding=5 cellspacing=0 border=0>
                      <tr bgcolor="ffffff">
                        <td align="left">
                           <font face="Arial" size="-1">
                               <form runat="server">  
                                   <input type="submit" OnServerClick="Submit_Click" value="Delete Page" runat="server"/>
                                   <input type="button" OnServerClick="Cancel_Click" value="Cancel" runat="server"/>
                               </form> 
                           </font>
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
</body>
</html>