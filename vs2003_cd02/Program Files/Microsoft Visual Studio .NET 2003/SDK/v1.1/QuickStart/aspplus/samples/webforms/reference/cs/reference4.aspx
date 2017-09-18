<html>

   <script language="C#" runat=server>

       void Page_Load(Object sender, EventArgs e) {
           Message.InnerHtml = "Welcome to ASP.NET";
       }

   </script>

   <body>
    
      <span id="Message" style="font-size:24" runat=server/>

   </body>

</html>