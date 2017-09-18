<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + Anagrams.Go(Server.MapPath("..\\words.txt")) + "</pre>";
}

class Anagrams
{

    public static string Go(String textFile)
    {
	//declare the StreamReader, for accessing the file
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);
        try {
            using(StreamReader din = File.OpenText(textFile)) {
                String str;
                ArrayList al = new ArrayList();

                Console.WriteLine("Reading data and inserting into an ArrayList...");
                Console.WriteLine();

                while ((str=din.ReadLine()) != null) {
                    al.Add(str);
                }

                Console.WriteLine("Printing out the ArrayList.");
                Console.WriteLine("---------------------------");

                foreach (string s in al) {
                    Console.WriteLine (s);
                }
            }
        }
	catch (Exception) {
	    Console.WriteLine("There was an error reading the file words.txt. Please ensure it is in the right directory");
	}

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
    <tr align="left"><th><span>The following example opens a text file for reading, and copies the information in the text file to an ArrayList.
		The ArrayList is then printed to the screen.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>