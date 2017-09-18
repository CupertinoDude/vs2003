<html>
<head>

    <script language="VB" runat="server">

       Sub SubmitBtn_Click(sender As Object, e As EventArgs) 
          Image1.Src="/quickstart/aspplus/images/" & Select1.Value
       End Sub

    </script>

</head>

<body>

    <h3><font face="Verdana">Simple HtmlImage Sample</font></h3>

    <form runat=server>

        <img ID="Image1" src="/quickstart/aspplus/images/cereal1.gif" runat="server"/>

        <p>

        Select image file:

        <select id="Select1" runat="server">
            <option Value="Cereal1.gif">Healthy Grains</option>
            <option Value="Cereal2.gif">Corn Flake Cereal</option>
            <option Value="Cereal3.gif">U.F.O.S</option>
            <option Value="Cereal4.gif">Oatey O's</option>
            <option Value="Cereal5.gif">Strike</option>
            <option Value="Cereal7.gif">Fruity Pops</option>
        </select>

        <input type="submit" runat="server" Value="Apply" OnServerClick="SubmitBtn_Click">

    </form>

</body>

</html>


