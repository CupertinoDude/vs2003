<%@ Control Inherits="PortalModuleControl"  Description="Page Sub Header" %>

<script language="VB" runat="server">
    public Title As String = ""
</script>

<!--BEGIN PAGE SUB HEADER-->
    <table width="100%" cellpadding=5 cellspacing=0>
      <tr bgcolor="ffffff">
         <td align="left" colspan=2 bgcolor="<%=UserState("HeadColor")%>" style="padding:10,0,10,15;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0;">
             <font face="Arial" color="white"><b><%=Title%></b></font>
         </td>
      </tr>
    </table>
<!--END PAGE SUB HEADER-->