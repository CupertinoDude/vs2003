<%@ Page Inherits="PortalModulePage" Description="Congrats Page" Language="VB" %>

<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="include/PageHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="PageSubHeader" Src="include/PageSubHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="PageSubFooter" Src="include/PageSubFooter.ascx" %>

<html>
<body bgcolor="ffffff" style="margin:0,0,0,0">

    <Portal:PageHeader runat="server"/>
    <Portal:PageSubHeader Title="Congratulations!" runat="server"/>

   <br>

   <center>
     <form runat="server">
     </form>

     <table style="font: 10pt verdana" width="90%">
       <tr>
          <td>
            An account has been created for username <%=User.Identity.Name%>.  You may customize your new home page now, or choose to this at a later time.
            <p>
            <ul>
              <li><a href="restricted/customize.aspx">I want to customize my home page now</a>
              <li><a href="default.aspx">I want to do this later</a>
            </ul>
          </td>
        </tr>
      </table>

    </center>

    <p>

    <Portal:PageSubFooter runat="server"/>

</body>
</html>
