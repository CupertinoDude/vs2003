<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Reflection" %>

<script language="VB" runat=server>

Sub Page_Load(Source As Object, E As EventArgs) 

	output.Text = "<pre>" & GetTypes.Go() & "</pre>"
End Sub

class GetTypes 

   	public shared Function Go() As String
	
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine(chr(13))

		' Get the mscorlib assembly, it's the one Object is defined in
		Dim a As reflection.Assembly = GetType(Object).Module.Assembly
		
		' Get all the types in this assembly
		Dim types() As Type = a.GetTypes ()
		
		' let's take a look at them, and gather a little bit of data as we do it.
		Dim numValueTypes As Integer = 0
		Dim numInterfaces As Integer = 0
		Dim numClasses As Integer = 0
		Dim numArrays As Integer = 0

		Console.WriteLine ("Get all the types from the assembly: '{0}''", a.GetName())
		Console.WriteLine("Only the Interface Types will be listed.'")
		Console.WriteLine ("----------------------------------'")

		Dim t As Type

		For Each t in types
		
			If (t.IsClass) Then numClasses = numClasses + 1
			If (t.IsValueType) Then numValueTypes = numValueTypes + 1
			If (t.IsArray) Then numArrays = numArrays + 1

			If (t.IsInterface) 
				Console.WriteLine (t.Name + "'") ' only print out the names of the Interfaces
				numInterfaces = numInterfaces + 1
			End If
		Next t

		' write out the totals
		Console.WriteLine("-----------------------------------'")
		Console.WriteLine("Out of {0} types in the {1} library:'", types.Length, GetType(Object).Module.ToString())
		Console.WriteLine ("{0} are interfaces (listed)'", numInterfaces)
		Console.WriteLine ("{0} are value types'", numValueTypes)
		Console.WriteLine ("{0} are Classes'", numClasses)
		Console.WriteLine ("{0} are Arrays'", numArrays)

		Console.WriteLine("-----------------------------------'")
		Console.WriteLine()
		
		Try
			' Load THIS assembly using its file name
			Dim b As reflection.Assembly = reflection.Assembly.GetExecutingAssembly()

			Console.WriteLine ("Get all the types from the assembly: '{0}'", b.GetName())
			Console.WriteLine("-----------------------------------")

			' Get the types of this assembly
			Dim types2() As Type = b.GetTypes ()

			For Each t in types2
		
				Console.WriteLine(t.FullName) ' not many types, so we can print them all
			Next t

		Catch e As Exception
			' just in case the file cannot be found at the specified directory
			Console.WriteLine("Could not find the reference to the file which holds the assembly information")
			Console.WriteLine("for this application.")
			Console.WriteLine("Please alter the source file for this page to look in a different directory")
		End Try
		
		Console.WriteLine("-----------------------------------")

		return strWriter.ToString()
	End Function
	
End Class

' some other arbitrary classes, so that the assembly this module is a part of will have some types
public class TestClass1

End Class

public class TestClass2

End Class

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