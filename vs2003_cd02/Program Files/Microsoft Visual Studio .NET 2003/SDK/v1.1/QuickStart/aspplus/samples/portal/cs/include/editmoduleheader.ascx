<%@ Control Inherits="PortalModuleControl"  Description="Edit Module Page Header" %>

<script language="C#" runat="server">
    public String Title = "";
</script>

<!--BEGIN EDIT MODULE HEADER-->
    <table width="100%" cellpadding=5 cellspacing=0>
      <tr bgcolor="ffffff">
         <td align="left" colspan=2 bgcolor="<%=UserState["HeadColor"]%>" style="padding:10,0,10,15;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0;border-bottom:0">
             <font face="Arial" color="white"><b>Customize <%=Title%></b></font>
         </td>
      </tr>
      <tr bgcolor="ffffff">
         <td align="left" colspan=2 height="25" style="padding:0,0,0,0;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0">
<!--END EDIT MODULE HEADER-->