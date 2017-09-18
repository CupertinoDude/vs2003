<html>

   <script language="VB" runat=server>

       Sub Page_Load(Sender As Object, E As EventArgs)
           Message.InnerHtml = "Welcome to ASP.NET"
       End Sub

   </script>

   <body>
    
      <span id="Message" style="font-size:24" runat=server/>

   </body>

</html>