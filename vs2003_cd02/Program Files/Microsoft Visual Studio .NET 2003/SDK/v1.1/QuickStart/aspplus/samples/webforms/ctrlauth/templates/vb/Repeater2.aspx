<%@ Register TagPrefix="TemplateControlSamples" Namespace="TemplateControlSamplesVB" Assembly="TemplateControlSamplesVB" %>

<html>

   <script language="VB" runat=server>

      Public Sub Page_Load(Sender As Object, E As EventArgs)

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
         Dim X As Long

         For X = 0 To MyList.Items.Count - 1

            Dim MyValue As System.Web.UI.WebControls.TextBox = _
                MyList.Items(X).FindControl("MyValue")
            MyValue.Text = (Int32.Parse(MyValue.Text) + 1).ToString()
         Next
      End Sub

   </script>

   <body>

      <form method="POST" action="Repeater2.aspx" runat=server>

          <TemplateControlSamples:Repeater2VB id="MyList" runat=server>

              <ItemTemplate>

                 Value: <asp:textbox id="MyValue" Text="<%#Container.DataItem%>" runat=server/>

                 <hr align=left width=200>

              </ItemTemplate>

          </TemplateControlSamples:Repeater2VB>

          <asp:button Text="Update" OnClick="Btn1_Click" runat=server/>

      </form>

   </body>

</html>