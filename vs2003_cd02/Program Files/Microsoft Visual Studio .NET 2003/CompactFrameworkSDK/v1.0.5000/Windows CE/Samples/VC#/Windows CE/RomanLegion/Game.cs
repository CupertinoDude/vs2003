/*=====================================================================
  File:      Game.cs

  
  ---------------------------------------------------------------------
   Copyright (C) Microsoft Corporation.  All rights reserved.

  This source code is intended only as a supplement to Microsoft
  Development Tools and/or on-line documentation.  See these other
  materials for detailed information regarding Microsoft code samples.

  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
  PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Drawing;
using System.Windows.Forms;
using System.Reflection;
using System.Threading;
using System.ComponentModel;

namespace RomanLegion
{
	public class GAME: Form
	{
		// State of the game
		private enum Display
		{
			Splash,
			Won,
			Game
		};
		
		// Where we get the images
		public string m_strGamePath = "";

		// Width of Game
		private int m_cxPlay;

		// Height of Game
		private int m_cyPlay;
	
		// Game is running ?
		private bool m_bRunning;
	
		// Mouse/Pen Position
		private int m_xMouse, m_yMouse;
	
		// Is to Repaint the game
		private bool m_bRepaint;
	
		private Bitmap m_bmpOff;
		private Graphics m_gxOff;
		private Graphics m_gxPhys;
		private Bitmap[] m_bmpTap;
	
		// The Barbarian launching arrows
		private Barbarian m_Barbarian;

		// The Arrow
		private Arrow m_Arrow;	

		private Arrow m_RomanArrow;	

		// Legion Attacking
	    private Legion m_Legion;

		// Game Score
		private Score m_Score;
		
		// Last update tick
		private int m_tickOld;
	
		// Game status
		private Display m_Status;

		// Game Paused ?
		private bool m_bPaused=false;
	
		public GAME()
		{

			string strAssmPath = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase;
			m_strGamePath = strAssmPath.Substring(0, strAssmPath.LastIndexOf(@"\") + 1);

			this.BackColor = Color.Red;

			this.Size = new Size(240, 320);

			this.Visible = true;
		
			// Get game client window size
			this.m_cxPlay = this.ClientSize.Width;
			this.m_cyPlay = this.ClientSize.Height;
		
			// Window caption
			this.Text = "Roman Legion";
		
			Init();
		
			// Start running
			m_bRunning = true;
		}

		private void GameMainloop()
		{
			int y;
			Graphics gx;
		
			// get current tick count
			m_tickOld = Environment.TickCount;
		
			InitGame();

			// Game Running
			while (m_bRunning)
			{
				// Do game Step
				DoTick();

				// Process messages to this window
				Application.DoEvents();
			}
			
			// Game over, paused or won the level
			gx = this.CreateGraphics();
			
			// Draw the bitmap correspondent to game status
			for (y = 0; y < this.ClientSize.Height; y += 10)
			{
				gx.DrawImage(m_bmpTap[(int)m_Status], 0, -m_cyPlay + y);
				Thread.Sleep(10);
			}
					
			gx.Dispose();

		}

		private void DoTick()
		{
			int tickSleep;

			// Let the game components move
			ProcessAll();

			// Redraw the game components
			DrawAll();

			// Game timming (Wait next step)
			tickSleep = m_tickOld + (1000 / 70) - Environment.TickCount;
			if (tickSleep > 0)
			{
				Thread.Sleep(tickSleep);
			}
			m_tickOld = Environment.TickCount;

			RefreshAll();
			RestoreAll();
		}

		private void Init()
		{
			// Init game components
			m_Barbarian = new Barbarian(this);
			m_Arrow = new Arrow(this);
			m_RomanArrow = new Arrow(this);
			m_Legion = new Legion(this);
			m_Score = new Score(this);
			
		
			// Init the mouse x position as the middle of the screen
			m_xMouse = m_cxPlay / 2;

			// Load all results bitmaps
			m_bmpTap = new Bitmap[4];


			// The game uses the Pocket PC form size by default and only deploys
			// the required images to save space. If you increase the form size 
			// then the larger images are required, so ensure that the images
			// named "WCE*.bmp" have their Build Action set to Content.
			string Prefix = "WCE";
			if (m_cxPlay<=240)
			{
				Prefix = "PPC";
			}

			LoadBmp(Prefix+"Splash.bmp",(int)Display.Splash);
			LoadBmp(Prefix+"Won.bmp",(int)Display.Won);
			LoadBmp(Prefix+"Pause.bmp",(int)Display.Game);
			LoadBmp(Prefix+"Background.bmp",3);
			m_bmpOff = new Bitmap(m_strGamePath+Prefix+"Background.bmp");

			// Create offscreen playscren
			
			m_gxOff = Graphics.FromImage(m_bmpOff);
			m_gxPhys = this.CreateGraphics();
		}

		private void InitGame()
		{
			// Game is running
			m_bRunning = true;
			
			// If the game was not paused
			if (!m_bPaused)
			{
				// Disable all arrows
				m_Arrow.Stuck = true;
				m_RomanArrow.Stuck = true;
				m_RomanArrow.Alive = false;
			}
			// Game paused
			else 
			{
				// Release the game
				m_bPaused = false;
			}

			m_bRepaint = true;
		}
		
		private void ProcessAll()
		{
			// Get mouse position
			m_xMouse = this.PointToClient(Control.MousePosition).X;

			// Calculate the components new position
			m_Barbarian.Process();		
			m_Arrow.Process();
			m_RomanArrow.Process();
			m_Legion.Process();
		}

		private void DrawAll()
		{
			// Redraw all game components in the new position
			m_RomanArrow.Draw(m_gxOff);
			m_Arrow.Draw(m_gxOff);
			m_Barbarian.Draw(m_gxOff);
			m_Legion.Draw(m_gxOff);
			m_Score.Draw(m_gxOff);
		}

		public void Refresh(Rectangle rcDirty)
		{
			// Refresh components last position
			m_gxPhys.DrawImage(
				m_bmpOff,
				rcDirty.X,
				rcDirty.Y,
				rcDirty,
				GraphicsUnit.Pixel);
		}

		private void RefreshAll()
		{
			// Refresh the components
			Refresh(m_Barbarian.DirtyArea);
			Refresh(m_Arrow.DirtyArea);
			Refresh(m_RomanArrow.DirtyArea);
			Refresh(m_Legion.DirtyArea);
			Refresh(m_Score.DirtyArea);

			// Redraw everything
			if (m_bRepaint)
			{
				m_gxPhys.DrawImage(m_bmpOff, 0, 0);
				m_bRepaint = false;
			}
		}

		private void RestoreAll()
		{
			// Clean where the components were
			m_Barbarian.Restore();
			m_Arrow.Restore();
			m_RomanArrow.Restore();
			m_Legion.Restore();
			m_Score.Restore();
		}
		
		public void Lost()
		{
			// Game Over 
			// Reset score and level
			m_Score.Value=0;
			m_Score.Level=1;

			// Reset the Legion position
			m_Legion.Reset(m_Score.Level);
			
			// Not running
			m_bRunning = false;


			// Show splash image
			m_Status = Display.Splash;
		}

		public void Won()
		{
			// Game won

			// Increase the level
			m_Score.Level++;

			// Reset platoon position
			m_Legion.Reset(m_Score.Level);

			// Not running
			m_bRunning = false;

			// Show Won Image
			m_Status = Display.Won;

		}
	
		// Expose arrow so we can start it from the legion
		public Arrow RomanArrow
		{
			get
			{
				return(m_RomanArrow);
			}
		}

		// Expose the Barbarian to chech game over (hit on Barbarian)
		public Barbarian Barbarian
		{
			get
			{
				return(m_Barbarian);
			}
		}

		// Expose the Legion to check which roman where killed
		public Legion Legion
		{
			get
			{
				return(m_Legion);
			}
		}

		// Expose the Score so we can update it when the Romans where killed
		public Score Score
		{
			get
			{
				return(m_Score);
			}
		}

		// Graphics Offline
		public Graphics gxOff
		{
			get
			{
				return(m_gxOff);
			}
		}

		// Background BMP
		public Bitmap BackBmp
		{
			get
			{
				return(m_bmpTap[3]);
			}
		}


		public Size WorldBounds
		{
			get
			{
				return(new Size(m_cxPlay, m_cyPlay));
			}
		}
			
        // Expose the Mouse position to Barbarian get self updated
		public Point MouseLoc
		{
			get
			{
				return(new Point(m_xMouse, m_yMouse));
			}
		}
	
		protected override void OnMouseDown(MouseEventArgs mouseg)
		{
			switch(m_Status)
			{
				case Display.Game:
					if (m_bRunning)
					{
						m_Barbarian.Keyboard = false;

						// Pause the Game
						if (mouseg.Y < 10)
						{
							m_bRunning=false;
							m_bPaused=true;
						}
					}
					// Release the Game
					else
					{
						this.GameMainloop();
					}

					break;
			    // Start the game
				case Display.Splash:
				case Display.Won:
					m_Status = Display.Game;
					this.GameMainloop();
					break;
			}
		}

		protected override void OnMouseUp(MouseEventArgs mouseg)
		{
			switch(m_Status)
			{
				case Display.Game:
					if (m_bRunning)
					{
						// Launch the Arrow
						if (m_Arrow.Stuck == true)
						{
							m_Arrow.Start(
								m_Barbarian.m_x+m_Barbarian.m_cx/2,
								WorldBounds.Height-37,
								0,
								-5);
						}
					}
					break;
			}
		}

		protected override void OnMouseMove(MouseEventArgs mouseg)
		{
			// Update mouse position
			m_xMouse = mouseg.X;
			m_yMouse = mouseg.Y;
		}

		protected override void OnPaint(PaintEventArgs paintg)
		{
			Graphics gx;
		
			gx = paintg.Graphics;
		
			switch(m_Status)
			{
				case Display.Game:
					gx.DrawImage(m_bmpTap[3], 0, 0);
					m_bRepaint = true;
					break;
				case Display.Won:
					gx.DrawImage(m_bmpTap[1], 0, 0);
					break;
				case Display.Splash:
					gx.DrawImage(m_bmpTap[0], 0, 0);
					break;
			}
		}

		public void LoadBmp(string bmpName,int i)
		{
			// Try to Load the Bitmap
			try
			{
				m_bmpTap[i] = new Bitmap(m_strGamePath+bmpName);
			}

       		// Any error ? Create a bitmap 
			catch
			{
				m_bmpTap[i] = new Bitmap(this.Width, Height);
				Graphics.FromImage(
					m_bmpTap[i]).FillRectangle(new SolidBrush(this.BackColor),
						new Rectangle(0,
						0,
						Width - 1,
						Height - 1));
				Graphics.FromImage(
					m_bmpTap[i]).DrawLine(new Pen(Color.Red), 0, 0, Width - 1, Height - 1);
				Graphics.FromImage(
					m_bmpTap[i]).DrawLine(new Pen(Color.Red), Width - 1, 0, 0, Height - 1);
			}
		}
	
		protected override void OnClosing(CancelEventArgs cancelg)
		{
			// Close Game
			if (m_bRunning)
			{
				m_bRunning = false;
				cancelg.Cancel = true;
			}
		}
	
		protected override void OnClosed(EventArgs eventg)
		{
			m_bRunning = false;
		}
	
		protected override void OnKeyDown(KeyEventArgs keyg)
		{
			// Enable to use keyboard 
			switch(keyg.KeyData)
			{
				// Start going left
				case Keys.Left:
					m_Barbarian.GoLeft = true;
					break;
			
				// Start going right
				case Keys.Right:
					m_Barbarian.GoRight = true;
					break;
			}
		}

		private void InitializeComponent()
		{
			// 
			// GAME
			// 
			this.ClientSize = new System.Drawing.Size(234, 295);
			this.MaximizeBox = false;

		}
	
		protected override void OnKeyUp(KeyEventArgs keyg)
		{
			// Enable to use keyboard 
			switch(keyg.KeyData)
			{
				// Stop Going left
				case Keys.Left:
					m_Barbarian.GoLeft = false;
					break;
			
				// Stop going right
				case Keys.Right:
					m_Barbarian.GoRight = false;
					break;

				// Launch Arrow
				case Keys.Space:
					if (m_Arrow.Alive == false)
					{
						m_Arrow.Start(m_Barbarian.m_x+m_Barbarian.m_cx/2,WorldBounds.Height-37,0,-5);
					}
					break;

				// Pause game
				case Keys.P:
					m_bRunning=false;
					m_bPaused=true;
					break;
				// Start game
				case Keys.S:
					m_Arrow.Alive = false ;
					this.GameMainloop();
					break;
 			}
		}
	}

	// Run the Application
	class MAIN
	{
		public static void Main()
		{
			Application.Run(new GAME());
		}
	}
}