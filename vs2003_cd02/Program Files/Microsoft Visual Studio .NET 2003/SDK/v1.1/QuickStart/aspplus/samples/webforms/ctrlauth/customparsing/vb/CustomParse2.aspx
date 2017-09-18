<%@ Register TagPrefix="CustomParsingControlSamples" Namespace="CustomParsingControlSamples" Assembly="CustomParsingControlSamplesVB" %>

<html>

   <body>

      <form method="POST" runat=server>

          <CustomParsingControlSamples:CustomParse2VB SelectedIndex="2" runat=server>

             <customitem Message="One"/>
             <customitem Message="Two"/>
             <customitem Message="Three"/>
             <customitem Message="Four"/>

          </CustomParsingControlSamples:CustomParse2VB>

      </form>

   </body>

</html>