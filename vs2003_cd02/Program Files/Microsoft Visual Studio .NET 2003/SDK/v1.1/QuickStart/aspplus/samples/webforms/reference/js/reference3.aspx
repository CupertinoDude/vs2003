<html>

   <script language="JScript" runat=server>

       function Page_Load(sender:Object, e:EventArgs) : void {
           Message.Text = "Welcome to ASP.NET";
       }

   </script>

   <body>
    
      <asp:label id="Message" font-size=24 runat=server/>

   </body>

</html>