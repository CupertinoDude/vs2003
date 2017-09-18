<%@ Register TagPrefix="TemplateControlSamples" Namespace="TemplateControlSamples" Assembly="TemplateControlSamples" %>

<html>

   <script language="C#" runat=server>

      public void Page_Load(Object sender, EventArgs e) {

         if (!IsPostBack) {

            ArrayList values = new ArrayList();

            values.Add("1");
            values.Add("2");
            values.Add("3");
            values.Add("4");

            MyList.DataSource = values;
            MyList.DataBind();
         }
      }

      private void Btn1_Click(Object sender, EventArgs e) {

         for (int x=0; x<MyList.Items.Count; x++) {

            System.Web.UI.WebControls.TextBox MyValue = 
                (System.Web.UI.WebControls.TextBox) MyList.Items[x].FindControl("MyValue");
            MyValue.Text = (Int32.Parse(MyValue.Text) + 1).ToString();
         }
      }

   </script>

   <body>

      <form method="POST" action="Repeater2.aspx" runat=server>

          <TemplateControlSamples:Repeater2 id="MyList" runat=server>

              <ItemTemplate>

                 Value: <asp:textbox id="MyValue" Text="<%#Container.DataItem%>" runat=server/>

                 <hr align=left width=200>

              </ItemTemplate>

          </TemplateControlSamples:Repeater2>

          <asp:button Text="Update" OnClick="Btn1_Click" runat=server/>

      </form>

   </body>

</html>