<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Reflection" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + GetTypes.Go() + "</pre>";
}

class GetTypes
{
   	public static string Go()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		//Get the mscorlib assembly, it's the one Object is defined in
		Assembly a = typeof(Object).Module.Assembly;

		//Get all the types in this assembly
		Type [] types = a.GetTypes ();

		//let's take a look at them, and gather a little bit of data as we do it.
		int numValueTypes = 0;
		int numInterfaces = 0;
		int numClasses = 0;
		int numArrays = 0;

		Console.WriteLine ("Get all the types from the assembly: '{0}'", a.GetName());
		Console.WriteLine("Only the Interface Types will be listed.");
		Console.WriteLine ("----------------------------------");
		foreach (Type t in types)
		{
			if (t.IsClass) numClasses++;
			if (t.IsValueType) numValueTypes++;
			if (t.IsArray) numArrays++;

			if (t.IsInterface) {
				Console.WriteLine (t.Name + ""); //only print out the names of the Interfaces
				numInterfaces++;
			}
		}

		//write out the totals
		Console.WriteLine("-----------------------------------");
		Console.WriteLine("Out of {0} types in the {1} library:", types.Length, typeof(Object).Module.ToString());
		Console.WriteLine ("{0} are interfaces (listed)", numInterfaces);
		Console.WriteLine ("{0} are value types", numValueTypes);
		Console.WriteLine ("{0} are Classes", numClasses);
		Console.WriteLine ("{0} are Arrays", numArrays);

		Console.WriteLine("-----------------------------------");
		Console.WriteLine();

		//Load THIS assembly using its file name
		try {
			Assembly b = Assembly.GetExecutingAssembly();

			Console.WriteLine ("Get all the types from the assembly: '{0}'", b.GetName());
			Console.WriteLine("-----------------------------------");

			//Get the types of this assembly
			Type [] types2 = b.GetTypes ();
			foreach (Type t in types2)
			{
			Console.WriteLine (t.FullName + ""); //not many types, so we can print them all
			}
		}
		catch (Exception) {
			// just in case the file cannot be found at the specified directory
			Console.WriteLine("Could not find the reference to the file which holds the assembly information");
			Console.WriteLine("for this application.");
			Console.WriteLine("Please alter the source file for this page to look in a different directory");
		}

		Console.WriteLine("-----------------------------------");

		return strWriter.ToString();
	}

}

//some other arbitrary classes, so that the assembly this module is a part of will have some types
public class TestClass1
{
}

public class TestClass2
{
}

</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td><b>The following example lists the types of a given assembly</b>. We demonstrate getting types for the assembly this particular code is a member of, as well as getting information from the MSCorLib Assembly. Because MSCorLib has so many types in it, we chose only to display the interfaces in this example (this still results in a list of over 100 interfaces).
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>