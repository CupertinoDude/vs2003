/*=====================================================================
  File:      Roman.cs

  
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
	public class Roman : BaseObj
	{
		public Roman(GAME game, int yTop, int row, int col) : base(game)
		{
			// Bmp Size
			m_cx=16;
			m_cy=20;
	
			// Load Roman Bmps 
			m_bmpOff = new Bitmap[2]; 
			m_mattr = new ImageAttributes[2];
			Load("RomanA"+row+".bmp",0);
			Load("RomanB"+row+".bmp",1);

			// Reset Roman Position and turn it alive
			Reset(yTop,row,col);
		}

		public void Process(int dx,int dy)
		{
			m_xOld = m_x;
			m_yOld = m_y;
			// Move
			m_x += dx;
			m_y += dy;
		}

		public void Reset(int yTop,int row, int col)
		{
			// Turn the Roman on
			this.m_bAlive=true;

			// Reset the position
			m_x = (m_cx*2) * col;
			m_y = yTop + (row * m_cy); 
		}
	}
}
