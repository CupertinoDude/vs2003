<%@ Register TagPrefix="TemplateControlSamples" Namespace="TemplateControlSamplesVB" Assembly="TemplateControlSamplesVB" %>
	<script runat=server language=VB>
	Sub Page_Load()
	    DataBind()
	End Sub
	</script>

<html>

   <body>

      <form method="POST" runat="server">

          Non Templated version:

          <TemplateControlSamples:Template1VB Message="Hello World!" runat=server/>

          <hr>

          Templated version:

          <TemplateControlSamples:Template1VB Message="Hello World!" runat=server>

              <MessageTemplate>

                <b><i><u>
                    <%# Container.Message%>
                </u></i></b>

              </MessageTemplate>

          </TemplateControlSamples:Template1VB>

      </form>

   </body>

</html>