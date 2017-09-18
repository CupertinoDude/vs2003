<%@ Page Language="JScript" %>
<%@ Register TagPrefix="CustomParsingControlSamples" Namespace="CustomParsingControlSamplesJS" Assembly="CustomParsingControlSamplesJS" %>

<html>

   <body>

      <form method="POST" runat=server>

          <CustomParsingControlSamples:CustomParse1 SelectedIndex="2" runat=server>

             <CustomParsingControlSamples:Item Message="One" runat=server/>
             <CustomParsingControlSamples:Item Message="Two" runat=server/>
             <CustomParsingControlSamples:Item Message="Three" runat=server/>
             <CustomParsingControlSamples:Item Message="Four" runat=server/>

          </CustomParsingControlSamples:CustomParse1>

      </form>

   </body>

</html>