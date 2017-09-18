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

__gc class ErrorHandler : public Form
{
private: 
	System::ComponentModel::IContainer* components ;
	Button* button ;

public:
	ErrorHandler()
	{
		InitializeForm() ;
	}
	~ErrorHandler()
	{
		this->Dispose();
		components->Dispose() ;
	}

	void InitializeForm()
	{
		this->components = new System::ComponentModel::Container();

		this->button = new Button();
		button->Text = S"Click me!" ;

		button->add_Click(new EventHandler(this, &ErrorHandler::button1_click)) ;

		this->Controls->Add(button) ;
		this->Text = S"Exception Handling Sample" ;

	}
	void button1_click(System::Object* sender, System::EventArgs* e)
	{
		throw new ArgumentException(S"The parameter was invalid") ;
	}
};

__gc class CustomExceptionHandler
{
private:
	DialogResult ShowThreadExceptionDialog(System::Exception* e)
	{
		System::String* errorMsg = S"An error occurred please contact the adminstrator with the following information:\n\n" ;
	
		errorMsg = System::String::Concat(errorMsg, e->Message);
		errorMsg = System::String::Concat(errorMsg, S"\nStack Trace: \n\n");
		errorMsg = System::String::Concat(errorMsg, e->StackTrace);
			
		return MessageBox::Show(errorMsg, "Application Error", MessageBoxButtons::AbortRetryIgnore, MessageBoxIcon::Stop);
	}

public:
	void OnThreadException(System::Object* sender, System::Threading::ThreadExceptionEventArgs* t)
	{
		DialogResult result = DialogResult::Cancel ;
		try
		{
			result = this->ShowThreadExceptionDialog(t->Exception);
		}
		catch(System::Exception* e)
		{
			
			MessageBox::Show("Fatal Error", "Fatal Error", MessageBoxButtons::AbortRetryIgnore, MessageBoxIcon::Stop) ;
	
			Application::Exit();
			
		}

		if(result == DialogResult::Abort)
		{
			Application::Exit();
		
		}
	}

};

// This is the entry point for this application
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{
	
	CustomExceptionHandler* eh = new CustomExceptionHandler();
	
	ErrorHandler* errorhandler = new ErrorHandler();
	Application::add_ThreadException(new System::Threading::ThreadExceptionEventHandler(eh, &CustomExceptionHandler::OnThreadException ));


	Application::Run(errorhandler) ;
	
	return 0;
}