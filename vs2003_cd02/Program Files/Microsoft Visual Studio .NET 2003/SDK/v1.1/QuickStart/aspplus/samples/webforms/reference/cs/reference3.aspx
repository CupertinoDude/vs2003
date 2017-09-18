<html>

   <script language="C#" runat=server>

       void Page_Load(Object sender, EventArgs e) {
           Message.Text = "Welcome to ASP.NET";
       }

   </script>

   <body>
    
      <asp:label id="Message" font-size=24 runat=server/>

   </body>

</html>