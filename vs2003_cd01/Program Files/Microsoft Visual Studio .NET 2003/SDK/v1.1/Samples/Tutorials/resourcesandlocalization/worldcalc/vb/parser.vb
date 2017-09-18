 '==========================================================================
'  File:		parser.vb
'
'==========================================================================
Imports System


Namespace Demo.Localize.ParseUtil
    
    Public Class Arguments
        Private m_arg1 As [String]
        Private m_op As [Char]
        Private m_arg2 As [String]
        
        
        Public Property Arg1() As [String]
            Get
                Return m_arg1
            End Get
            Set
                m_arg1 = value
                Return
            End Set
        End Property
        
        
        Public Property Op() As [Char]
            Get
                Return m_op
            End Get
            Set
                m_op = value
                Return
            End Set
        End Property
        
        
        Public Property Arg2() As [String]
            Get
                Return m_arg2
            End Get
            Set
                m_arg2 = value
                Return
            End Set
        End Property
    End Class 'Arguments
    
    
    Public Class Parser
        
        '
        ' This parser is pretty unsophisticated!  It only understands formulas of the
        ' format "number"<space><operator><space>"number"
        '
        Public Function Parse(formula As [String]) As Arguments
            Dim args As New Arguments()
            ' get the first arg
            Dim spacePos As Integer = formula.IndexOf(" "c)
            args.Arg1 = formula.Substring(0, spacePos)
            
            
            ' get the operator
            args.Op = formula.Substring(spacePos + 1, 1).ToCharArray()(0)
            
            ' get the second arg
            args.Arg2 = formula.Substring((spacePos + 3))
            
            Return args
        End Function 'Parse
    End Class 'Parser 
End Namespace 'Demo.Localize.ParseUtil
