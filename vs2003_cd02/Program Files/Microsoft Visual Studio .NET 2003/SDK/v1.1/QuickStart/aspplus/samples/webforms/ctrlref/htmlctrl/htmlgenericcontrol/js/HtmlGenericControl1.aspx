<html>
<head>

    <script language="JScript" runat="server">

       function SubmitBtn_Click(Source:Object, e:EventArgs) : void {

          Body.Attributes["bgcolor"] = ColorSelect.Value;
       }

    </script>

</head>

<body id=Body runat=server>

    <h3><font face="Verdana">HtmlGenericControl Sample</font></h3>

    <form runat=server>

      <p>
      Select a background color for the page: <p>
      <select id="ColorSelect" runat="server">
          <option>White</option>
          <option>Wheat</option>
          <option>Gainsboro</option>
          <option>LemonChiffon</option>
      </select>

      <input type="submit" runat="server" Value="Apply" OnServerClick="SubmitBtn_Click">

    </form>

</body>
</html>




