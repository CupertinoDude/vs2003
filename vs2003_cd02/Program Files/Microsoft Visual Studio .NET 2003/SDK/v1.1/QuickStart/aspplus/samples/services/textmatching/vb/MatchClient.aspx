<%@ Import Namespace="MatchServiceVB" %>

<html>

<script language="VB" runat="server">

    Sub GetQuote(Src As Object, E As EventArgs)
        Try
            Dim matcher As New TestIt()
            Dim matches As TestHeadersMatches
            matches = matcher.TestHeaders()
            Title.InnerHtml = matches.Title
            H1.InnerHtml = matches.H1
            StockDetails.Visible = true
        Catch Exc As Exception
            Message.InnerHtml = "A network error occured or the service was unable to locate the symbol, please try again."
        End Try
    End Sub

</script>

<body bgcolor="ffffee" style="font: 10pt verdana">

  <h4>Using Html Text Pattern Matching Sample</h4>

  <form runat="server">
    <table style="font: 10pt verdana" width="300">
      <tr>
        <td></td>
        <td><input type="submit" OnServerClick="GetQuote" runat="server"/></td>
      </tr>
    </table>
    <p>
    <hr>
    <p>
    <table id="StockDetails" visible="false" runat="server" style="font: 8pt verdana" border=1>
      <tr>
        <td><b>Company Name</b></td>
        <td><span id="Title" runat="server"/></td>
      </tr>
      <tr>
        <td><b>H1 Text</b></td>
        <td><span id="H1" runat="server"/></td>
      </tr>
    </table>
    <p>
    <span id="Message" EnableViewState="false" runat="server"/>
    <p>
  </form>

</body>
</html>

