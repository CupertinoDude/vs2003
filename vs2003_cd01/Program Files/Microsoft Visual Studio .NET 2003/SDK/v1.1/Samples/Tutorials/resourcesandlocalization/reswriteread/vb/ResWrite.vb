Imports System
Imports System.Collections
Imports System.Resources

Class MainApp
    
    Public Shared Sub Main()
        ' First create the resource file and add strings
        Dim rw As ResourceWriter = New ResourceWriter("sample.resources")
        rw.AddResource("test1", "one")
        rw.AddResource("test2", "two")
        rw.AddResource("test3", "three")
        rw.AddResource("test4", "four")
        rw.AddResource("test5", 512341234)
        rw.Close()
        
        ' Iterate through the resources
        Dim rr As ResourceReader = New ResourceReader("sample.resources")
        Dim de As IDictionaryEnumerator = rr.GetEnumerator()
        While de.MoveNext()
            Console.WriteLine((de.Key.ToString() + " " + de.Value.ToString()))
        End While
        rr.Close()
        
        ' Use a ResourceManager to access specific resources
        Dim rm As ResourceManager = ResourceManager.CreateFileBasedResourceManager("sample", ".", Nothing)
        Console.WriteLine(rm.GetString("test1"))
        Console.WriteLine(rm.GetString("test2"))
        Console.WriteLine(rm.GetString("test3"))
        Console.WriteLine(rm.GetString("test4"))
        Console.WriteLine(rm.GetObject("test5").ToString())
    End Sub 'Main 
End Class 'MainApp