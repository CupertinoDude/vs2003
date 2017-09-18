<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_Load(source as Object, e as EventArgs) 
    output.Text = "<PRE>" & listSample.Go() & "</PRE>"
End Sub

Public Class listSample     
    Public Shared Function Go() As String

        Dim strWriter As New StringWriter
        Console.SetOut(strWriter)

        Dim al As New ArrayList  'declare the list, with a default capacity of 16
        Dim intTemp As Integer = 12        

        'display the initial count, and capacity
        Console.WriteLine("The initial Count of our list is {0} " & _
            "and its Capacity is {1}", al.Count, al.Capacity)

        'add elements to the list
        al.Add("Apple")
        al.Add(intTemp)
        al.Add("Orange")
        al.Add("Banana")
        al.Add("Pear")
        al.Add(New MyType())
        al.Add("Strawberry")
        al.Add("Cherry")

        Console.WriteLine()

        'display the count, and capacity
        Console.WriteLine("After populating our list, its Count is {0} " & _
            "and its Capacity is {1}", al.Count, al.Capacity)

        Console.WriteLine()

        'display the datatypes of the elements in the list
        Console.WriteLine("datatypes of elements in the list:")
        Console.WriteLine("----------------------------------")

        Dim item as Object

        For Each item In al
            Console.WriteLine(item.GetType().ToString() & "")
        Next item

        Console.WriteLine("----------------------------------")
        Console.WriteLine()

        Console.WriteLine("Removing the integer object...")
        'remove a specific element, using the Remove method
        al.Remove(intTemp)

        Console.WriteLine("Removing the MyType object...")
        'remove a specific object, using RemoveAt
        'remove the MyType. Remember, we just removed 
        'intTemp, which reduced all element indexes by 1
        al.RemoveAt(4) 

        Console.WriteLine("Inserting new object...")
        'add an object, at a specific location. In this case, the start of the list
        al.Insert(0, "Grapes")

        'display the count, and capacity
        Console.WriteLine("After modifying our list, its Count is {0} " & _
            "and its Capacity is {1}", al.Count, al.Capacity)

        Console.WriteLine()

        'indicate we are about to display the list
        Console.WriteLine("The entire list now contains the values:")
        Console.WriteLine("----------------------------------------")

        'note that because we know only Strings are left in our list, 
        'we can use a String object in our foreach statement. If you are 
        'at all uncertain, use foreach (Object item in al)
	Dim strItem As String

        For Each strItem In al        	
            Console.WriteLine(strItem + "")
        Next strItem
        
        Console.WriteLine("----------------------------------------")

        'remove all elements from the list
        al.Clear()

        Console.WriteLine()

        'display the count, and capacity
        Console.WriteLine("After removing all elements from our list, " & _
            "its Count is {0} and its Capacity is {1}", al.Count, al.Capacity)
        Go = strWriter.ToString()
    End Function

End Class

Class MyType 
    'this class doesn't do anything!
End Class

</script>


<html>
<head>
    <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td>
    <b>The following example demonstrates iterating over an ArrayList</b>. 
    Elements are added to, and removed from the list through the use of the 
    methods and properties in the ArrayList. To iterate over the list, use a 
    For Each statement, which can identify each object in the list in turn.
    <hr>
    </td></tr>
    <tr><td><h4><asp:label id="Output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>