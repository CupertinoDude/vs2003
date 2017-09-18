<%@ Import Namespace="MathServiceVB" %>

<html>

<script language="VB" runat="server">

  Dim Op1 As Single = 0
  Dim Op2 As Single = 0

  Public Sub Submit_Click(Sender As Object, E As EventArgs)

      Try

        Op1 = Single.Parse(Operand1.Text)
        Op2 = Single.Parse(Operand2.Text)

      Catch Exp As Exception
          ' Ignored
      End Try

      Dim Service As MathServiceVB.MathService = New MathServiceVB.MathService()

      Select (CType(sender,Control).ID)

        Case "Add" :
            Result.Text = "<b>Result</b> = " & Service.Add(Op1, Op2).ToString()
        Case "Subtract" :
            Result.Text = "<b>Result</b> = " & Service.Subtract(Op1, Op2).ToString()
        Case "Multiply" :
            Result.Text = "<b>Result</b> = " & Service.Multiply(Op1, Op2).ToString()
        Case "Divide" :
            Result.Text = "<b>Result</b> = " & Service.Divide(Op1, Op2).ToString()
      End Select
  End Sub

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


