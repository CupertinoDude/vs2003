/*=====================================================================
  File:      Legion.cs

  
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
	public class Legion
	{
		// The Game
		private GAME m_game;

		// Which Roman's image is to draw
		private int m_Side=0;

		// Legion Maximum Top position
		private int m_yTop;
	
		// Column number 
		private int m_cols = 6;
		// Row number 
		private int m_rows = 6;

		// Left speed
		private int m_dx = 1;
		// Down speed
		private int m_dy = 0;
	
		// Total Romans number in the legion
		private int m_cRomanMax;

		// Array of Romans
		private Roman[] m_rgRoman;

		// Bounding Box for the Legion
		Rectangle m_BoundBox;

		public Legion(GAME game)
		{
			int row;
			int col;

			// Roman adding
			Roman RomanNew;
			
			m_game = game;

			// Set the number of Romans
			m_cRomanMax = m_cols * m_rows;
			m_yTop = 50;
	
			// Create Romans
			m_rgRoman = new Roman[m_cRomanMax];
			for (row = 0; row < m_rows; row++)
			{
				for (col = 0; col < m_cols; col++)
				{
					RomanNew = new Roman(m_game,m_yTop,row,col);
					m_rgRoman[row * m_cols + col] = RomanNew;
				}		
			}
		}

		public void Process()
		{
			m_dy=0;

			// Check walls

			// If reach the right wall
			if (m_BoundBox.Left+m_dx<0)
			{
				m_dx = Math.Abs(m_dx);
				m_dy = 10;
			}

			// If reach the left wall
			if (m_BoundBox.Right+m_dx >= m_game.WorldBounds.Width)
			{
				m_dx = -Math.Abs(m_dx);
				m_dy = 10;
			}

			// If the Legion reach the Barbarian
			if (m_BoundBox.Bottom >= m_game.Barbarian.Bounds.Top)
			{
				m_game.Lost();
			}

			// Process all Romans alive
			int iLastRoman=-1;
			for (int iRoman = 0; iRoman < m_cRomanMax; iRoman++)
			{
				if (true == m_rgRoman[iRoman].Alive )
				{
					m_rgRoman[iRoman].Process(m_dx,m_dy);
					iLastRoman=iRoman;
				}
			}
			
			// The last Roman launch the Arrow
			if (!m_game.RomanArrow.Alive && iLastRoman>=0)
			{
				m_game.RomanArrow.Start(
					m_rgRoman[iLastRoman].m_x+m_rgRoman[iLastRoman].m_cx/2,
					m_rgRoman[iLastRoman].m_y+m_rgRoman[iLastRoman].m_cy,
					0,
					5);
			}
		}

		public void Draw(Graphics gx)
		{
			// Try to draw all Romans
			for (int iRoman = 0; iRoman < m_cRomanMax; iRoman++)
			{
				m_rgRoman[iRoman].m_ActiveImage=m_Side;
				m_rgRoman[iRoman].Draw(gx);
			}

			// Switch the Romans Bitmap
			if (m_Side==0)
			{
				m_Side=1;
			}
			else
			{
				m_Side=0;
			}
		}

		public Rectangle DirtyArea
		{
			// Return the Bounding Box as the Dirty area
			get
			{
				Rectangle rc;
				rc=m_BoundBox;
				if (m_dx>0)
				{
					rc.Width+=m_dx;
				}
				else
				{
					rc.Width-=m_dx;
					rc.X+=m_dx;
				}
				return(rc);
			}
		}

		public void Restore()
		{
			// All Romans killed ?
			bool bwon =true;

			// Is the first
			bool first=true;

			// all Romans
			for (int iRoman = 0; iRoman < m_cRomanMax; iRoman++)
			{
				// If Roman not dead
				if (m_rgRoman[iRoman].Alive)
				{
					// If is the first Roman init the Bound box as him
					if (first)
					{
						m_BoundBox = m_rgRoman[iRoman].DirtyArea;
						first=false;
					}
					// Add the Roman to the Bound Box
					else
					{
						m_BoundBox=Rectangle.Union(m_BoundBox,m_rgRoman[iRoman].DirtyArea);
					}
					bwon=false;
					// Restore the backgroud of the Roman
					m_rgRoman[iRoman].Restore();
				}
			}
			// If no Romans alive, the level is finished
			if (bwon)
			{
				m_game.Won();	
			}
		}

		public void Reset(int Level)
		{
			// increase the Legion speed
			m_dx=Level;
			
			// Reset All Legion
			m_BoundBox = m_rgRoman[0].DirtyArea;
			for (int iRoman = 0; iRoman < m_cRomanMax; iRoman++)
			{
				m_rgRoman[iRoman].Reset(m_yTop,(int)iRoman/m_cols,iRoman%m_cols);
				m_BoundBox=Rectangle.Union(m_BoundBox,m_rgRoman[iRoman].DirtyArea);
			}
		}

		public bool KillRomanFromXY(int x, int y)
		{
			bool bHit = false;
		
			// check all Romans
			for (int iRoman = 0; iRoman < m_cRomanMax; iRoman++)
			{
				// If the Roman is Alive
				if (true == m_rgRoman[iRoman].Alive )
				{
					// If tha Arrow hit the Roman
					if (m_rgRoman[iRoman].Bounds.Contains(x,y)) 
					{
						bHit=true;
						// Disable the Roman
						m_rgRoman[iRoman].Alive = false;

						// Increase the Score
						m_game.Score.Value+=10*(6-(iRoman/m_cols));
						break;
					}
				}
			}
			return(bHit);
		}
	}
}
