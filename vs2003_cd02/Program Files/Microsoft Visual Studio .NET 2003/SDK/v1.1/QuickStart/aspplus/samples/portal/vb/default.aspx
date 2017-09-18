
<%@ Page Language="VB" Inherits="DefaultPage" Src="Default.vb" Description="Main Portal Page" %>
<%@ Register TagPrefix="LoginModule" TagName="LoginModule" Src="modules/login/login.ascx" %>

<html>
<head>
<title>ASP.NET PORTAL SITE</title>
</head>

<body bgcolor="<%=UserState("BackColor")%>" style="margin:0,0,0,0">

   <form runat=server>

      <table border=0 width="100%" cellspacing=0 cellpadding=0 bgcolor="ffffff">
         <tr>
           <td align=left>
            <img src="/Quickstart/aspplus/samples/portal/VB/images\home_<%# UserState("ColorScheme") %>.gif">
           </td>

           <td align=right valign=top style="padding:5,15,5,5">
             <font face=Arial size=-1>
                <a href="/Quickstart/aspplus/samples/portal/VB/default.aspx?default.aspx">Update</a>
                <asp:Label id="spanSignOff" Text="&nbsp;-&nbsp;" runat="server"/>
                <a id="anchorSignOff" OnServerClick="SignOff_Click" runat="server">Sign Out</a>
             </font>
           </td>
         </tr>
         <tr height="8"/>
    </table>

    <table border=0 width="100%" bgcolor="ffffff" cellspacing=0 cellpadding=0 >
       <tr>
          <span id="PagePanelLinks" EnableViewState="false" runat=server/>

          <td width="1%">&nbsp;</td>
          <td align=right bgcolor="<%=UserState("SubheadColor")%>" width="50%" style="padding:0,10,0,0">
             <font size=-1 face=Arial>
                [<a id="anchorAdd" href="" OnServerClick="AddPage_Click" runat="server">Add Page</a>
                 <asp:Label id="spanAdd" Text="&nbsp;-&nbsp;" runat="server"/>
                 <a id="anchorDelete" href="" runat="server">Delete Page</a>
                 <asp:Label id="spanDelete" Text="&nbsp;-&nbsp;" runat="server"/>
                 <a id="anchorOptions" href="" runat="server">Change Colors</a>]
             </font>
          </td>

       </tr>
       <tr>
          <td width="100%" colspan=11>
             <table border=0 cellspacing=0 width="100%">
                <tr>
                    <td bgcolor="<%=UserState("HeadColor")%>">
                        <table border=0 cellspacing=0 cellpadding=0>
                            <tr><td height=3></td></tr>
                        </table>
                    </td>
                </tr>
             </table>
          </td>
       </tr>
    </table>

    <table border=0 width="100%" cellspacing=0 cellpadding=0 style="padding:0,0,0,0">
       <tr>
         <td width="1%" valign="top">

            <table border=0 width="100%" cellspacing=10 cellpadding=0 style="padding:0,0,0,0">

            <tr valign="top">
              <td height="10" style="padding-top:5" align="left">
                  <table cellpadding=0 cellspacing=0>
                      <tr>
                          <td><img border=0 src="/Quickstart/aspplus/samples/portal/VB/images\personal.gif"></td>
                          <td><a id="anchorCustomize" runat="server"><img border=0 src="/Quickstart/aspplus/samples/portal/VB/images\content.gif"></a></td>
                          <td><img border=0 src="/Quickstart/aspplus/samples/portal/VB/images\space.gif"></td>
                          <td><a id="anchorOptions2" runat="server"><img border=0 src="/Quickstart/aspplus/samples/portal/VB/images\layout.gif"></a></td>
                      </tr>
                  </table>
              </td>
            </tr>
             <tr> <td>
                <!-- BEGIN DYNAMIC LEFT MODULE LIST -->
                <asp:Panel id="Login" EnableViewState="false" visible="false" runat="server">
                    <LoginModule:LoginModule runat="server"/>
                </asp:Panel>
                <asp:PlaceHolder id="LeftUIModules" runat=server/>

                <!-- END DYNAMIC LEFT MODULE LIST -->
               </td> </tr>
            </table>
         </td>
         <td width="99%" valign="top">

            <table border=0 width="100%" cellspacing=10 cellpadding=0>

                <!-- BEGIN DYNAMIC RIGHT MODULE LIST -->

                <asp:PlaceHolder id="RightUIModules" runat=server/>

                <!-- END DYNAMIC RIGHT MODULE LIST -->

            </table>
         </td>
      </tr>
    </table>

   </form>

</body>
</html>