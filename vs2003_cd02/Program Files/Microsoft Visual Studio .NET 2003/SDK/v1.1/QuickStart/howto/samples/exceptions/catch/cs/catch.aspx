<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {
	output.Text = "<pre>" + ExceptionTest.Go() + "</pre>";
}

public class ExceptionTest {

	public static String Go() {

		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		//This code shows how to catch an exception
		try { 
        
			Console.WriteLine("We're going to divide 10 by 0 and see what happens...");
			Console.WriteLine("Note that results are floored to the nearest integer.");
			Console.WriteLine();
			
			int k;
	    
			for (int i=10;i>=0;i--) { //can change the end statement to > 0, to see
						  //what happens when there is no exception
	    
				Console.Write("Attempting to divide 10 by {0}...", i);
				k = 10/i;

				Console.WriteLine("  Success!!! Result is {0}", k);
			}

			//note that this line does NOT get printed...
			Console.WriteLine("Completed Successfully");
		}
		catch (Exception e) {
			Console.WriteLine();
			Console.WriteLine();
			Console.WriteLine("The following exception occured:");
			Console.WriteLine("Exception  : " + e.ToString());
			Console.WriteLine("Message    : " + e.Message);
			Console.WriteLine("StackTrace : " + e.StackTrace);
		}
		finally {
			Console.WriteLine();
			Console.WriteLine("Now we can continue...");
			Console.WriteLine();
			Console.WriteLine("-------------------------------------------------");
		}       


		Console.WriteLine("Now let's handle a specific exception.");
		Console.WriteLine();
		Console.WriteLine("We are going to try to open a non-existent file...");
		Console.WriteLine("Trying to open file 'FileDoesn'tExist.File'...");
		Console.WriteLine();

		try {
			//will throw an exception if something goes wrong...
			FileStream fs = File.Open("FileDoesn'tExist.File", FileMode.Open);
		
		}
		catch (FileNotFoundException fe) {

			//give information specific to this exception...
			Console.WriteLine("We are sorry, we could not find that file in the specified directory.");
		}
		catch (Exception E) { //all OTHER scenarios...
			Console.WriteLine(E.ToString());

		}

		Console.WriteLine();
		Console.WriteLine("-------------------------------------------------");
		Console.WriteLine("Finished!");

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
    <tr align=left><td><b>The following example demonstrates using try...catch blocks</b>. To show that the exception does not occur until a specified loop, we try acceptable actions first. Note that in this segment, the 'finally' block is always performed. We also print out information for this particular exception, including the Message (if you don't want the whole exception information) and the StackTrace (if you just want to know where the exception occurred).
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>