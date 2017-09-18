<html>

   <script language="VB" runat=server>

      Sub Page_Load(Sender As Object, E As EventArgs)

         Dim Items As New ArrayList

         Items.Add("One")
         Items.Add("Two")
         Items.Add("Three")

         MyList.DataSource = Items
         MyList.DataBind()
      End Sub

   </script>

   <body>

      <asp:datalist id="MyList" runat=server>

         <ItemTemplate>

            Here is a value: <%# Container.DataItem %>

         </ItemTemplate>

      </asp:datalist>

   </body>

</html>