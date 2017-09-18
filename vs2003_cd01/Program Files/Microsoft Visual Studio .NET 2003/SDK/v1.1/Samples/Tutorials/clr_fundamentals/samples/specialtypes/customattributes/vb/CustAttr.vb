Imports System
Imports System.Windows.Forms

' The following line applies a custom attribute on the assembly
' The CLSCompliant attrbiute tells the compiler to ensure that any public 
' types/methods are accessible from any programming language 

<assembly: CLSCompliant(true)>


' The Serializable attribute tells the runtime's serialization formatters that
' instances of the App class may be serialized to disk or network

<Serializable> class App 

   ' The STAThreadAttribute attribute tells the CLR that the 
   ' default threading model for this application is Single 
   ' Threaded Apartment (which is required by Windows Forms)

   <STAThreadAttribute> Shared Sub Main()
      MessageBox.Show("Hi There!", "Custom Attributes")

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class