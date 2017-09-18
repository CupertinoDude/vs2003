<%@ Import Namespace="HelloWorld" %>

<html>

<style>

  div 
  { 
    font: 8pt verdana;
    background-color:cccccc;
    border-color:black;
    border-width:1;
    border-style:solid;
    padding:10,10,10,10; 
  }

</style>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    Dim Comp As HelloObjVB
    Comp = New HelloObjVB()

    Message.InnerHtml &= Comp.SayHello() + "<p>"

    Comp.FirstName = "Microsoft .NET Framework"
    Message.InnerHtml &= Comp.SayHello() + "<p>"

    Comp.FirstName = "ASP.NET"
    Message.InnerHtml &= Comp.SayHello() + "<p>"

    Comp.FirstName = "World!!!"
    Message.InnerHtml &= Comp.SayHello()
  End Sub

</script>

<body style="font: 10pt verdana">

  <h3>A Simple Managed Component</h3>

  <h5>Object Output: </h5>

  <div id="Message" runat="server"/>

</body>
</html>