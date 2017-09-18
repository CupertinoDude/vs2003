<%@ Register TagPrefix="TemplateControlSamples" Namespace="TemplateControlSamplesVB" Assembly="TemplateControlSamplesVB" %>

<html>

   <script language="VB" runat=server>

      Sub Page_Load(Sender As Object, E As EventArgs)

         If Not (IsPostBack)

            Dim Values As New ArrayList

            Values.Add("1")
            Values.Add("2")
            Values.Add("3")
            Values.Add("4")

            MyList.DataSource = Values
            MyList.DataBind()
         End If
      End Sub

      Private Sub Btn1_Click(Sender As Object, E As EventArgs)

         ' Do nothing for now. Just demonstrate that values
         ' where preserved....
      End Sub

   </script>

   <body>

      <form method="POST" action="Repeater1.aspx" runat=server>

          <TemplateControlSamples:Repeater1VB id="MyList" runat=server>

              <ItemTemplate>

                 Value: <asp:textbox id="MyValue" Text="<%#Container.DataItem%>" runat=server/>

                 <hr align=left width=200>

              </ItemTemplate>

          </TemplateControlSamples:Repeater1VB>

          <asp:button Text="Update" OnClick="Btn1_Click" runat=server/>

      </form>

   </body>

</html>