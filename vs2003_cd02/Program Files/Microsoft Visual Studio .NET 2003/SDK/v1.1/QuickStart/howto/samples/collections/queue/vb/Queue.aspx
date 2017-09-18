<%@ Page Language="VB" Debug="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_Load(source As Object, E As EventArgs)

	' populate the names array...
	TestQueue.names = New String() {"Simpson", "Bristow", "Walls", "Gilligan", "Davidson", "Laurence", _
				"Jackson", "Singh", "O'Connor", "Barclay"}	

	lblOriginal.Text = "<PRE>" & TestQueue.PrintArray() & "</PRE>"
	lblQueue.Text = "<PRE>" & TestQueue.MakeQueue() & "</PRE>"
	lblSortedList.Text = "<PRE>" & TestQueue.MakeSortedList() & "</PRE>"
	lblHashtable.Text = "<PRE>" & TestQueue.MakeHashtable() & "</PRE>"

	lblSeek.Text = "<PRE>" & TestQueue.AvgSearch() & "</PRE>"
End Sub

class TestQueue

	Public Shared names() As String

	Public Shared Function PrintArray() As String
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.Write("The order of the entries in the Array: ")

		Dim i As Integer

		For i = 0 to names.Length - 1

			Console.Write(names(i))

			If i < names.Length - 1 Then
				Console.Write(", ")
			End If

			If (i + 1) mod 6 = 0 Then
				Console.WriteLine()
			End If
		Next i

		PrintArray = strWriter.ToString()
	End Function

	Public Shared Function MakeQueue() As String
	
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("The Entries In The Queue")
		Console.WriteLine("------------------------")

		Dim q As Queue = New Queue()
		Dim s As String

		For Each s In names
			q.Enqueue(s)
		Next s

		For Each s in q
			Console.WriteLine(s)
		Next s

		return strWriter.ToString()
	End Function

	Public Shared Function MakeSortedList() As String
	
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("The Entries In The Sorted List")
		Console.WriteLine("------------------------------")

		Dim sl As SortedList = New SortedList()
		Dim s As String

		For Each s In names
			sl.Add(s, s)
		Next s

		For Each s In sl.Values
			Console.WriteLine(s)
		Next s

		return strWriter.ToString()
	End Function

	Public Shared Function MakeHashtable() As String
	
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("The Entries In The Hashtable")
		Console.WriteLine("----------------------------")

		Dim ht As Hashtable = New Hashtable()
		Dim s As String

		For Each s In names
			ht.Add(s, s)
		Next s

		For Each s In ht.Values
			Console.WriteLine(s)
		Next s

		return strWriter.ToString()
	End Function


	Public Shared Function AvgSearch() As String
	
		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("Comparing Seek Times")
		Console.WriteLine("-----------------------------")

		Dim sl As SortedList = New SortedList()
		Dim ht As Hashtable = New Hashtable()
		Dim q As Queue = New Queue()

		Dim i As Int64

		For i = 0 to 300000
		
			q.Enqueue(i)
			sl.Add(i, i)
			ht.Add(i, i)
		Next i

		Dim startTime As Int64 = 0
		Dim endTime As Int64 = 0
		Dim foundValue As Boolean = false
		Dim valToFind As Int64 = 269831

		startTime = Environment.TickCount
		foundValue = q.Contains(valToFind)
		endTime = Environment.TickCount

		Console.WriteLine("{0,-50} {1}", "Total Seek time for Queue:", endTime - startTime)

		startTime = Environment.TickCount
		foundValue = sl.Contains(valToFind)
		endTime = Environment.TickCount

		Console.WriteLine("{0,-50} {1}", "Total Seek time for SortedList, by Key:", endTime - startTime)

		startTime = Environment.TickCount
		foundValue = ht.Contains(valToFind)
		endTime = Environment.TickCount

		Console.WriteLine("{0,-50} {1}", "Total Seek time for Hashtable, by Key:", endTime - startTime)

		startTime = Environment.TickCount
		foundValue = sl.ContainsValue(valToFind)
		endTime = Environment.TickCount

		Console.WriteLine("{0,-50} {1}", "Total Seek time for SortedList, by Value:", endTime - startTime)

		startTime = Environment.TickCount
		foundValue = ht.ContainsValue(valToFind)
		endTime = Environment.TickCount


		Console.WriteLine("{0,-50} {1}", "Total Seek time for Hashtable, by Value:", endTime - startTime)

		return strWriter.ToString()
	End Function
End Class
</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
<form runat="server">
    <p>

    <table>
    <tr align=left><td><b>The following example demonstrates using three different types of collections: a Queue, a SortedList, and a Hashtable.</b> A Queue stores elements in the same order they are placed in it, while a SortedList stores them in the fashion specified by the comparer for the SortedList (we use the default comparer, which stores strings in alphabetical order). You can control the way in which the SortedList sorts its elements. Finally, a Hashtable stores elements in a sequence of its own devising, meaning it will not really make sense to us, but will probably not be the same way as we placed the elements in the Hashtable. Searching for items in SortedLists and Hastables is generally faster than when searching in a Queue, especially when searching by key, rather than by value.
<p>
Each of these collections has its own particular uses, and capabilities.
		<hr>
    </td></tr>
    </table>

    <b><asp:label id="lblOriginal"  width="700px" runat="server"/></b>

    <table cellpadding=15 border=1>
    <tr><td><h4><asp:label id="lblQueue" runat="server"/></h4></td>
	<td><h4><asp:label id="lblSortedList" runat="server"/></h4></td>
	<td><h4><asp:label id="lblHashtable" runat="server"/></h4></td>
    </tr>
    </table>

    <table>
    <tr>
	<td valign=top colspan=3><h4><asp:label id="lblSeek" runat="server"/></h4></td>
    </tr>
    </table>

</form>
</body>
</html>