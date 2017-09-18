<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + MathExample.Go() + "</pre>";
}

class MathExample
{    
	public static string Go()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		int i = -10;

		double d1 = 39.25;
		double d2 = -27.84;

		Console.WriteLine();
		Console.WriteLine("Constants");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("The constant value e is {0}", Math.E);
		Console.WriteLine("The constant value PI is {0}", Math.PI);
		Console.WriteLine();

		Console.WriteLine("Using the Abs Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("The absolute value of {0} is {1}", i, Math.Abs(i));
		Console.WriteLine("The absolute value of {0} is {1}", d1, Math.Abs(d1));
		Console.WriteLine("The absolute value of {0} is {1}", d2, Math.Abs(d2));
		Console.WriteLine();

		Console.WriteLine("Using the Floor Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("Using the Floor method to round down {0} you get {1}", i, Math.Floor(i));
		Console.WriteLine("Using the Floor method to round down {0} you get {1}", d1, Math.Floor(d1));
		Console.WriteLine("Using the Floor method to round down {0} you get {1}", d2, Math.Floor(d2));
		Console.WriteLine();

		Console.WriteLine("Using the Ceiling Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("Using the Ceiling method to round down {0} you get {1}", i,  Math.Ceiling(i));  
		Console.WriteLine("Using the Ceiling method to round down {0} you get {1}", d1, Math.Ceiling(d1)); 
		Console.WriteLine("Using the Ceiling method to round down {0} you get {1}", d2, Math.Ceiling(d2)); 
		Console.WriteLine();

		Console.WriteLine("Using the Max Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("The maximum value of {0} and {1} is {2}", i, d1, Math.Max(i, d1));
		Console.WriteLine("The maximum value of {0} and {1} is {2}", d2, i, Math.Max(d2, i));
		Console.WriteLine("The maximum value of {0} and {1} is {2}", d1, d2, Math.Max(d1, d2));
		Console.WriteLine();

		Console.WriteLine("Using the Sqrt Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("The square root of {0} is {1}", d1, Math.Sqrt(d1));
		Console.WriteLine("The square root of {0} is {1}", i, Math.Sqrt(i));
		Console.WriteLine();

		Console.WriteLine("Using the Pow Method");
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("{0} raised to the power 2 is {1}", i, Math.Pow(i, 2));
		Console.WriteLine("{0} raised to the power 0.3 is {1}", d1,  Math.Pow(d1, 0.3));
		Console.WriteLine("{0} raised to the power -4 is {1}", d2,  Math.Pow(d2, -4));
		Console.WriteLine();

		return strWriter.ToString();
	}
}

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td><b>The following example illustrates using methods inside the Math class</b>. To learn more about these, and other methods in the math class, please see the SDK documentation. The methods are intuitive and easy to use, and provide you with many basic mathematical functions.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>