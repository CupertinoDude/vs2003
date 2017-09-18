
Imports System
Imports System.Collections
Imports System.IO
Imports System.Runtime.Remoting
Imports Microsoft.VisualBasic
Imports CollectionLibrary



Public Class Client
    
    Public Shared Function Main(args() As String) As Integer
        Console.WriteLine(".NET Remoting Collection Client")
        Console.WriteLine()
        ' Load the Http Channel from the config file
        RemotingConfiguration.Configure("Client.exe.config")
        
        Dim collectionService As New CollectionService()
        
        Console.WriteLine("Retrieving a Collection Stack by Value")
        Dim wordStack As Stack = collectionService.RetrieveStack()
        
        Console.WriteLine("Stack count: {0}", wordStack.Count)
        
        Dim word As [String]
        For Each word In  wordStack
            Console.Write("{0} ", word)
        Next word
        
        Console.WriteLine()
        Console.WriteLine()
        
        Console.WriteLine("Retrieving an ArrayList by Value")
        Dim countryArrayList As ArrayList = collectionService.RetrieveArrayList()
        
        Console.WriteLine("ArrayList count: {0}", countryArrayList.Count)
        
        Console.WriteLine("Country" + ControlChars.Tab + " Capital")
        Console.WriteLine("-------" + ControlChars.Tab + " -------")
        Dim country As Country
        For Each country In  countryArrayList
            Console.WriteLine("{0}" + ControlChars.Tab + "{1}", country.Name, country.Capital)
        Next country
        Console.WriteLine()
        
        Console.WriteLine("Retrieving Hashtable by Value")
        Dim cityHashtable As Hashtable = collectionService.RetrieveHashtable()
        
        Console.WriteLine("Hashtable count: {0}", cityHashtable.Count)
        
        Dim cityEnumerator As IDictionaryEnumerator = cityHashtable.GetEnumerator()
        Console.WriteLine("KEY" + ControlChars.Tab + "VALUE")
        Console.WriteLine("---" + ControlChars.Tab + "-----")
        
        While cityEnumerator.MoveNext()
            Console.WriteLine("{0}:" + ControlChars.Tab + "{1}", cityEnumerator.Key, cityEnumerator.Value)
            If TypeOf cityEnumerator.Value Is City Then
                Dim city As City = CType(cityEnumerator.Value, City)
                
                Console.WriteLine(ControlChars.Tab + ControlChars.Tab + "Name    : {0}", city.Name)
                Console.WriteLine(ControlChars.Tab + ControlChars.Tab + "AreaCode: {0}", city.AreaCode)
            End If
            
            Console.WriteLine()
        End While 
        Console.WriteLine()
        
        Return 0
    End Function 'Main
End Class 'Client
