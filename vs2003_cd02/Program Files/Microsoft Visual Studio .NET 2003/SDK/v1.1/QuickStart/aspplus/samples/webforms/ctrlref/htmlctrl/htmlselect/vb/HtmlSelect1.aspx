<html>
<head>

    <script language="VB" runat="server">

       Sub Apply_Click(sender As Object, e As EventArgs) 
          Span1.Style("background-color") = ColorSelect.Value
       End Sub

        Sub AddToList_Click(sender As Object, e As EventArgs) 
          ColorSelect.Items.Add(Text1.Value)
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Simple HtmlSelect Sample</font></h3>

    <form runat=server>

        Select a color:<br>

        <select id="ColorSelect" runat="server">
            <option>SkyBlue</option>
            <option>LightGreen</option>
            <option>Gainsboro</option>
            <option>LemonChiffon</option>
        </select>

        <input type="button" runat="server" Value="Apply" OnServerClick="Apply_Click">

        <p>

        Don't see your color in the list above?  You can add it here:<br>

        <input type="text" id="Text1" runat="server">
        <input type="button" runat="server" Value="Add to List" OnServerClick="AddToList_Click">

        <p>

        <span id="Span1" runat="server">Click the button to apply a background color to this span.</span>

    </form>

</body>
</html>

