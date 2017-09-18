<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat=server>

Sub Page_Load(source As Object, E As EventArgs)

	output.Text = "<pre>" & Anagrams.Go(Server.MapPath("..\words.txt")) & "</pre>"
End Sub

class Anagrams


    public shared Function Go(TextFile As String) As String

	' declare the StreamReader, for accessing the file
	Dim strWriter As StringWriter = New StringWriter()
	Console.SetOut(strWriter)

	Try
        Dim din As StreamReader= File.OpenText(TextFile)
   	    Dim str As String
	    Dim al As ArrayList = New ArrayList()

            Console.WriteLine("Reading data and inserting into an ArrayList...")
	    Console.WriteLine()

	    Do
		str = din.ReadLine()

		If str <> Nothing Then
			al.Add(str)
		End If
	    Loop Until str = Nothing


	    Console.WriteLine("Printing out the ArrayList.")
	    Console.WriteLine("---------------------------")

	    Dim s As String

	    For Each s in al
                Console.WriteLine (s)
	    Next s

	catch E As Exception
	    Console.WriteLine("There was an error reading the file words.txt. Please ensure it is in the right directory")
	End Try

	return strWriter.ToString()
    End Function
End Class

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align="left"><th><span>The following example opens a text file for reading, and copies the information in the text file to an ArrayList.
		The ArrayList is then printed to the screen.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>