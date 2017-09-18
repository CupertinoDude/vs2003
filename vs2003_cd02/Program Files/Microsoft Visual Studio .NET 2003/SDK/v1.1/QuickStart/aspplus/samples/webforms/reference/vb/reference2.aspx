<html>

   <script language="VB" runat=server>

       Function Subtract(Num1 As Integer, Num2 As Integer) As Integer
          Return Num1-Num2
       End Function

   </script>

   <body>
     
      <% 
         Dim Number As Integer = 100

         Do While Number > 0
            Response.Write("Value: " & Number & "<br>")
            Number = Subtract(Number, 1)
         Loop
      %>

   </body>

</html>