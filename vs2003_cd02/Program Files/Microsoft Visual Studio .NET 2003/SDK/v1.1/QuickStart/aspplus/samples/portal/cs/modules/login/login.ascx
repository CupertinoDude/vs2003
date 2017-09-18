<%@ Control Language="C#" Inherits="Login" Src="Login.cs" Description="Login Page" %>

<!--BEGIN LOGIN MODULE-->
<table width="205" cellpadding=5 cellspacing=0>
   <tr bgcolor="<%= UserState["HeadColor"]%>">
      <td align="left" height="25" style="border-color:black;border-style:solid; border-width:1;">
         <font face="Arial" color="white"><b>Login</b></font>
      </td>
   </tr>
   <tr bgcolor="<%= UserState["LeftColor"]%>">
      <td align="center" height="25" style="border-color:black;border-style:solid; border-top:0;border-width:1">

         <table width="100%">
           <tr>
             <td><font face="Arial" size="-1">UserName: </td>
             <td><b><asp:textbox  id="UserName"   size=14 runat=server /> </td>
           </tr>
           <tr>
             <td><font face="Arial" size="-1">Password: </td>
             <td><input id="Password" type="password" size=14 runat=server></td>
           </tr>
           <tr>
             <td></td>
             <td><input type="submit"  value="     Sign In     "  onServerClick="SubmitBtn_Click" runat=server /></td>
           </tr>
           <tr>
             <td colspan=2 align=center>
                 <a href="/QuickStart/aspplus/samples/portal/CS/user.aspx"><span style="color:black;font:8pt verdana, arial" >Create New Account </font> </a>
             </td>
           </tr>
           <tr>
             <td colspan=2 align=center>
                <span id="ErrorMsg" style="color:black;font:8pt verdana, arial" Visible=false runat=server>
                   <b>Invalid Account Name or Password!</b>
                </span>
             </td>
           </tr>
         </table>

      </td>
   </tr>
</table> 
<!--END LOGIN MODULE-->
