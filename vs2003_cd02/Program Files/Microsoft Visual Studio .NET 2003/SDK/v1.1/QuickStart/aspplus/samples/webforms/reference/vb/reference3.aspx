<html>

   <script language="VB" runat=server>

       Sub Page_Load(Sender As Object, E As EventArgs)
           Message.Text = "Welcome to ASP.NET"
       End Sub

   </script>

   <body>
    
      <asp:label id="Message" font-size=24 runat=server/>

   </body>

</html>