<%@ Page language="c#" Codebehind="DataTypesClient.aspx.cs" AutoEventWireup="false" Inherits="DataTypes.Cs.DataTypesClient" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
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
</head>
  <body>
	
	<form method="post" runat="server">
	
	<H4>Using DataTypes with XML Web services</H4>

	<h5>Methods that return a Primitive (String): </h5>
	<div id="Message1" runat="server"></div>

	<h5>Methods that return an Array of Primitives (Integers): </h5>
	<div id="Message2" runat="server"></div>

	<h5>Method that returns an Enum: </h5>
	<div id="Message3" runat="server"></div>

	<h5>Method that returns a Class/Struct: </h5>
	<div id="Message4" runat="server"></div>

	<h5>Method that returns an array of Classes/Structs: </h5>
	<div id="Message5" runat="server"></div>

     </form>
	
  </body>
 </html>
