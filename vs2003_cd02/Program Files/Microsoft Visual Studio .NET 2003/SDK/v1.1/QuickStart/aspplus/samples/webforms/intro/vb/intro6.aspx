<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <script language="VB" runat=server>

       Sub SubmitBtn_Click(Sender As Object, E As EventArgs)
           Message.Text = "Hi " & HttpUtility.HtmlEncode(Name.Text) & ", you selected: " & Category.SelectedItem.Text
       End Sub

   </script>

   <body>

       <center>

       <form action="intro6.aspx" method="post" runat="server">

           <asp:adrotator AdvertisementFile="ads.xml" BorderColor="black" BorderWidth=1 runat="server"/>

           <h3> Name: <asp:textbox id="Name" runat="server"/>

           Category:  <asp:dropdownlist id="Category" runat=server>
                         <asp:listitem >psychology</asp:listitem>
                         <asp:listitem >business</asp:listitem>
                         <asp:listitem >popular_comp</asp:listitem>
                      </asp:dropdownlist>
           </h3>

           <asp:button text="Lookup" OnClick="SubmitBtn_Click" runat="server"/>

           <p>

           <asp:label id="Message" runat="server"/>

       </form>

       </center>

   </body>
</html>