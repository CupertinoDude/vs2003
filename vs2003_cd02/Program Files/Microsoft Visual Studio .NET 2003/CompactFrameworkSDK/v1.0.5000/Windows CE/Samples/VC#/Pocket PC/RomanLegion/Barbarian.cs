/*=====================================================================
  File:      Barbarian.cs

  
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
	public class Barbarian : BaseObj
	{
		private const int m_kdxKeyboardMax = 5;

		private bool m_bGoLeft;
		private bool m_bGoRight;
		private bool m_bKeyboard;

		public Barbarian(GAME game) : base(game)
		{
			//Barbarian Always Alive
			m_bAlive=true;
		
			// Bmp Size
			m_cx=14;
			m_cy=10;
	
			// Start Position
			m_x = m_cxSpace / 2;
			m_y = m_game.WorldBounds.Height - m_cy - 20;
			m_xOld = m_x;
			m_yOld = m_y;

			// Load Bmp
			m_bmpOff = new Bitmap[1];
			m_mattr = new ImageAttributes[1];
			Load("Barbarian.bmp",0);
		}

		public void Process()
		{
			Point ptMouse;
			m_xOld = m_x;

			// If input is from Keyboard
			if (m_bKeyboard)
			{
				if (m_bGoLeft)
					m_x -=m_kdxKeyboardMax;
				else if (m_bGoRight)
					m_x +=m_kdxKeyboardMax;
			}
			// If the mouse move
			else
			{
				ptMouse = m_game.MouseLoc;
				m_x=ptMouse.X - (m_cx / 2);
			}

			// Limit the Barbarian position to the window
			if (m_x < 0)
				m_x = 0;
			else if (m_x + m_cx >= m_cxSpace)
				m_x = m_cxSpace - m_cx;
		}
	
		// Set the Barbarian to move left
		public bool GoLeft
		{
			set
			{
				m_bKeyboard = true;
				m_bGoLeft = value;
			}
		}
	
		// set the Barbarian to move right
		public bool GoRight
		{
			set
			{
				m_bKeyboard = true;
				m_bGoRight = value;
			}
		}

		public bool Keyboard
		{
			set
			{
				m_bKeyboard = false;
			}
		}
			
		public bool bCollide(Arrow Arrow)
		{
			bool bCollide=false;
			// Check if the Arrow hits the Barbarian 
			if (this.Bounds.IntersectsWith(Arrow.Bounds))
			{
				bCollide = true;
			}
			return(bCollide);
		}
	}
}
