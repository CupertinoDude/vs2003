/*=====================================================================
  File:      Score.cs

  
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
	public class Score : BaseObj
	{
		// Score Font
		Font m_drawFont;
		SolidBrush m_drawBrush;
		int m_Score;
		int m_Level;

		public Score(GAME game) : base(game)
		{
			// Score Font
			m_drawFont = new Font("Arial", 16,System.Drawing.FontStyle.Bold);

			// Font Color
			m_drawBrush = new SolidBrush(Color.BlueViolet);

			// Create rectangle for drawing.
			m_x = 0;
			m_y = 0;
				
			m_xOld = m_x;
			m_yOld = m_y;
			m_Score = 0;
			m_Level=1;
			m_bAlive=true;
			m_cx = 240;
			m_cy = 50;
		}

		public void Process()
		{
		}

		new public void Draw(Graphics gx)
		{
			// Write the Score
			string Score="Score: "+m_Score+" Level: "+m_Level;
			gx.DrawString(Score, m_drawFont, m_drawBrush,5.0F,10.0F);
		}

		// Expose the Score
		public int Value
		{
			get
			{
				return(m_Score);
			}
			set
			{
				m_Score = value;
			}
		}
		// Expose the Level
		public int Level
		{
			get
			{
				return(m_Level);
			}
			set
			{
				m_Level = value;
			}
		}
	}
}
