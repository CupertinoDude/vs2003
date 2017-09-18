
Imports System

Class Point : Implements IComparable

    Public x, y As Int32
    
    Public Sub New(x As Int32, y As Int32)
        Me.x = x
        Me.y = y
    End Sub 'New
    
    
    ' CompareTo is define by the IComparable interface
    Public Function CompareTo(other As Object) As Integer Implements IComparable.CompareTo
        Dim p As Point = CType(other, Point)
        
        Dim thisDistanceFromOrigin As Double = Math.Sqrt((x * x + y * y))
        Dim otherDistanceFromOrigin As Double = Math.Sqrt((p.x * p.x + p.y * p.y))
        
        Return Math.Sign((thisDistanceFromOrigin - otherDistanceFromOrigin))
    End Function 'CompareTo
    
    
    Public Overrides Function ToString() As String
        Return String.Format("({0}, {1})", x, y)
    End Function 'ToString
End Class 'Point



Class App
    Shared Sub Main()
        Dim points(4) As Point
        points(0) = New Point(2, 2)
        points(1) = New Point(3, 2)
        points(2) = New Point(2, 3)
        points(3) = New Point(7, 8)
        points(4) = New Point(0, 1)
        
        Array.Sort(points)
        
        ' Display all the elements in the array
        Dim i As Int32
        For i = 0 To points.Length - 1
            Console.WriteLine("Point {0}: {1}", i, points(i))
        Next i

        Console.Write("Press Enter to close window...")
        Console.Read()
    End Sub 'Main
End Class 'App