<html>

    <script language="VB" runat="server">

        Sub Page_Load(Sender As Object, E As EventArgs)

           Dim RandomGenerator As Random
           RandomGenerator = New Random(DateTime.Now.Millisecond)

           Dim RandomNum As Integer
           RandomNum = RandomGenerator.Next(0, 3)

           Select RandomNum

              Case 0:
                Name.Text = "Scott"

              Case 1:
                Name.Text = "Fred"

              Case 2:
                Name.Text = "Adam"

           End Select

           AnchorLink.NavigateUrl = "controls_navigationtarget.aspx?name=" & System.Web.HttpUtility.UrlEncode(Name.Text)
        End Sub

    </script>

    <body>

       <h3><font face="Verdana">Performing Page Navigation (Scenario 1)</font></h3>

       <p>

       This sample demonstrates how to generate a HTML Anchor tag that will cause the client to
       navigate to a new page when he/she clicks it within the browser.

       <p>

       <hr>

       <p>

       <asp:hyperlink id="AnchorLink" font-size=24 runat=server>
          Hi <asp:label id="Name" runat=server/> please click this link!
       </asp:hyperlink>

    </body>

</html>
