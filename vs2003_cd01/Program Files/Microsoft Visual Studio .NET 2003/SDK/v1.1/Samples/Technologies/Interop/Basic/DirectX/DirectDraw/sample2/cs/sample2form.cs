using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;
using DxVBLib;
using System.Runtime.InteropServices;

public class DirectDrawSampleForm : Form
{
	private Container   components;
	private PictureBox  PictureBox1;

	DirectX7            DirectX;
	DirectDraw7         DirectDraw;
	DirectDrawSurface7 	BackgroundSurface;
	DirectDrawSurface7  SpriteSurface;
	DirectDrawSurface7  ScreenSurface;
	DirectDrawSurface7  BackBufferSurface;
	DirectDrawClipper   Clipper;

	DDSURFACEDESC2      ddsdLake;
	DDSURFACEDESC2      ddsdSprite;
	DDSURFACEDESC2      ddsdScreen;
	DDSURFACEDESC2      ddsdBackBuffer;
	RECT				rBackBuffer;
	RECT                rLake;
	RECT                rSprite;
	int                 lastX;
	int                 lastY;
	double              fps;
	bool                running;

	static double       a;
	static double       tDif;
	static int          i;
	static double       tLast;
	static double       tNow;

    DirectDrawSampleForm() : base()
    {
		// This call is required for support of the .NET Framework Classes Designer.
		InitializeComponent();

		DirectX = new DirectX7();

		InitializeDirectX();
	}

	private void InitializeComponent()
	{
		this.components = new Container();
		this.PictureBox1 = new PictureBox();

		PictureBox1.Location = new Point(0, 0);
		PictureBox1.Size = new Size(430, 330);
		PictureBox1.TabStop = false;

		this.Controls.Add( PictureBox1 );
		this.Text = "Interoperability with DirectX";
		this.ClientSize = new Size(430, 330);
		this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
		this.MaximizeBox = false;
		this.MinimizeBox = false;

		// Event handlers
		PictureBox1.Paint += ( new PaintEventHandler( ref this.PictureBox1_Paint ) );
	}

	protected override void Dispose( bool disposing )
	{
		running = false;
		if( disposing )
		{
			if (components != null)
			{
				components.Dispose();
			}
		}
		base.Dispose( disposing );
	}

	public void PictureBox1_Paint( Object sender, PaintEventArgs e )
	{
		if ( running == true )
		    DoFrame();
	}

	private void InitializeDirectX()
	{
	    // The empty string parameter means to use the active display driver
	    DirectDraw = DirectX.DirectDrawCreate( "" );
	    this.Show();

	    // Indicate that this will be a normal windowed application
	    // with the same display depth as the current display
	    DirectDraw.SetCooperativeLevel( this.Handle.ToInt32(), CONST_DDSCLFLAGS.DDSCL_NORMAL );

		// Indicate that the ddsCaps member is valid
		ddsdScreen.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS;

		// This surface is the primary surface (the one visible to the user)
		ddsdScreen.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_PRIMARYSURFACE;

		// Create the primary surface with the surface description we just set
		ScreenSurface = DirectDraw.CreateSurface( ref ddsdScreen );

		// Create a clipper object (used to set the writable region of the screen)
		Clipper = DirectDraw.CreateClipper( 0 );

		// Associate the PictureBox handle with the clipper
		Clipper.SetHWnd( PictureBox1.Handle.ToInt32());

		// Have the blts to the screen clipped to the PictureBox
		ScreenSurface.SetClipper( Clipper );

		//----- Create an invisible surface to draw to.
		//----- Use it as a compositing surface in system memory.

		// Indicate that we want to specify the ddscaps height and width.
		// The format of the surface (bits per pixel) will be the same as the primary.
		ddsdBackBuffer.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS | CONST_DDSURFACEDESCFLAGS.DDSD_HEIGHT | CONST_DDSURFACEDESCFLAGS.DDSD_WIDTH;

		// Indicate that we want a surface that is not visible and that
		// we want it in system memory.
		ddsdBackBuffer.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_OFFSCREENPLAIN | CONST_DDSURFACECAPSFLAGS.DDSCAPS_SYSTEMMEMORY;

		// Specify the height and width of the surface to be the same as the PictureBox.
		ddsdBackBuffer.lWidth = PictureBox1.Width;
		ddsdBackBuffer.lHeight = PictureBox1.Height;

		// Create the requested surface
		BackBufferSurface = DirectDraw.CreateSurface( ref ddsdBackBuffer );

		if ( !InitializeSurfaces() )
		    return;

		rBackBuffer.Bottom = ddsdBackBuffer.lHeight;
		rBackBuffer.Right = ddsdBackBuffer.lWidth;

		// Get the area of the bitmap we want to blt
		rLake.Bottom = ddsdLake.lHeight;
		rLake.Right = ddsdLake.lWidth;

		rSprite.Bottom = ddsdSprite.lHeight;
		rSprite.Right = ddsdSprite.lWidth;

		RepaintEntireBackground();

		running = true;
    }

