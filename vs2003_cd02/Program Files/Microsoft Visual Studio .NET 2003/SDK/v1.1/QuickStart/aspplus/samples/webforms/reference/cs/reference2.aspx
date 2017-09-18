<html>

   <script language="C#" runat=server>

       int subtract(int num1, int num2) {
          return num1-num2;
       }

   </script>

   <body>
     
      <% 
         int number = 100;

         while (number > 0) {
            Response.Write("Value: " + number + "<br>");
            number = subtract(number, 1);
         }
      %>

   </body>

</html>