<html>

   <script language="JScript" runat=server>

       function Page_Load(sender:Object, e:EventArgs) : void {
           Message.InnerHtml = "Welcome to ASP.NET";
       }

   </script>

   <body>
    
      <span id="Message" style="font-size:24" runat=server/>

   </body>

</html>