	public void RepaintEntireBackground()
	{
		// Copy the backround bitmap to the background surface
		BackBufferSurface.BltFast( 0, 0, BackgroundSurface, ref rLake, CONST_DDBLTFASTFLAGS.DDBLTFAST_WAIT );
    }

	public bool InitializeSurfaces()
	{
	    //----- Load the background image

	    // Indicate that we want to create an offscreen surface.
	    // An offscreen surface is one that is available in memory
	    // (video or system memory) but is not visible to the user.
	    ddsdLake.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS | CONST_DDSURFACEDESCFLAGS.DDSD_WIDTH | CONST_DDSURFACEDESCFLAGS.DDSD_HEIGHT;
	    ddsdLake.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_OFFSCREENPLAIN;
	    ddsdLake.lWidth = PictureBox1.Width;
	    ddsdLake.lHeight = PictureBox1.Height;

	    // Create the surface and load the bitmap onto the surface
		try
		{
			BackgroundSurface = DirectDraw.CreateSurfaceFromFile( "background.bmp", ref ddsdLake );
		}
		catch ( System.Runtime.InteropServices.COMException e )
		{
			// File Not Found
			if ( (uint)e.ErrorCode == 0x800A0035 )
				MessageBox.Show( "Could not find the file 'background.bmp'.  This must be placed in the current directory.", "Picture Not Found" );
			else
				MessageBox.Show( "Unexpected exception: " + e.ToString(), "Unexpected Exception" );

			Application.Exit();
		    return false;
		}

		// Copy the background to the compositing surface
		RepaintEntireBackground();

		//----- Load the sprite image

	    // Load the bitmap into the second surface

	    // Specify that the ddsCaps field is valid
		ddsdSprite.lFlags = CONST_DDSURFACEDESCFLAGS.DDSD_CAPS | CONST_DDSURFACEDESCFLAGS.DDSD_WIDTH | CONST_DDSURFACEDESCFLAGS.DDSD_HEIGHT;
		ddsdSprite.lWidth = 64;
		ddsdSprite.lHeight = 64;

		// Indicate we want an offscreen surface
		ddsdSprite.ddsCaps.lCaps = CONST_DDSURFACECAPSFLAGS.DDSCAPS_OFFSCREENPLAIN;

	    // Create the surface and load the bitmap onto the surface
		try
		{
			SpriteSurface = DirectDraw.CreateSurfaceFromFile( "sprite.bmp", ref ddsdSprite );
		}
		catch ( System.Runtime.InteropServices.COMException e )
		{
			// File Not Found
			if ( (uint)e.ErrorCode == 0x800A0035 )
				MessageBox.Show( "Could not find the file 'sprite.bmp'.  This must be placed in the current directory.", "Picture Not Found" );
			else
				MessageBox.Show( "Unexpected exception: " + e.ToString(), "Unexpected Exception" );

			Application.Exit();
			return false;
		}

		//----- Set the transparent color of the sprite
		DDCOLORKEY key;
		key.low = 0;
		key.high = 0;

		// Assign the transparent color to the sprite object.
		// DDCKEY_SRCBLT specifies that when a blt is done the
		// transparent color is associated with the surface being
		// blitted and not the one being blitted to.
		SpriteSurface.SetColorKey( CONST_DDCKEYFLAGS.DDCKEY_SRCBLT, ref key );

        return true;
    }

