<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>


void Page_Load(Object source, EventArgs e) {

	//populate the names array...
	TestQueue.names = new String[] {"Simpson", "Bristow", "Walls", "Gilligan", "Davidson", "Laurence",
				"Jackson", "Singh", "O'Connor", "Barclay"};	

	lblOriginal.Text = "<PRE>" + TestQueue.PrintArray() + "</PRE>";
	lblQueue.Text = "<PRE>" + TestQueue.MakeQueue() + "</PRE>";
	lblSortedList.Text = "<PRE>" + TestQueue.MakeSortedList() + "</PRE>";
	lblHashtable.Text = "<PRE>" + TestQueue.MakeHashtable() + "</PRE>";

	lblSeek.Text = "<PRE>" + TestQueue.AvgSearch() + "</PRE>";
}

class TestQueue
{
	public static String[] names;

	public static String PrintArray() {
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.Write("The order of the entries in the Array: ");

		for (int i=0;i<names.Length - 1;i++) {

			Console.Write(names[i]);

			if (i < names.Length - 1) {
				Console.Write(", ");
			}

			if (Math.IEEERemainder(i + 1, 6) == 0) {
				Console.WriteLine();
			}
		}

		return strWriter.ToString();
	}

	public static String MakeQueue()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("The Entries In The Queue");
		Console.WriteLine("------------------------");

		Queue q = new Queue();

		foreach (String s in names)
			q.Enqueue(s);

		foreach (String s in q)
			Console.WriteLine(s);

		return strWriter.ToString();
	}

	public static String MakeSortedList()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("The Entries In The Sorted List");
		Console.WriteLine("------------------------------");

		SortedList sl = new SortedList();

		foreach (String s in names)
			sl.Add(s, s);

		foreach (String s in sl.Values)
			Console.WriteLine(s);

		return strWriter.ToString();
	}

	public static String MakeHashtable()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("The Entries In The Hashtable");
		Console.WriteLine("----------------------------");

		Hashtable ht = new Hashtable();

		foreach (String s in names)
			ht.Add(s, s);

		foreach (String s in ht.Values)
			Console.WriteLine(s);

		return strWriter.ToString();
	}


	public static String AvgSearch()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		Console.WriteLine("Comparing Seek Times");
		Console.WriteLine("-----------------------------");

		SortedList sl = new SortedList();
		Hashtable ht = new Hashtable();
		Queue q = new Queue();

		for (Int64 i=0;i<250000;i++)
		{
			q.Enqueue(i);
			sl.Add(i, i);
			ht.Add(i, i);
		}

		Int64 startTime = 0;
		Int64 endTime = 0;
		bool foundValue = false;
		Int64 valToFind = 249831;

		startTime = Environment.TickCount;
		foundValue = q.Contains(valToFind);
		endTime = Environment.TickCount;

		Console.WriteLine("{0,-50} {1}", "Total Seek time for Queue:", endTime - startTime);

		startTime = Environment.TickCount;
		foundValue = sl.Contains(valToFind);
		endTime = Environment.TickCount;

		Console.WriteLine("{0,-50} {1}", "Total Seek time for SortedList, by Key:", endTime - startTime);

		startTime = Environment.TickCount;
		foundValue = ht.Contains(valToFind);
		endTime = Environment.TickCount;


		Console.WriteLine("{0,-50} {1}", "Total Seek time for Hashtable, by Key:", endTime - startTime);

		startTime = Environment.TickCount;
		foundValue = sl.ContainsValue(valToFind);
		endTime = Environment.TickCount;

		Console.WriteLine("{0,-50} {1}", "Total Seek time for SortedList, by Value:", endTime - startTime);

		startTime = Environment.TickCount;
		foundValue = ht.ContainsValue(valToFind);
		endTime = Environment.TickCount;


		Console.WriteLine("{0,-50} {1}", "Total Seek time for Hashtable, by Value:", endTime - startTime);

		return strWriter.ToString();
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