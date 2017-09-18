
Imports System
Imports System.Runtime.Remoting


Namespace CAOLibrary
    
    ' Counter is a Client Activated Object that:
    ' * Is exported in the remoting configuration file
    ' * Has a Constructor with parameters
    ' * Has a public Property that can set and get
    ' * has fields in which state is stored between calls
    ' * Has methods that can be called to change the state
    ' * Has overloaded methods
    ' * The above elements of the CAO are remoted over SOAP
    Public Class Counter
        Inherits MarshalByRefObject
        Public name As String = ""
        Private totalNumberField As Integer = 0
        
        
        Public Sub New(_name As String)
            Console.WriteLine("Zap({0})", _name)
            name = _name
        End Sub 'New
        
        ' public property
        Public Property TotalNumber() As Integer
            Get
                Console.WriteLine("TotalNumber: {0}", totalNumberField)
                Return totalNumberField
            End Get
            
            Set
                SyncLock Me
                    totalNumberField = value
                    Console.WriteLine("TotalNumber: {0}", totalNumberField)
                End SyncLock
            End Set
        End Property
        
        
        ' Changes the in memory state
        Public Function DoWorkWithNumber(number As Integer) As Boolean
            SyncLock Me
                Console.WriteLine("Change: {0}", number)
                totalNumberField += number
                Console.WriteLine("Total:  {0}", totalNumberField)
            End SyncLock
            
            Return True
        End Function 'DoWorkWithNumber
        
        
        Public Function DoWorkWithNumbers(numbers() As Integer) As Boolean
            Dim num As Integer
            For Each num In  numbers
                DoWorkWithNumber(num)
            Next num
            
            Return True
        End Function 'DoWorkWithNumbers
        
        
        Public Function DoWorkWithNumbers(numbers() As [String]) As Boolean
            Dim str As [String]
            For Each str In  numbers
                Dim num As Integer = Convert.ToInt32(str)
                DoWorkWithNumber(num)
            Next str
            
            Return True
        End Function 'DoWorkWithNumbers
    End Class 'Counter 
End Namespace 'CAOLibrary