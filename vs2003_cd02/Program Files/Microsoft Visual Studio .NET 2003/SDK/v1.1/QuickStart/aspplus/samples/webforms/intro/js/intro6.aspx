<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <script language="JScript" runat=server>

       function SubmitBtn_Click(sender : Object, e : EventArgs) : void {
           Message.Text = "Hi " + HttpUtility.HtmlEncode(Name.Text) + ", you selected: " + Category.SelectedItem;
       }

   </script>

   <body>

       <center>

       <form action="intro6.aspx" method="post" runat="server">

           <asp:adrotator AdvertisementFile="ads.xml" BorderColor="black" BorderWidth=1 runat="server"/>

           <h3> Name: <asp:textbox id="Name" runat="server"/>

           Category:  <asp:dropdownlist id="Category" runat=server>
                         <asp:listitem>psychology</asp:listitem>
                         <asp:listitem>business</asp:listitem>
                         <asp:listitem>popular_comp</asp:listitem>
                      </asp:dropdownlist>

           </h3>

           <asp:button text="Lookup" OnClick="SubmitBtn_Click" runat="server"/>

           <p>

           <asp:label id="Message" runat="server"/>

       </form>

       </center>

   </body>
</html>