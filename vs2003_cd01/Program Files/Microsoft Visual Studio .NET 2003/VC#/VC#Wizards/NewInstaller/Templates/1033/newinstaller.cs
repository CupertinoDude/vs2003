using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration.Install;

namespace [!output SAFE_NAMESPACE_NAME]
{
	/// <summary>
	/// Summary description for [!output SAFE_CLASS_NAME].
	/// </summary>
	[RunInstaller(true)]
	public class [!output SAFE_CLASS_NAME] : System.Configuration.Install.Installer
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public [!output SAFE_CLASS_NAME]()
		{
			// This call is required by the Designer.
			InitializeComponent();

			// TODO: Add any initialization after the InitializeComponent call
		}

		/// <summary> 
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}


		#region Component Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			components = new System.ComponentModel.Container();
		}
		#endregion
	}
}
