<%@ Import Namespace="HelloWorldJS" %>

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

<script language="JScript" runat="server">

  function Page_Load(sender:Object, e:EventArgs) : void {
    var comp:HelloObj = new HelloObj();

    Message.InnerHtml += comp.SayHello() + "<p>";

    comp.FirstName = "Microsoft .NET Framework";
    Message.InnerHtml += comp.SayHello() + "<p>";

    comp.FirstName = "ASP.NET";
    Message.InnerHtml += comp.SayHello() + "<p>";

    comp.FirstName = "World!!!";
    Message.InnerHtml += comp.SayHello();
  }

</script>

<body style="font: 10pt verdana">

  <h3>A Simple Managed Component</h3>

  <h5>Object Output: </h5>

  <div id="Message" runat="server"/>

</body>
</html>