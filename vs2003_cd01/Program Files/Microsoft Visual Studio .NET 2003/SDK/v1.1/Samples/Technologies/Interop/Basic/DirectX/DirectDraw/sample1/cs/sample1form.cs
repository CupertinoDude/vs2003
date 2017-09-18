using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using DxVBLib;

public class Sample1Form : Form
{
	private Container components = null;
	private Panel Panel1 = null;

	private DirectX7 DirectX = null;
	private DirectDraw7 DirectDraw = null;
	private DirectDrawSurface7 Surface = null;
	private DirectDrawSurface7 PrimarySurface = null;
	private DDSURFACEDESC2 Surface1; 
	private DDSURFACEDESC2 Surface2;
	private DirectDrawClipper Clipper = null;

	private Boolean bInit;

	public Sample1Form()
	{
		InitializeComponent();
		DirectX = new DirectX7();
		InitializeDirectX();
	}

	private void InitializeComponent()
	{
		this.components = new Container();
		this.Panel1 = new Panel();

		Panel1.Location = new Point(0, 0);
		Panel1.Size = new Size(255, 255);
		Panel1.TabStop = false;

		this.Controls.Add(Panel1);
		this.Text = "Interoperability with DirectX";
		this.ClientSize = new Size(255, 255);
		
		// Event handlers
		this.Resize += new EventHandler(this.Form_Resize);
		Panel1.Paint += new PaintEventHandler(this.Panel1_Paint);
	}

	private void Form_Resize (System.Object sender, System.EventArgs e)
	{
	    Panel1.Width = this.ClientSize.Width;
	    Panel1.Height = this.ClientSize.Height;
	    Blt();
	}
	
	//
	// Called during run-time when the form is moved or resized.
	//
	public void Panel1_Paint(System.Object sender, PaintEventArgs e)
	{
	    DirectDraw.RestoreAllSurfaces();
	    Blt();
	}

	private void Blt()
	{
	    // Has DirectX been initialized? If not, exit.
	    if (bInit == false)
			return;

		DxVBLib.RECT r1 = new DxVBLib.RECT();
	    DxVBLib.RECT r2 = new DxVBLib.RECT();

	    // Gets the bounding rectangle for the entire window handle and stores it in r1
	    DirectX.GetWindowRect(Panel1.Handle.ToInt32(), ref r1);
    
	    r2.Bottom = Surface2.lHeight;
	    r2.Right = Surface2.lWidth;
    
	    PrimarySurface.Blt(ref r1, Surface, ref r2, CONST_DDBLTFLAGS.DDBLT_WAIT);
	}

	private void InitializeDirectX()
	{
	    // The empty string parameter means to use the active display driver
	    DirectDraw = DirectX.DirectDrawCreate("");
        
	    // Indicate that this will be a normal windowed application
	    // with the same display depth as the current display
	    DirectDraw.SetCooperativeLevel(this.Handle.ToInt32(), CONST_DDSCLFLAGS.DDSCL_NORMAL);
    
		// Indicate that the ddsCaps member is valid
		Surface1.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS;
		
		// This surface is the primary surface (the one visible to the user)
		Surface1.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_PRIMARYSURFACE;

		// Create the primary surface with the surface description we just set
		PrimarySurface = DirectDraw.CreateSurface(ref Surface1);
		
		// Set the second surface description
		Surface2.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS;

		// This is going to be a plain off-screen surface
		Surface2.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_OFFSCREENPLAIN;

		//Create the off-screen surface

		try
		{
			Surface = DirectDraw.CreateSurfaceFromFile("background.bmp", ref Surface2);
		}
		catch(System.Runtime.InteropServices.COMException e)
		{
			// File Not Found
			if ( (uint)e.ErrorCode == 0x800A0035)
			{
				MessageBox.Show("Could not find the file 'background.bmp'.  This must be placed in the current directory.", "Picture Not Found");
			}
			else
			{
				MessageBox.Show("Unexpected exception: " + e.ToString(), "Unexpected Exception");
			}
			Application.Exit();
			Application.DoEvents();
		}

		Clipper = DirectDraw.CreateClipper(0);
		Clipper.SetHWnd(Panel1.Handle.ToInt32());
		PrimarySurface.SetClipper(Clipper);

		// We've finished initialization
		bInit = true;
		Blt();
	}

	[STAThread()]
	public static void Main()
	{
		Application.Run(new Sample1Form());
	}

}
