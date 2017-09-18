//------------------------------------------------------------------------------
//  <copyright from='1997' to='2002' company='Microsoft Corporation'>
//   Copyright (c) Microsoft Corporation. All Rights Reserved.
//
//   This source code is intended only as a supplement to Microsoft
//   Development Tools and/or on-line documentation.  See these other
//   materials for detailed information regarding Microsoft code samples.
//
//   </copyright>
//-------------------------------------------------------------------------------
//
// File: GameControl.cs
//

using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Windows.Forms;

#if NETCFDESIGNTIME
[assembly: System.CF.Design.RuntimeAssemblyAttribute("GameControl, Version=1.0, Culture=neutral, PublicKeyToken=null")]
#endif

namespace GameControl
{
	/// <summary>
	/// Summary description for UserControl1.
	/// </summary>
	public class GameBoard : System.Windows.Forms.Control
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private Pen m_BoardEdgePen;

		// how many squares do I have?
		private int m_iNumberOfSquaresOnBoard = 3;

		// store the board configuration
		private int[,] m_theBoard;

		public GameBoard()
		{
			//Create dummy data for design time
			m_data = new ArrayList();
			m_data.Add(new System.Drawing.Point(0, 80));
			m_data.Add(new System.Drawing.Point(1, 20));
			m_data.Add(new System.Drawing.Point(2, 0));
			m_data.Add(new System.Drawing.Point(3, 40));
			m_data.Add(new System.Drawing.Point(4, 25));

			m_BoardEdgePen = new System.Drawing.Pen(Color.FromArgb(0,0,0));

			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();

			InitializeTheBoard();

			// TODO: Add any initialization after the InitForm call
			this.Invalidate();
		}

		public void InitializeTheBoard()
		{
			m_theBoard = new int[m_iNumberOfSquaresOnBoard, m_iNumberOfSquaresOnBoard];
			for (int i=0 ; i < m_iNumberOfSquaresOnBoard ; i++)
				for (int j = 0; j < m_iNumberOfSquaresOnBoard ; j++)
					m_theBoard[i,j] = -1;
		}

#if NETCFDESIGNTIME
		[System.ComponentModel.Category("GameBoard")]
		[System.ComponentModel.DefaultValueAttribute(3)]
		[System.ComponentModel.Description("The number of squares in the GameBoard on any axis")]
#endif
		public int NumberOfSquares
		{
			get
			{
				return m_iNumberOfSquaresOnBoard;
			}
			set
			{
				m_iNumberOfSquaresOnBoard = value;
				InitializeTheBoard();
				this.Invalidate();
			}
		}

		//The designer will generate code to access the collection from the resx file.  We don't want that so we don't build the Data property
		//at design time
#if !NETCFDESIGNTIME
		public ICollection Data
		{
			get
			{
				return m_data;
			}
			set
			{
				m_data = new ArrayList(value);
				Rectangle rcClient = this.ClientRectangle;
				Rectangle rcBoardClient = new Rectangle(rcClient.X, rcClient.Y, rcClient.Width, rcClient.Height);
				this.Invalidate(rcBoardClient);
			}
		}
#endif

		private int m_GridSize = 1;
#if NETCFDESIGNTIME
		[System.ComponentModel.Category("GameBoard")]
		[System.ComponentModel.DefaultValueAttribute(true)]
		[System.ComponentModel.Description("Size of each grid on the board")]
#endif
		public int GridSize
		{
			get
			{
				return m_GridSize;
			}
			set
			{
			}
		}

