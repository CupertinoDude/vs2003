<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="VB" runat=server>

Sub Page_Load(Source As Object, E As EventArgs)

	output.Text = "<pre>" & compareExample.Go() & "</pre>"
End Sub

Class compareExample

    
    Public shared Function Go() As String
    
	Dim strWriter As StringWriter = new StringWriter()
	Console.SetOut(strWriter)

	Console.WriteLine(vbcrlf)

        'this example will compare some ints
        Console.WriteLine ("We have defined a Max method, that works on any types which implement the IComparable interface...." & vbcrlf)


        Console.WriteLine ("{0,-55} {1}", "Comparing Integers:     Max (5, 10) =", Max (5, 10))
	Console.WriteLine()

        Console.WriteLine ("{0,-55} {1}", "Comparing Doubles:      Max (4.3, 2.5) =", Max (4.3, 2.5))
	Console.WriteLine()

        Dim d1 as Decimal = 1235698
        Dim d2 as Decimal = -234238
        Console.WriteLine ("{0,-55} {1}", "Comparing Decimals:     Max (" & d1 & ", " & d2 & ") =", Max (d1, d2))
	Console.WriteLine()

        Dim s1 As String = "Mathew"
        Dim s2 As String = "Mark"
        Console.WriteLine ("{0,-55} {1}", "Comparing Strings:      Max (" & s1 & ", " & s2 & ") =", Max (s1, s2))
	Console.WriteLine()

        Dim c1 As Char = "t"
        Dim c2 As Char = "a"
        Console.WriteLine ("{0,-55} {1}", "Comparing Chars:        Max (" & c1 & ", " & c2 & ") =", Max (c1, c2))
	Console.WriteLine()

        Dim t1 As MyType = new MyType (12)
        Dim t2 As MyType = new MyType (17)
        Console.WriteLine ("{0,-55} {1}", "Comparing Custom Types: Max (" & t1.ToString() & _
				", " & t2.ToString() & ") =", Max (t1,  t2))

	Go = strWriter.ToString()      
    End Function

    Public Shared Function Max (val1 As IComparable , val2 As IComparable) As IComparable
    
        if (val1.CompareTo(val2) > 0) 
            Return val1 'val1 > val2
        End If
        
        if (val1.CompareTo(val2) < 0) 
           Return val2 'val1 < val2
        End If
        
        if (val1.CompareTo(val2) = 0) 
           Return val1 'val1 = val2, return val1 by definition
        End If

    End Function
End Class

Public Class MyType : Implements IComparable

    Private _value As Integer
    Public Sub New(value As Integer)
      MyBase.New()
       _value = value
    End Sub
    
    Public Function CompareTo (o As Object) As Integer Implements IComparable.CompareTo
        If (Not (TypeOf(o) is MyType)) 
           Throw New ArgumentException ("o must be of type 'MyType'")
        End If
        Dim v As MyType 
        v = CType (o, MyType)
        Return _value - v._value
    End Function
    
     Overrides Public Function  ToString () As String
        Return [String].Format ("MyType({0})", _value)
    End Function
End Class 'MyType

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td><b>The following example shows what happens when you implement the IComparable interface to compare objects to one another.</b> You can compare base datatypes, or define your own objects for comparison, so long as they implement IComparable. In this example, we define a Max method to compare any two objects that implement IComparable.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>

