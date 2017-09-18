<%@ Register TagPrefix="CustomParsingControlSamples" Namespace="CustomParsingControlSamples" Assembly="CustomParsingControlSamples" %>

<html>

   <body>

      <form method="POST" runat=server>

          <CustomParsingControlSamples:CustomParse2 SelectedIndex="2" runat=server>

             <customitem Message="One"/>
             <customitem Message="Two"/>
             <customitem Message="Three"/>
             <customitem Message="Four"/>

          </CustomParsingControlSamples:CustomParse2>

      </form>

   </body>

</html>