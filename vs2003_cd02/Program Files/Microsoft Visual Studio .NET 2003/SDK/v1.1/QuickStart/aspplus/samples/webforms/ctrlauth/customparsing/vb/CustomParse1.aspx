<%@ Register TagPrefix="CustomParsingControlSamples" Namespace="CustomParsingControlSamples" Assembly="CustomParsingControlSamplesVB" %>

<html>

   <body>

      <form method="POST" runat=server>

          <CustomParsingControlSamples:CustomParse1VB SelectedIndex="2" runat=server>

             <CustomParsingControlSamples:ItemVB Message="One" runat=server/>
             <CustomParsingControlSamples:ItemVB Message="Two" runat=server/>
             <CustomParsingControlSamples:ItemVB Message="Three" runat=server/>
             <CustomParsingControlSamples:ItemVB Message="Four" runat=server/>

          </CustomParsingControlSamples:CustomParse1VB>

      </form>

   </body>

</html>