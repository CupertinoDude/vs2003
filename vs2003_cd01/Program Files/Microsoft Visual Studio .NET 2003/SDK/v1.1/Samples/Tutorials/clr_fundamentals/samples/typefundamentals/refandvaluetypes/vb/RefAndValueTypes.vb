Imports System

' Reference Type (because of ‘class’)
Class RefType 
   Public Dim x As Integer
End Class

' Value type (because of ‘struct’)
Structure ValType 
   Public Dim x As Integer
End Structure

Class App
   Shared Sub Main() 
      Dim rt1 As New RefType()  ' Allocated in heap & ctor called
      Dim vt1 As New ValType()  ' Allocated on stack & fields set to 0
      rt1.x = 10	        ' Pointer dereference
      vt1.x = 10                ' Changed on stack

      Dim rt2 As RefType = rt1         ' Copies pointer only
      Dim vt2 As ValType = vt1         ' Allocate on stack & copies members
      rt1.x = 20                ' Changes pr1 and pr2
      vt1.x = 20                ' Changes pv1, not pv2
      Console.WriteLine("rt1.x = {0}, rt2.x = {1}", rt1.x, rt2.x)
      Console.WriteLine("vt1.x = {0}, vt2.x = {1}", vt1.x, vt2.x)

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class

