
Imports System
Imports System.Collections
Imports Microsoft.VisualBasic



Class BitArray
    Private numBits As Int32
    Private bytearray() As Byte
    
    
    Public Sub New(numBits As Int32)
        Me.numBits = numBits
        bytearray = New Byte(CType((numBits + 7) / 8, Integer)) {}
    End Sub 'New
    
    
    Default Public Property Item(bit As Int32) As Boolean
        Get
            If bit < 0 Or bit >= numBits Then
                Throw New ArgumentOutOfRangeException("bit must be between 0 and " & numBits)
            End If
            Return (bytearray(CInt(Conversion.Fix(bit / 8))) And CLng(Math.Pow (2, bit Mod 8))) <> 0
        End Get
        Set
            If bit < 0 Or bit >= numBits Then
                Throw New ArgumentOutOfRangeException("bit must be between 0 and " & numBits)
            End If
            If value Then
                bytearray(CInt(Conversion.Fix(bit / 8))) = CType(bytearray(CInt(Conversion.Fix(bit / 8))) Or CLng(Math.Pow (2, bit Mod 8)), [Byte])
            Else
                bytearray(CInt(Conversion.Fix(bit / 8))) = CType(bytearray(CInt(Conversion.Fix(bit / 8))) And Not CLng(Math.Pow (2, bit Mod 8)), [Byte])
            End If
        End Set
    End Property
End Class 'BitArray



Class App
    
    Shared Sub Main()
        Dim ba As New BitArray(14)
        Dim bit As Integer
        For bit = 0 To 13
            ' Set the first 7 bits to On, the rest to Off
            ba(bit) = bit < 7
        Next bit
        
        Dim bitstate As String
        For bit = 0 To 13
            ' Show the value of each bit in the array
            If ba(bit) Then bitstate = "On" Else bitstate = "Off"
            Console.WriteLine("Bit {0} is {1}", bit, bitstate)
        Next bit

        Console.Write("Press Enter to close window...")
        Console.Read()
    End Sub 'Main
End Class 'App