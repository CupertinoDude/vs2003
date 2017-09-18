using System.Globalization;
using System.Resources;
using System.Threading;

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public class MyCodeBehind : Page {
   public ResourceManager rm;
   public DropDownList MyUICulture;

   void Page_Init(Object sender, EventArgs args) {
      // Get the ResourceManager from the Application object.
      rm = (ResourceManager) Application["RM"];
      if(rm == null) {
         // Do something sensible if resources are not available.
         Server.Transfer("noresource.aspx");
      }
   }

   public void Page_Load(Object sender, EventArgs args) {
      String SelectedCulture = MyUICulture.SelectedItem.Text;
      if(! SelectedCulture.StartsWith("Choose")) {
         // If another culture was selected, use that instead.
         Thread.CurrentThread.CurrentCulture = new CultureInfo(SelectedCulture);
         Thread.CurrentThread.CurrentUICulture = new CultureInfo(SelectedCulture);
       }
      rm = (ResourceManager) Application["RM"];
   }
}