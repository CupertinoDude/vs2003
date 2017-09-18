<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>

void Page_load(Object src, EventArgs e) {

	if (!Page.IsPostBack) {

		ResetList();
	}
}

void ResetList() {

	HashTableSample.table.Clear();

	HashTableSample.table.Add(5123, "Jay");
	HashTableSample.table.Add(2569, "Brad");
	HashTableSample.table.Add(1254, "Brian");
	HashTableSample.table.Add(6839, "Seth");
	HashTableSample.table.Add(3948, "Rajesh");
	HashTableSample.table.Add(1930, "Lakshan");
	HashTableSample.table.Add(9341, "Kristian");
	HashTableSample.table.Add(7921, "Stephen");
	HashTableSample.table.Add(2839, "Tom");
	HashTableSample.table.Add(1829, "Kit");

	MakeList();
}

void MakeList() {

	lstNames.Items.Clear();

	foreach (Object o in HashTableSample.table.Keys)
		lstNames.Items.Add(o.ToString() + ": " + HashTableSample.table[o]);
}

class HashTableSample
{

	//Here we'll create a hash table of employee numbers and employee names
	public static Hashtable table = new Hashtable();

	public static String FindEntry( Object inKey, Object value )
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine();

		//remember that we are looking for integers, so we need to make an integer key...
		if (inKey == null || inKey == "")
			inKey = 0; // just in case the field is empty...

		Int32 key;
		try {
		    key = Int32.Parse(inKey.ToString());
        } catch(Exception) {
		    key = 0;
        }

		//now we'll look to see if an employee is in the table
		if (value != null)
		{
			if (table.ContainsValue(value))
			{
				Console.WriteLine("Yes, Value '{0}' was found in the list!", value);
			}
			else
			{
				Console.WriteLine("Sorry, Employee '{0}' could not be found.", value);
			}
		}
		else
		{
			if (table.Contains(key))
			{
				Console.WriteLine("Yes, ID '{0}' was found in the list!", key);
			}
			else
			{
				Console.WriteLine("Sorry, Employee ID '{0}' could not be found.", key);
			}
		}

		Console.WriteLine();
		Console.WriteLine ("Now we will print out the entire list of employees.");

		Console.WriteLine ("ID\tName");
		Console.WriteLine ("----\t-----------");

		foreach (DictionaryEntry d in table)
		{
			Console.WriteLine ("{0}\t{1}", d.Key, d.Value);
		}

		return strWriter.ToString();
	}

	public static bool AddEntry(String key, String value) {

		try {
			Int32 i = Convert.ToInt32(key);

			table.Add(i, value);

			return true;
		}
		catch (Exception) {
			return false;
		}
	}
}

void btnID_Click(Object source, EventArgs e) {

	output.Text = "<PRE>" + HashTableSample.FindEntry( empID.Text, null ) + "</PRE>";
	btnClear.Visible = true;
}

void btnName_Click(Object source, EventArgs e) {

	output.Text = "<PRE>" + HashTableSample.FindEntry( 0, empName.Text ) + "</PRE>";
	btnClear.Visible = true;
}

void btnClear_Click(Object source, EventArgs e) {

	output.Text = "";
	empName.Text = "";
	empID.Text = "";
	btnClear.Visible = false;

}

void btnReset_Click(Object source, EventArgs e) {

	ResetList();
}

void btnAdd_Click(Object source, EventArgs e) {

	if (txtAddKey.Text == "" || txtAddVal.Text == "") {
		output.Text = "ADD FAILED: Please ensure you enter both a key, and value entry";
		btnClear.Visible = true;
	}
	else {
		if (HashTableSample.AddEntry(txtAddKey.Text, txtAddVal.Text)) {

			MakeList();
			btnClear_Click	(null, null);

		}
		else {
			output.Text = "ADD FAILED: Please ensure the following:<br>" +
				"1) The key is a valid integer<br>" +
				"2) The key does not already exist in the list";
			btnClear.Visible = true;
		}
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
    <tr><td><b>The following example demonstrates searching for elements in a hashtable.</b> You can search either by key, or by value, however searching by key is faster. Often, the functionality that you want to provide your users may mean you have to search by value. In addition, the ability to add elements from the hashtable is demonstrated.
		<hr>
    </td></tr>
</table>

<table width=800>
    <tr><td width=350><b>Find an existing Entry</b></td>
	<td width=150></td>
	<td width=150></td>

	<td><b>Hashtable Entries</b></td>
	<td><b>New Entry</b></td>
    </tr>

    <tr><td width=400>Enter a value (employee name) to find:</td>
	<td align=right><asp:textbox width="60px" id="empName" runat="server"/></td>
	<td width=200><asp:button width="80px" Text="Find Value" id="btnName" onclick="btnName_Click" runat="server"/>
	</td>

	<td rowspan=3><asp:ListBox id="lstNames" width="150px" rows="7" runat="server"/></asp:ListBox></td>

	<td align=right>Key:<asp:textbox width="100px" id="txtAddKey" runat="server"/></td>
    </tr>

    <tr><td>Enter a key (employee id) to find:</td>
	<td align=right><asp:textbox width="60px" id="empID" runat="server"/></td>
	<td><asp:button width="80px" Text="Find Key" id="btnID" onclick="btnID_Click" runat="server"/></td>
	<td align=right>Value:<asp:textbox width="100px" id="txtAddVal" runat="server"/></td>
    </tr>

    <tr><td></td>
	<td></td>
	<td></td>
	<td align=right>
	    <asp:button width="120px" Text="Add Entry" id="btnAdd" onclick="btnAdd_Click" runat="server"/>
	</td>
    </tr>

    <tr><td></td>
	<td></td>
	<td></td>
	<td>
	    <asp:button width="120px" Text="Reset List" id="btnReset" onclick="btnReset_Click" runat="server"/>
	</td>
    </tr>
</table>
<p>

<table>
    <tr><td><p><h4><asp:label id="output" runat="server"/></h4></td>
	<td valign="top"><asp:button width="120px"
			Text="Clear"
			id="btnClear"
			onclick="btnClear_Click"
			runat="server"
			visible="false"/>
	</td>
    </tr>
</table>


</form>
</body>
</html>