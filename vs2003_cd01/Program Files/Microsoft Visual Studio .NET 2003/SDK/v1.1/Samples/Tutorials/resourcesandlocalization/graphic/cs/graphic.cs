namespace Demo.Graphics {
    
	using System;
	using System.Drawing;
	using System.ComponentModel;
	using System.Windows.Forms;
	using System.IO;
	using System.Reflection;
	using System.Resources;
	using System.Globalization;
	using System.Threading;
	
	public class Images : System.Windows.Forms.Form {

		private System.ComponentModel.Container components;
		private System.Windows.Forms.PictureBox pictureBox1;

		private ResourceManager rm;
	     
		public Images(string culture) {
			if (culture != "") 
				try {
					Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
				}
				catch (ArgumentException e){
					MessageBox.Show(this, e.Message, "Bad command-line argument");
				}
			InitializeComponent();
		}

		protected override void Dispose(bool disposing) {
			if (disposing){
				if (components != null) {
					components.Dispose();
		           	}
			}
			base.Dispose(disposing);
		}


		[System.STAThreadAttribute()]
		public static void Main(string[] args) {
			string strCulture = "";
			if (args.Length == 1) {
				strCulture = args[0];
			}
			Application.Run(new Images(strCulture));
		}

		private void InitializeComponent() {

			rm = new ResourceManager("Images", this.GetType().Assembly);
			
			this.components = new System.ComponentModel.Container();
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.Size = new System.Drawing.Size(100, 100);
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			
			pictureBox1.Location = new System.Drawing.Point(0, 0);
			pictureBox1.Size = new System.Drawing.Size(100, 100);
			pictureBox1.TabIndex = 0;
			pictureBox1.TabStop = false;
			
			pictureBox1.Image = (System.Drawing.Image)rm.GetObject("flag");
			
			this.Controls.Add(pictureBox1);
		}
	}
}
