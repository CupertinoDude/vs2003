<html>

   <object id="items" class="System.Collections.ArrayList" runat=server/>

   <script language="C#" runat=server>

      void Page_Load(Object sender, EventArgs e) {

         items.Add("One");
         items.Add("Two");
         items.Add("Three");

         MyList.DataSource = items;
         MyList.DataBind();
      }

   </script>

   <body>

      <asp:datalist id="MyList" runat=server>

         <ItemTemplate>

            Here is a value: <%# Container.DataItem %>

         </ItemTemplate>

      </asp:datalist>

   </body>

</html>