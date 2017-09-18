<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>

void Page_load(Object src, EventArgs e) {

	CloneTest.MakeList();

	lblClone.Text = "<pre>" + CloneTest.DoClone() + "</pre>";

	lblCopy.Text = "<pre>" + CloneTest.DoCopy() + "</pre>";
}

class CloneTest {

	static ArrayList al = new ArrayList();

	public static void MakeList() {
		al.Add(new Employee (7182, "Mary Greerson"));
		al.Add(new Employee (2183, "Abdul Hania"));
		al.Add(new Employee (7162, "Brenda Simons"));
		al.Add("String Entry 1");
		al.Add("String Entry 2");
	}

	public static String DoCopy() {
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("Performing a COPY of the array.");
		Console.WriteLine("Modifications in the copy will not affect the original.");
		Console.WriteLine("--------------------------------------------------------");

		Console.WriteLine("The entries in the original ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in al)
			Console.WriteLine(o.ToString());
		
		Console.WriteLine();

		ArrayList nl = new ArrayList();

		for (int i=0;i < al.Count;i++) {
			if ((al[i]).GetType() == typeof(Employee))
				nl.Add(new Employee(((Employee)al[i]).ID, ((Employee)al[i]).Name));
			else
				nl.Add(al[i]);

		}

		Console.WriteLine("The entries in the copied ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in nl)
			Console.WriteLine(o.ToString());

		Console.WriteLine();

		((Employee)nl[0]).Name = "Mary van der Beer";
		((Employee)nl[1]).Name = "Alexei Vyernov";
		((Employee)nl[2]).Name = "Chris Hayfield";
		((Employee)nl[1]).ID = 2637;
		((Employee)nl[2]).ID = 4921;
		nl[3] = "Repeated Modify of String Entry 1";
		nl[4] = "Repeated Modify of String Entry 2";

		Console.WriteLine("The entries in the modified, copied ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in nl)
			Console.WriteLine(o.ToString());

		Console.WriteLine();

		Console.WriteLine("The entries in the original ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in al)
			Console.WriteLine(o.ToString());

		return strWriter.ToString();
	}

	public static String DoClone() {
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("Performing a CLONE of the ArrayList.");
		Console.WriteLine("Modifications in the copy will also affect the original.");
		Console.WriteLine("--------------------------------------------------------");

		Console.WriteLine("The entries in the original ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in al)
			Console.WriteLine(o.ToString());

		ArrayList nl = (ArrayList)al.Clone();
		Console.WriteLine();

		Console.WriteLine("The entries in the copied ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in nl)
			Console.WriteLine(o.ToString());

		Console.WriteLine();

		((Employee)nl[0]).Name = "Mary Smith";
		((Employee)nl[1]).Name = "Francoi Michaels";
		((Employee)nl[2]).Name = "Francesca Davies";
		((Employee)nl[1]).ID = 1827;
		((Employee)nl[2]).ID = 9912;
		nl[3] = "Modified String Entry 1";
		nl[4] = "Modified String Entry 2";

		Console.WriteLine("The entries in the modified, copied ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in nl)
			Console.WriteLine(o.ToString());

		Console.WriteLine();

		Console.WriteLine("The entries in the original ArrayList");
		Console.WriteLine("---------------------------------------------");
		foreach(Object o in al)
			Console.WriteLine(o.ToString());

		return strWriter.ToString();
	}
}

class Employee {

	String _name;
	int _id;

	public Employee( int id, String name ) {
		this._name = name;
		this._id = id;

	}

	public String Name {
		get { return  _name; }
		set { _name = value; }
	}

	public int ID {
		get { return  _id; }
		set { _id = value; }
	}

	override public string ToString ()
	{
		return _id + ", " + _name;
	}
}
</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form runat="server">
    <p>

<table>
    <tr><td><b>The following example demonstrates cloning collections</b>. In this example, the first three entries in the collection are object references to Employee objects, while the third and fourth entries are literal strings. If you follow through the example, you can see that the cloned ArrayList refers to the same objects as the original ArrayList, but the Strings are unique to each list since they are not reference-copies but are instead, value copies. In contrast, when we copy the ArrayList, both of the ArrayLists are completely unique such that modifications made to one will not affect the other.
		<hr>
    </td></tr>
</table>

<table border=1>
    <tr><td><h4><asp:label id="lblClone" runat="server"/></h4></td>
	<td><h4><asp:label id="lblCopy" runat="server"/></h4></td>
    </tr>
</table>


</form>
</body>
</html>
