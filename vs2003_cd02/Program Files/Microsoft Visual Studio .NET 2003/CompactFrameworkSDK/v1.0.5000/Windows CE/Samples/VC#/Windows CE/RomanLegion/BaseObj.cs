/*=====================================================================
  File:      BaseObj.cs

  
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
	public class BaseObj
	{
		// Image index to draw
		public int m_ActiveImage=0;

		// Object's Left
		public int m_x;
		// Object's Top
		public int m_y;
	
		// Object's Left before move
		public int m_xOld;
		// Object's Top before move
		public int m_yOld;
	
		// Object's Speed to right 
		public int m_dx;
		// Object's Speed to down
		public int m_dy;

		// Object's Width 
		public int m_cx;
		// Object's Height
		public int m_cy;
	
		// Max x Position
		public int m_cxSpace;
		// Max y Position
		public int m_cySpace;
	
		// Current game
		public GAME m_game;
	
		// is to draw ?
		public bool m_bAlive;

		// Object Bitmap
		public Bitmap[] m_bmpOff;
		
		// Object Attributes (which color range is transparent ?)
		public ImageAttributes[] m_mattr;

		public BaseObj(GAME game)
		{
			m_game = game;

			m_cxSpace = m_game.WorldBounds.Width;
			m_cySpace = m_game.WorldBounds.Height;

			m_xOld = 0;
			m_yOld = 0;
		}

        public void Draw(Graphics gx)
		{
			// if is to draw
			if (m_bAlive)
			{
				gx.DrawImage( 
					m_bmpOff[m_ActiveImage],
					new Rectangle(m_x, m_y, m_cx , m_cy),
					0,
					0,
					m_cx,
					m_cy,
                    GraphicsUnit.Pixel,
					m_mattr[m_ActiveImage]);
			}
		}

		public void Load(string bmpName,int ibmp)
		{
			try
			{
				// Load BMP from file
				m_bmpOff[ibmp] = new Bitmap(m_game.m_strGamePath+bmpName);
				m_cx=m_bmpOff[ibmp].Width;
				m_cy=m_bmpOff[ibmp].Height;
			}
			catch
			{
				// Any error reading the BMP, create a dummy one
				m_bmpOff[ibmp] = new Bitmap(m_cx, m_cy);
				Graphics.FromImage(m_bmpOff[ibmp]).FillEllipse(new SolidBrush(Color.White), new Rectangle(0, 0, m_cx - 1, m_cy - 1));
			}

			// Get the color of a background pixel as the Pixel 0,0 
			Color TranpColor = m_bmpOff[ibmp].GetPixel(0,0);
			
			// Set the Attributes for the Transparent color
			m_mattr[ibmp] = new ImageAttributes();
			m_mattr[ibmp].SetColorKey(TranpColor, TranpColor);
		}

		public void Restore()
		{
			// Restore the Game Background
			m_game.gxOff.DrawImage(
				m_game.BackBmp,
				m_x,
				m_y,
				new Rectangle(m_x, m_y, m_cx , m_cy),
				GraphicsUnit.Pixel);
		}

		public Rectangle Bounds
		{
			get
			{
				return(new Rectangle(m_x, m_y, m_cx, m_cy));
			}
		}

		public Rectangle DirtyArea
		{
			get
			{
				return(Rectangle.Union(new Rectangle(m_x, m_y, m_cx, m_cy), new Rectangle(m_xOld, m_yOld, m_cx, m_cy)));
			}
		}

		// Expose object Draw property
		public bool Alive
		{
			get
			{
				return(m_bAlive);
			}
			set
			{
				m_bAlive = value;
			}
		}
	}
}
