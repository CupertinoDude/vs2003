using System;


class Button {
   // Declare a Click Event allowing other objects to register themselves with this event
   public event EventHandler Click;

   public void SimulateClick() {
      // If Click is null, then no objects have registered themselves with the event
      if (Click != null) {

         // At least one object is registered with the event, fire the event         
         Click(this, null);
      }
   }
}


class App {
   // This method is called when the Button object is clicked
   void OnClick(Object sender, EventArgs args) {
      Console.WriteLine("App object received the Click notification from the Button object.");
   }

   static void Main() {
      // Create a button object
      Button btn = new Button();

      // Create an instance of our App class
      App app = new App();

      // Register a callback method with the Button object's Click event
      btn.Click += new EventHandler(app.OnClick);

      // Simulate that the button has been clicked
      btn.SimulateClick();

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
