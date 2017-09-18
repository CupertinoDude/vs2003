<%@ Register TagPrefix="TemplateControlSamples" Namespace="TemplateControlSamples" Assembly="TemplateControlSamples" %>
	<script runat=server language=c#>
	void Page_Load() {
	    DataBind();
	}
	</script>

<html>

   <body>

      <form method="POST" runat="server">

          Non Templated version:

          <TemplateControlSamples:Template1 Message="Hello World!" runat=server/>

          <hr>

          Templated version:

          <TemplateControlSamples:Template1 Message="Hello World!" runat=server>

              <MessageTemplate>

                <b><i><u>
                    <%# Container.Message %>
                </u></i></b>

              </MessageTemplate>

          </TemplateControlSamples:Template1>

      </form>

   </body>

</html>