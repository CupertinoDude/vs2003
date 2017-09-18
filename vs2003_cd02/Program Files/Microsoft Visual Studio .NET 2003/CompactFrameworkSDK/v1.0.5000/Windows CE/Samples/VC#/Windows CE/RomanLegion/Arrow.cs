/*=====================================================================
  File:      Arrow.cs

  
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
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Reflection;
using System.Threading;
using System.ComponentModel;


namespace RomanLegion
{
	/// <summary>
	/// This Class handdles the Barbarian arrow and the Romans arrows
	/// </summary>
	public class Arrow: BaseObj
	{
		
		public bool m_bStuck;

		public Arrow(GAME game) : base(game)
		{
			m_cx= 3;
			m_cy= 10;
			
			// Position the arrow
			Start(m_cxSpace / 2,m_cySpace - 30,0,-5);

			// Load bitmap
			m_bmpOff = new Bitmap[2];
			m_mattr = new ImageAttributes[2];
			Load("Arrow.bmp",0);
			Load("Arrow1.bmp",1);
		}

		public void Process()
		{
			m_xOld = m_x;
			m_yOld = m_y;

			// Arrow ready to be launched
			if (m_bStuck)
			{
				m_x = m_game.Barbarian.Bounds.Left + m_game.Barbarian.Bounds.Width/ 2 - m_cx / 2;
				m_y = m_game.Barbarian.Bounds.Top - m_cy;
			}
			// Arrow moving
			else
			{
				// Move it
				m_y += m_dy;

				// check if any Roman were killed
				if (m_game.Legion.KillRomanFromXY(m_x, m_y))
				{
					// Stop the arrow
					Stop();
				}
			
				// Arrow reach top of the window
				if (m_y < 50)
				{
					//Stop the arrow
					Stop();
				}

				// Arrow reach the bottom of the window
				if (m_y > m_cySpace)
				{
					this.Alive=false;
					this.Stuck=true;
				}

				// Check if hit the Barbarian
				if (m_game.Barbarian.bCollide(this))
				{
					// If the Arrow hit the Barbarian , game over
					m_game.Lost();
				}
			}
		}

		// Can Launch Arrow ?
		public bool Stuck
		{
			get
			{
				return(m_bStuck);
			}
			set
			{
				m_bStuck = value;
			}
		}

		public void Start(int x,int y, int dx, int dy)
		{
			// release the arrow
			m_bStuck=false;
			m_bAlive=true;

			// Arrow initial position
			m_xOld = m_x;
			m_yOld = m_y;
			m_x = x-m_cx/2;
			m_y = y;

			m_dx = dx;

			// Arrow up
			if (dy < 0) 
			{
				m_ActiveImage=0;
			}
				// Arrow down
			else   
			{
				m_ActiveImage=1;
			}

			// Arrow direction
			m_dy = dy;
		}

		public void Stop()
		{
			// Disable the arrow
			m_bStuck=true;
			m_dx = 0;
			m_dy = 0;
		}
	}
}
