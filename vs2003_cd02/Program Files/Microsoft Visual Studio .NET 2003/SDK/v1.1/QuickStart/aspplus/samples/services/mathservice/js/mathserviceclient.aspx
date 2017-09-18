<%@ Import Namespace="MathServiceJS" %>

<html>

<script language="JScript" runat="server">

  var operand1:float = 0;
  var operand2:float = 0;

  public function Submit_Click(sender:Object, E:EventArgs) : void
  {
      try {
        operand1 = float(Operand1.Text);
        operand2 = float(Operand2.Text);
      }
      catch (Exception) { /* ignored */ }

      var service:MathService = new MathService();


        switch ((Control(sender)).ID)
        {
          case "Add"      : Result.Text = "<b>Result</b> = " + service.Add(operand1, operand2).ToString(); break;
          case "Subtract" : Result.Text = "<b>Result</b> = " + service.Subtract(operand1, operand2).ToString(); break;
          case "Multiply" : Result.Text = "<b>Result</b> = " + service.Multiply(operand1, operand2).ToString(); break;
          case "Divide"   : Result.Text = "<b>Result</b> = " + service.Divide(operand1, operand2).ToString(); break;
        }
  }


</script>

<body style="font: 10pt verdana">

  <h4>Using a Simple Math Service </h4>

  <form runat="server">

  <div style="padding:15,15,15,15;background-color:beige;width:300;border-color:black;border-width:1;border-style:solid">

    Operand 1: <br><asp:TextBox id="Operand1" Text="15" runat="server"/><br>
    Operand 2: <br><asp:TextBox id="Operand2" Text="5" runat="server"/><p>

    <input type="submit" id="Add" value="Add" OnServerClick="Submit_Click" runat="server">
    <input type="submit" id="Subtract" value="Subtract" OnServerClick="Submit_Click" runat="server">
    <input type="submit" id="Multiply" value="Multiply" OnServerClick="Submit_Click" runat="server">
    <input type="submit" id="Divide" value="Divide" OnServerClick="Submit_Click" runat="server">

    <p>

    <asp:Label id="Result" runat="server"/>

  </div>

  </form>

</body>
</html>


