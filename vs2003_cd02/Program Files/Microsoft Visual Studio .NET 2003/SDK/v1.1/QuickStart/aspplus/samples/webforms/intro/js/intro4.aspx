<%@ Page Language="JScript"%>

<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <body>

       <center>

       <form action="intro4.aspx" method="post" runat=server>

           <h3> Name: <asp:textbox id="Name" runat="server"/>

           Category:  <asp:dropdownlist id="Category" runat=server>
                         <asp:listitem>psychology</asp:listitem>
                         <asp:listitem>business</asp:listitem>
                         <asp:listitem>popular_comp</asp:listitem>
                      </asp:dropdownlist>

           </h3>

           <asp:button text="Lookup" runat="server"/>

       </form>

       </center>

   </body>
</html>