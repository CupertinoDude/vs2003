<html>

   <script language="JScript" runat=server>

       function subtract(num1:int, num2:int) : int {
          return num1-num2;
       }

   </script>

   <body>
     
      <% 
         var number:int = 100;

         while (number > 0) {
            Response.Write("Value: " + number + "<br>");
            number = subtract(number, 1);
         }
      %>

   </body>

</html>