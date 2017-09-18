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
using namespace System::Drawing;
using namespace System::Windows::Forms;
using namespace System::Threading ;
using namespace System::ComponentModel;

__gc class ThreadMarshal : public Form
{
private:
	IContainer* components;
	Button* button1 ;
	Button* button2;
	ProgressBar* progressbar ;

	Thread* timerThread ;



	//This function is executed on a background thread - it marshalls calls to 
	//update the UI back to the foreground thread
	void ThreadProc()
	{
		try
		{
			MethodInvoker* mi = new MethodInvoker(this, &ThreadMarshal::UpdateProgress) ;
			while(1)
			{
				//Call BeginInvoke on the form
				this->BeginInvoke(mi);
				Thread::Sleep(500) ;
			}
		}
		catch(System::Exception* e)
		{
			//Exit
		}
	}

	//This function is called from a background thread
	void UpdateProgress()
	{
		//Reset to start if required
		if(progressbar->Value == progressbar->Maximum)
		{
			progressbar->Value = progressbar->Minimum ;
		}
		progressbar->PerformStep();
	}

	void StopThread()
	{
		if(timerThread)
		{
			timerThread->Interrupt();
			timerThread = 0x0 ;
		}
	}

	void button1_click(System::Object* sender, System::EventArgs* e)
	{
		StopThread();
		timerThread = new Thread(new ThreadStart(this, &ThreadMarshal::ThreadProc));
		timerThread->IsBackground = true ;
		timerThread->Start() ;
	}
	void button2_click(System::Object* sender, System::EventArgs* e)
	{
		StopThread();
	}
public:
	ThreadMarshal()
	{
		InitializeForm();
	}
	~ThreadMarshal()
	{
		StopThread();
		this->Dispose() ;
		components->Dispose();
	}
	void InitializeForm()
	{
		this->components = new System::ComponentModel::Container();
		this->button1 = new Button();
		this->button2 = new Button();
		this->progressbar = new ProgressBar();
		this->button1->TabIndex = 1;
		this->button1->Text = S"Start!" ;
		this->button1->add_Click(new EventHandler(this, &ThreadMarshal::button1_click));
		this->button1->Location = Point(128,64);

		this->button2->Text = S"Stop!";
		this->button2->TabIndex = 1 ;
		this->button2->add_Click(new EventHandler(this, &ThreadMarshal::button2_click));
		this->button2->Location= Point(256,64);

		this->progressbar->TabIndex =2;
		this->progressbar->Text = S"Start!";
		this->progressbar->Location = Point(10,10);
		this->progressbar->Size = Drawing::Size(350,40);
		this->AutoScaleBaseSize = Drawing::Size(5,13);
		this->ClientSize = Drawing::Size(392,117);

		this->Controls->Add(this->progressbar);
		this->Controls->Add(this->button1);
		this->Controls->Add(this->button2);

			

	}


};

// This is the entry point for this application
#ifdef _UNICODE
int wmain(void)
#else
int main(void)
#endif
{

	Application::Run(new ThreadMarshal());
	return 0;
}
