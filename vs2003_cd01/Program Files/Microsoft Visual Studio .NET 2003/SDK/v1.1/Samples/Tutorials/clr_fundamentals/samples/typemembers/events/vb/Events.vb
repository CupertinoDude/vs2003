Imports System


Class Button
   ' Declare a Click Event allowing other objects to register themselves with this event
   Public Event Click As EventHandler

   Public Sub SimulateClick()
      ' Fire the event         
      RaiseEvent Click(Me, Nothing)
   End Sub
End Class


Class App
   ' This method is called when the Button object is clicked
   Sub OnClick(sender As Object, args As EventArgs)
      Console.WriteLine("App object received the Click notification from the Button object.")
   End Sub

   Shared Sub Main()
      ' Create a button object
      Dim btn As New Button()

      ' Create an instance of our App class
      Dim app As New App()

      ' Register a callback method with the Button object's Click event
      AddHandler btn.Click, AddressOf app.OnClick

      ' Simulate that the button has been clicked
      btn.SimulateClick()

      Console.Write("Press Enter to close window...")
      Console.Read()
   End Sub
End Class
