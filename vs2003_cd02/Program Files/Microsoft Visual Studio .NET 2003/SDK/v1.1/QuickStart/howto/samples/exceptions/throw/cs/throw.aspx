<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = ExceptionTest.Go();
}

class ExceptionTest
{    
    public static string Go()
    {
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

	// This code shows how to catch an exception
	Decimal [] d = {1.02m, 2.34m, 2.99m, 3.76m, 4.99m, 5.99m};

	// loop through the array, attempting each
	for (int i=0; i < d.Length; i++ )
	{

	    try 
	    {
	        Console.WriteLine();
	        Console.WriteLine("{0}. Trying to call the method with an argument of '{1}'...<br>", i + 1, d[i].ToString());
	        ResetBurgerPrice(d[i]);

		// if you get to this line, then everything worked for that value!
		Console.WriteLine("The value {0} was successfully assigned as the new burger price.<p>", d[i].ToString());
	        Console.WriteLine();
	    }
	    catch (ArgumentOutOfRangeException aoe) // catch the out of range exceptions...
	    {
	        Console.WriteLine("The following Out Of Range Exception occurred:<br>");
	        Console.WriteLine(aoe.Message + "<p>");
	    }
	    catch (MyMadeUpException mue) // catch the made up exception. Unnecessary to do this seperately, but a good demonstration
	    {
	        Console.WriteLine("The following Made Up Exception occurred:<br>");
	        Console.WriteLine(mue.Message + "<p>");
	    }
	    finally 
	    {
	        Console.WriteLine();
	        Console.WriteLine("Move to the Next Value...<p>");
	    }
	}

        Console.WriteLine("Finished processing the Decimal Array.");

	return strWriter.ToString();
    }

    public static void ResetBurgerPrice(decimal d)
    {
	// it should be noted that these exceptions do not utilize the runtime's resource
	// system which would make the text of the exception easily localizable.
	// For examples of using resources, see the Resources section of Quickstart.

	if (d < 2) 
	{
		// let anyone using this method know that charging too little for a burger is no good...
		// the type of the exception thrown is an out of range exception
		throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging less than $2.00 will mean we lose money!");
	}
	else if (d > 5)
	{
		// let anyone using this method know that charging too much for a burger is no good either!
		// the type of the exception thrown is an out of range exception
		throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging more than $5.00 will scare people away!");
	}
	else if ( d.Equals(2.99m) )
	{
		// let anyone using this method know that we don't like 2.99!
		// the type of the exception thrown is a 'my made up' exception
		throw new MyMadeUpException("Disallowed: If you're going to make it $2.99, make it $3.00!");
	}
	    else
	    {
		// reset the internal burger price to that specified. e.g.
		// _BurgerPrice = d;
		// update a database if necessary, etc.
		// ...
	}
    }

    public class MyMadeUpException:Exception
    {
	public MyMadeUpException ()
		:base() {} // pass control to the parent constructor of the same signature

	public MyMadeUpException (string message)
		:base(message) {} // pass control to the parent constructor of the same signature

	public MyMadeUpException (string message, Exception inner)
		:base(message, inner) {} // pass control to the parent constructor of the same signature
    }

} // end class ExceptionTest

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><th><span>The following example demonstrates throwing an exception, and how to catch that exception, from within a method. It also briefly demonstrates making your own exceptions.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>