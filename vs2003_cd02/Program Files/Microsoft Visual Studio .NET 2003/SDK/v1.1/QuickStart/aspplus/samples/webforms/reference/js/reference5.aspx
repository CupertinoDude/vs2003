<html>

   <script language="JScript" runat=server>

      function Page_Load(sender:Object, e:EventArgs) : void {

         var items:ArrayList = new ArrayList();

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