		private bool m_showGrid = true;
#if NETCFDESIGNTIME
		[System.ComponentModel.Category("GameBoard")]
		[System.ComponentModel.DefaultValueAttribute(false)]
		[System.ComponentModel.Description("Indicates whether the grid should be drawn on the GameBoard.")]
#endif
		public bool ShowGrid
		{
			get
			{
				return m_showGrid;
			}
			set
			{
				m_showGrid = value;
				this.Invalidate();
			}
		}
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if( components != null )
					components.Dispose();
			}
			base.Dispose( disposing );
		}

		#region Component Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Paint += new System.Windows.Forms.PaintEventHandler(this.OnPaint);
		}
		#endregion

		private ArrayList m_data;

		protected override void OnResize(System.EventArgs e)
		{
			//this.ClientSize.Width = 10;
			//this.ClientSize.Height = 10;
			this.Invalidate();
		}

		private void OnPaint(object sender, System.Windows.Forms.PaintEventArgs e)
		{
			Rectangle rcClient = this.ClientRectangle;
			Rectangle rcBoardClient = new Rectangle(rcClient.X, rcClient.Y, rcClient.Width, rcClient.Height);

			//Check if graph is too small
			if ((rcBoardClient.Width < 20) || (rcBoardClient.Height < 20))
			{
				return;
			}

			// We need to draw a square. So figure out whether the width or
			// height is smaller, in order to correctly draw the square
			if(rcBoardClient.Width < rcBoardClient.Height)
				rcBoardClient.Height = rcBoardClient.Width;
			else
				rcBoardClient.Width = rcBoardClient.Height;

			// What is the width of each square?
			m_GridSize = (rcBoardClient.Width / m_iNumberOfSquaresOnBoard);

			// adjust the width and height so that it is an integral multiple of
			// the width of each square
			rcBoardClient.Width = m_GridSize * m_iNumberOfSquaresOnBoard;
			rcBoardClient.Height = rcBoardClient.Width;

			// Draw the board's edges
			for(int sourceX = rcBoardClient.X, destX = rcBoardClient.Width, sourceY = rcBoardClient.Y; sourceY <= rcBoardClient.Height ; sourceY += m_GridSize)
			{
				e.Graphics.DrawLine(m_BoardEdgePen, sourceX, sourceY, destX, sourceY);
			}

			for(int sourceX = rcBoardClient.X, sourceY = rcBoardClient.Y, destY = rcBoardClient.Height ; sourceX <= rcBoardClient.Width ; sourceX += m_GridSize)
			{
				e.Graphics.DrawLine(m_BoardEdgePen, sourceX, sourceY, sourceX, destY);
			}

			// now, draw the pieces
			for (int i=0 ; i < m_iNumberOfSquaresOnBoard ; i++)
				for (int j = 0; j < m_iNumberOfSquaresOnBoard ; j++)
					if(m_theBoard[i,j] != -1)
					{
						// compute the rectangle within which to draw
						Rectangle rc = new Rectangle((rcBoardClient.X + (i * m_GridSize)), (rcBoardClient.Y + (j * m_GridSize)), m_GridSize, m_GridSize);

						if(m_theBoard[i,j] == 1)
						{
							// draw my piece
							Brush myBrush = new System.Drawing.SolidBrush(Color.FromArgb(255, 0, 0));
							e.Graphics.FillEllipse(myBrush, rc);
						}
						else
						{
							// draw opponent's piece
							Pen opponentPen = new System.Drawing.Pen(Color.FromArgb(0, 0, 255));
							e.Graphics.DrawEllipse(opponentPen, rc);
						}
					}
		}

		// my pieces are represented as 1's on the
		// internal board representation
		public void DrawMyPiece(int X, int Y)
		{
			if((X < m_iNumberOfSquaresOnBoard) && (Y < m_iNumberOfSquaresOnBoard))
			{
				m_theBoard[X,Y] = 1;
				this.Invalidate();
			}
		}

		// undo my move - this might be called when the move could not be
		// transmitted to the opponent
		public void RemoveMyPiece(int X, int Y)
		{
			// make sure the coordinates are legal and that my piece is really
			// on the indicated square
			if( ((X < m_iNumberOfSquaresOnBoard) && (Y < m_iNumberOfSquaresOnBoard)) &&
				(m_theBoard[X,Y] == 1))
			{
				m_theBoard[X,Y] = -1;
				this.Invalidate();
			}
		}

		// opponent's pieces are represented as 0's on the
		// internal board representation
		public void DrawOpponentPiece(int X, int Y)
		{
			if((X < m_iNumberOfSquaresOnBoard) && (Y < m_iNumberOfSquaresOnBoard))
			{
				m_theBoard[X,Y] = 0;
				this.Invalidate();
			}
		}
	}
}
