 '==========================================================================
'  File:		math.vb
'
'==========================================================================
Imports System
<Assembly: System.Reflection.AssemblyVersion("1.0.0.0")>
<Assembly: System.Reflection.AssemblyKeyFile("WorldCalcKey.snk")>


Namespace Demo.Localize.Math
    
    
    Public Class InvalidFormulaException
        Inherits ApplicationException
    End Class 'InvalidFormulaException
     
    Public Class IntegerMath
        
        Public Function GetResult(arg1 As Int32, op As [Char], arg2 As Int32) As [String]
            Select Case op
                Case "+"c
                        Return [String].Format("{0:###0}", arg1 + arg2)
                Case "-"c
                        Return [String].Format("{0:###0}", arg1 - arg2)
                Case "/"c
                        Return [String].Format("{0:###0}", arg1 \ arg2)
                Case "*"c
                        Return [String].Format("{0:###0}", arg1 * arg2)
                Case Else
                        Throw New InvalidFormulaException()
            End Select
        End Function 'GetResult
    End Class 'IntegerMath 
End Namespace 'Demo.Localize.Math
