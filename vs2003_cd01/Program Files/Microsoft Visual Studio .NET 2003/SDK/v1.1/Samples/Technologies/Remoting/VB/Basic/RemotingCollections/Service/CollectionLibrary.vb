
Imports System
Imports System.Collections


Namespace CollectionLibrary
    
    <Serializable()> Public Class Country
        Public Name As [String]
        Public Capital As [String]
    End Class 'Country
    
    
    <Serializable()> Public Class City
        Public Name As [String]
        Public AreaCode As [String]
    End Class 'City
    
    
    ' CollectionService is WellKnown (Server Activated Object) that returns:
    ' * System.Collections.Stack
    ' * System.Collections.ArrayList
    ' * System.Collections.Hashtable
    Public Class CollectionService
        Inherits MarshalByRefObject
        
        Public Function RetrieveStack() As Stack
            Console.WriteLine("Building Stack")
            Dim wordStack As New Stack()
            
            wordStack.Push("!")
            wordStack.Push("World")
            wordStack.Push("Hello")
            
            Return wordStack
        End Function 'RetrieveStack
        
        
        Public Function RetrieveArrayList() As ArrayList
            Console.WriteLine("Building CountryArrayList")
            Dim countryArrayList As New ArrayList()
            
            Dim country1 As New Country()
            country1.Name = "USA"
            country1.Capital = "Washington DC"
            countryArrayList.Add(country1)
            
            Dim country2 As New Country()
            country2.Name = "Japan"
            country2.Capital = "Tokyo"
            countryArrayList.Add(country2)
            
            Dim country3 As New Country()
            country3.Name = "France"
            country3.Capital = "Paris"
            countryArrayList.Add(country3)
            
            Dim country4 As New Country()
            country4.Name = "Eqypt"
            country4.Capital = "Cairo"
            countryArrayList.Add(country4)
            
            Return countryArrayList
        End Function 'RetrieveArrayList
        
        
        Public Function RetrieveHashtable() As Hashtable
            Console.WriteLine("Building CityHashtable")
            
            Dim cityHashtable As New Hashtable()
            
            Dim city1 As New City()
            city1.Name = "New York"
            city1.AreaCode = "212"
            cityHashtable(city1.AreaCode) = city1
            
            Dim city2 As New City()
            city2.Name = "Atlanta"
            city2.AreaCode = "404"
            cityHashtable(city2.AreaCode) = city2
            
            Dim city3 As New City()
            city3.Name = "Seattle"
            city3.AreaCode = "216"
            cityHashtable(city3.AreaCode) = city3
            
            Return cityHashtable
        End Function 'RetrieveHashtable
    End Class 'CollectionService
End Namespace 'CollectionLibrary