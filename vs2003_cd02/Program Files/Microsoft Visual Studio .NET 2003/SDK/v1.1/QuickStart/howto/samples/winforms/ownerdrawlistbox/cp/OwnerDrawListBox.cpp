//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

// This is the main project file for VC++ application project 
// generated using an Application Wizard.

#include "stdafx.h"

#using <mscorlib.dll>
#using <System.Windows.Forms.dll>
#using <System.dll>
#using <System.Drawing.dll>


using namespace System;
using namespace System::Windows::Forms ;

 __gc class OwnerDrawnListBox : public System::Windows::Forms::Form
	{
	private:

		System::Windows::Forms::ListBox* m_listBox1 ;
		System::Windows::Forms::Control* rControls[] ;
		 System::Drawing::Brush* listBoxBrushes __gc[] ;
		 System::Object* ListBoxRanges __gc[] ;
		System::Windows::Forms::Control* controls __gc[];

		static int listBoxHeights __gc[] = {50,25,33,15};

		System::ComponentModel::IContainer* components ;
	public:
		
		//Public constructor
		OwnerDrawnListBox()
			{
				InitForm() ;


				System::Drawing::Image* m_image = new System::Drawing::Bitmap(S"colorbars.jpg") ;
				System::Drawing::Brush* m_brush = new System::Drawing::TextureBrush(m_image) ;
				System::Drawing::Rectangle r(0,0,m_listBox1->Width, 100) ;
				System::Drawing::Drawing2D::LinearGradientBrush *lb = new System::Drawing::Drawing2D::LinearGradientBrush(r , System::Drawing::Color::Red, System::Drawing::Color::Yellow, System::Drawing::Drawing2D::LinearGradientMode::Horizontal) ;
				
				listBoxBrushes = new System::Drawing::Brush* __gc[4];
				listBoxBrushes[0] = m_brush;
				listBoxBrushes[1] = Drawing::Brushes::LemonChiffon;
				listBoxBrushes[2] = lb;
				listBoxBrushes[3] = Drawing::Brushes::PeachPuff ;
				


			}
			~OwnerDrawnListBox()
			{
				this->Dispose() ;
				components->Dispose() ;
			}

		 void listBox1_DrawItem(System::Object* sender, System::Windows::Forms::DrawItemEventArgs* args)
			{
			   // The following method should generally be called before drawing.
			   // It is actually superfluous here, since the subsequent drawing
			   // will completely cover the area of interest.

				args->DrawBackground() ;
				
				System::Drawing::Brush* brush = listBoxBrushes[args->Index] ;
				args->Graphics->FillRectangle(brush, args->Bounds) ;
				args->Graphics->DrawRectangle(System::Drawing::SystemPens::WindowText, args->Bounds) ;
				
				

				bool selected = ((args->State & System::Windows::Forms::DrawItemState::Selected) == System::Windows::Forms::DrawItemState::Selected)?true : false ;
			
				System::String* displayText = new System::String(S"Item #") ;

				displayText = System::String::Concat(displayText, args->Index.ToString());


				displayText = System::String::Concat(displayText, (selected ? S"SELECTED": "")) ;
					args->Graphics->DrawString(displayText, this->Font, System::Drawing::Brushes::Black, System::Drawing::RectangleF::op_Implicit(args->Bounds));


				args->DrawFocusRectangle() ;

			}

		//Return the height of the item to be drawn
		void listBox1_MeasureItem(	System::Object* sender, System::Windows::Forms::MeasureItemEventArgs* args)
			{
			System::String* displayText = new System::String(S"Item #") ;
			displayText = System::String::Concat(displayText, args->Index.ToString());
			//Get Width and height of string

			System::Drawing::SizeF stringSize = args->Graphics->MeasureString(displayText, this->Font);

			//Account for top margin
			stringSize.Height = stringSize.Height + 6 ;


			//Now set height to taller of default and text height
			if(listBoxHeights[args->Index] > stringSize.Height)
				{
					args->ItemHeight = listBoxHeights[args->Index] ;

				}
			else
				{
					args->ItemHeight = (int) stringSize.Height ;
				}
			

			}

		void InitForm()
			{

				
				ListBoxRanges = new System::Object* __gc[3];
				ListBoxRanges[0] = S"First";
				ListBoxRanges[1] = S"Second";
				ListBoxRanges[2] = S"Third";
				

				this->components = new System::ComponentModel::Container() ;
				m_listBox1 = new System::Windows::Forms::ListBox() ;
				m_listBox1->ColumnWidth = 144 ;
				m_listBox1->IntegralHeight = false ;
				m_listBox1->TabIndex = 0;
				m_listBox1->Text = S"ListBox";
				m_listBox1->Items->Add(new System::String(S"Bar"));
				m_listBox1->ClientSize = System::Drawing::Size(248, 248);
				m_listBox1->UseTabStops = true ;


				m_listBox1->Items->AddRange(ListBoxRanges) ;



				// Add event handlers for MeasureItem and Draw item
				m_listBox1->add_DrawItem(new System::Windows::Forms::DrawItemEventHandler(this, &OwnerDrawnListBox::listBox1_DrawItem)) ;
				m_listBox1->add_MeasureItem(new System::Windows::Forms::MeasureItemEventHandler(this, &OwnerDrawnListBox::listBox1_MeasureItem));
				m_listBox1->DrawMode = System::Windows::Forms::DrawMode::OwnerDrawVariable ;

				this->ClientSize = Drawing::Size(248,248);
				this->Text = S"ListBox";
				// Add the control to the form

				 controls = new System::Windows::Forms::Control* __gc[4];
				controls[0] = m_listBox1;
				this->Controls->AddRange(controls) ;
				
				

			}



	};



// This is the entry point for this application
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{
	Application::Run(new OwnerDrawnListBox());
	return 0;
}
