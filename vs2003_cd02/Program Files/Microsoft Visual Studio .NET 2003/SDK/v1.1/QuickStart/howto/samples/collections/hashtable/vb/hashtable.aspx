<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_load(src As Object, E As EventArgs)

	If Not Page.IsPostBack Then

		ResetList()
	End If
End Sub

Sub ResetList()

	HashTableSample.table.Clear()

	HashTableSample.table.Add(5123, "Jay")
	HashTableSample.table.Add(2569, "Brad")
	HashTableSample.table.Add(1254, "Brian")
	HashTableSample.table.Add(6839, "Seth")
	HashTableSample.table.Add(3948, "Rajesh")
	HashTableSample.table.Add(1930, "Lakshan")
	HashTableSample.table.Add(9341, "Kristian")
	HashTableSample.table.Add(7921, "Stephen")
	HashTableSample.table.Add(2839, "Tom")
	HashTableSample.table.Add(1829, "Kit")

	MakeList()
End Sub

Sub MakeList()

	lstNames.Items.Clear()
	Dim o As object

	For Each o In HashTableSample.table.Keys
		lstNames.Items.Add(o.ToString() & ": " + HashTableSample.table(o))
	Next

End Sub

Class HashTableSample


	' Here we'll create a hash table of employee numbers and employee names
	Public Shared table As Hashtable = New Hashtable()

	Public Shared Function FindEntry( inKey As Object, value As Object ) As String

		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine()

		' remember that we are looking for integers, so we need to make an integer key...
		If IsNothing(inKey) Then
			inKey = 0 '  just in case the field is empty...
		End If

		Dim key As Int32
		Try
		    key = Int32.Parse(inKey.ToString())
		Catch Exc As Exception
		    key = 0
		End Try

		' now we'll look to see if an employee is in the table
		If value <> Nothing Then

			If table.ContainsValue(value) Then

				Console.WriteLine("Yes, Value '{0}' was found in the list!", value)

			Else

				Console.WriteLine("Sorry, Employee '{0}' could not be found.", value)
			End If

		Else

			If table.Contains(key) Then

				Console.WriteLine("Yes, ID '{0}' was found in the list!", key)

			Else

				Console.WriteLine("Sorry, Employee ID '{0}' could not be found.", key)
			End If
		End If

		Console.WriteLine()
		Console.WriteLine ("Now we will print out the entire list of employees.")

		Console.WriteLine ("ID" & chr(9) & "Name")
		Console.WriteLine ("----" & chr(9) & "-----------")

		Dim d As DictionaryEntry

		For Each d in table

			Console.WriteLine ("{0}{1}{2}", d.Key, chr(9), d.Value)
		Next d

		return strWriter.ToString()
	End Function

	Public Shared Function AddEntry(key As String, value As String ) As Boolean

		Try
			Dim i As Int32 = Convert.ToInt32(key)

			table.Add(i, value)

			AddEntry = true

		Catch E As Exception
			AddEntry = false
		End Try
	End Function
End Class

Sub btnID_Click(source As Object, E As EventArgs)

	output.Text = "<PRE>" & HashTableSample.FindEntry( empID.Text, Nothing ) & "</PRE>"
	btnClear.Visible = true
End Sub

Sub btnName_Click(source As Object, E As EventArgs)

	output.Text = "<PRE>" & HashTableSample.FindEntry( 0, empName.Text ) & "</PRE>"
	btnClear.Visible = true
End Sub

Sub btnClear_Click(source As Object, E As EventArgs)

	output.Text = ""
	empName.Text = ""
	empID.Text = ""
	btnClear.Visible = false

End Sub

Sub btnReset_Click(source As Object, E As EventArgs)

	ResetList()
End Sub

Sub btnAdd_Click(source As Object, E As EventArgs)

	If txtAddKey.Text = "" Or txtAddVal.Text = "" Then
		output.Text = "ADD FAILED: Please ensure you enter both a key, and value entry"
		btnClear.Visible = true

	Else
		If HashTableSample.AddEntry(txtAddKey.Text, txtAddVal.Text) Then

			MakeList()
			btnClear_Click	(Nothing, Nothing)

		Else
			output.Text = "ADD FAILED: Please ensure the following:<br>" & _
				"1) The key is a valid integer<br>" & _
				"2) The key does not already exist in the list"
			btnClear.Visible = true
		End If
	End If
End Sub
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