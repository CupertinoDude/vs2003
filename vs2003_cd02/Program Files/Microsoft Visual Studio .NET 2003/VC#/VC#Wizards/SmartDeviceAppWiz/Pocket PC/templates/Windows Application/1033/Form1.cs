using System;
using System.Drawing;
using System.Collections;
using System.Windows.Forms;
using System.Data;

namespace [!output SAFE_NAMESPACE_NAME]
{
	/// <summary>
	/// Summary description for [!output SAFE_CLASS_NAME].
	/// </summary>
	public class [!output SAFE_CLASS_NAME] : System.Windows.Forms.Form
	{
		private System.Windows.Forms.MainMenu mainMenu1;

		public [!output SAFE_CLASS_NAME]()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			base.Dispose( disposing );
		}
		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.Menu = this.mainMenu1;
			this.Text = "[!output SAFE_CLASS_NAME]";

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>

		static void Main() 
		{
			Application.Run(new [!output SAFE_CLASS_NAME]());
		}
	}
}