	public void DoFrame()
	{
		RECT    rPrim = new RECT();
		float   x;
		float   y;

		// Calculate the angle for placing the sprite
		tDif = Counter.Elapsed;
		a += tDif * 100;
	    if ( a > 360 )
	    	a -= 360;

		// This will keep us from trying to blt in case we lose the surfaces (another fullscreen app takes over)
		bool bRestore = false;
		while ( ExModeActive() == false )
		{
			Application.DoEvents();
			bRestore = true;
		}

		// If we lost and got back the surfaces, then restore them
		Application.DoEvents();
		if ( bRestore == true )
		{
			bRestore = false;
			DirectDraw.RestoreAllSurfaces();
			InitializeSurfaces();    //  must initialize the surfaces again if they were lost
		}

		// Calculate Frames Per Second
		++i;
		if ( i == 30 )
		{
			tNow = (double)Counter.Value;
			if ( tNow != tLast )
			{
				fps = 30 / ((tNow - tLast) / Counter.Frequency);
				tLast = tNow;
				i = 0;
				this.Text = "Interoperability with DirectX - Frames per Second = " + fps.ToString("####.0");
			}
		}

		// Calculate the x y coordinate of where we place the sprite
		x = (float) Math.Cos((a / 360) * 2 * 3.141) * PictureBox1.Width / 8;
		y = (float) Math.Sin((a / 360) * 2 * 3.141) * PictureBox1.Height / 8;
		x = x + PictureBox1.Width / 2;
		y = y + PictureBox1.Height / 2;

		// Clean up background from last frame
		// by only reparing the background where it needs it
		// (We don't need to reblit the whole thing.)
		RECT rClean;
		if ( lastX != 0 )
		{
			rClean.Left = lastX;
			rClean.Top = lastY;
			rClean.Right = lastX + ddsdSprite.lWidth;
			rClean.Bottom = lastY + ddsdSprite.lHeight;
			BackBufferSurface.BltFast( lastX, lastY, BackgroundSurface, ref rClean, CONST_DDBLTFASTFLAGS.DDBLTFAST_WAIT );
		}

		lastX = (int) x;
		lastY = (int) y;

		// Blt to the backbuffer from our sprite.
		// Use the color key on the source (our sprite).
		// Wait for the blt to finish before moving one.
		RECT rtemp;
		rtemp.Left = (int) x;
		rtemp.Top = (int) y;
		rtemp.Right = (int) (x + ddsdSprite.lWidth);
		rtemp.Bottom = (int) (y + ddsdSprite.lHeight);

		BackBufferSurface.Blt( ref rtemp, SpriteSurface, ref rSprite, CONST_DDBLTFLAGS.DDBLT_KEYSRC | CONST_DDBLTFLAGS.DDBLT_WAIT );

		// Get the position of the PictureBox in screen coordinates
		DirectX.GetWindowRect( PictureBox1.Handle.ToInt32(), ref rPrim );

		// Blt the back buffer to the screen
		ScreenSurface.Blt( ref rPrim, BackBufferSurface, ref rBackBuffer, CONST_DDBLTFLAGS.DDBLT_WAIT );
    }

	public bool ExModeActive()
	{
		int TestCoopResult = DirectDraw.TestCooperativeLevel();
	    return ( TestCoopResult == (int)CONST_DDRAWERR.DD_OK ) ? true : false;
	}

	[STAThread()]
	public static void Main()
	{
		try
		{
			DirectDrawSampleForm form = new DirectDrawSampleForm();
			while ( form.running == true )
			{
				form.DoFrame();
				Application.DoEvents();
			}
		}
		catch (COMException e)
		{
			MessageBox.Show("Unexpected exception: " + e.ToString(), "Unexpected Exception");
		}
		catch {}
	}
}

internal sealed class Counter {
    private static long lastValue = -1;

    // not creatable...
    //
    private Counter() {
    }

    // Gets the elapsed time in seconds since the last time this method was called.
    public static float Elapsed {
        get {
            if (lastValue == -1) {
                lastValue = Value;
                return 0;
            }

            // copy lastValue to the stack before calling Value to guarantee it is less than Value
            long localLastValue = lastValue;
            long newValue = Value;
            long elapsed = newValue - localLastValue;
            lastValue = newValue;
            return (float)elapsed/(float)Frequency;
        }
    }

    // Gets the frequency of the system counter in counts per second.
    public static long Frequency {
        get {
            long freq = 0;
            QueryPerformanceFrequency(ref freq);
            return freq;
        }
    }

    // Gets the current system counter value.
    public static long Value {
        get {
            long count = 0;
            QueryPerformanceCounter(ref count);
            return count;
        }
    }

    [System.Runtime.InteropServices.DllImport("KERNEL32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
    private static extern bool QueryPerformanceCounter( [System.Runtime.InteropServices.Out, In] ref long lpPerformanceCount);

    [System.Runtime.InteropServices.DllImport("KERNEL32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
    private static extern bool QueryPerformanceFrequency( [System.Runtime.InteropServices.Out, In] ref long lpFrequency);
}
