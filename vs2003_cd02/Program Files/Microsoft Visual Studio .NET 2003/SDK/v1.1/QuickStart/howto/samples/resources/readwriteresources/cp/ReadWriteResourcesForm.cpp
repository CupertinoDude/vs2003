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

//
// ReadWriteResourcesForm.cpp  -  Implementation of the CreateResourcesForm class
//

#ifndef NULL
#define NULL 0
#endif

#include "ReadWriteResourcesForm.h"


namespace ResourcesSamples {

	ResourcesForm::ResourcesForm() {
		component = new System::ComponentModel::Container;
        InitializeComponent();
	}
	
	void ResourcesForm::InitializeComponent() {
		//
		// This code is equivalent to the properties embedded
		// in a corresponding ASPX implementation.
		//

		txtResFile = new TextBox;
		txtName = new TextBox;
		txtValue = new TextBox;
		txtFindName = new TextBox;

		btnMake = new Button;
		btnAdd = new Button;
		btnSave = new Button;
		btnFind = new Button;
		btnView = new Button;
		btnClear = new Button;

		lblResFile = new Label;
		lblAddEntry = new Label;
		lblAddName = new Label;
		lblAddValue = new Label;
		lblFindEntry = new Label;
		lblFindName = new Label;
		lblMessage = new Label;
		lbOutput = new ListBox;
		
		lblAbout = new LinkLabel;
		imgDemo = new PictureBox;

		Control* formControls[] = {txtResFile, txtName, txtValue, txtFindName, btnMake,
			btnAdd, btnSave, btnFind, btnView, btnClear, lblAddEntry, lblAddName,
			lblAddValue, lblFindEntry, lblFindName, lblMessage, lbOutput, lblAbout, imgDemo};

		SuspendLayout();
		
		// 
		// lblResFile
		// 
		lblResFile->Location = Point(8, 8);
		lblResFile->Size = System::Drawing::Size(216, 24);
		lblResFile->Text = S"The resources file to create (E.g. strings):";

		// 
		// lblAbout
		//
		lblAbout->Location = Point(480, 256);
		lblAbout->Size = System::Drawing::Size(104, 16);
		lblAbout->Text = S"About This Sample";
		lblAbout->TextAlign = ContentAlignment::MiddleRight;
		lblAbout->LinkClicked += new LinkLabelLinkClickedEventHandler( this, lblAbout_LinkClicked );
		lblAbout->Visible = true;

		// 
		// txtResFile
		// 
		txtResFile->Location = Point(320, 8);

		// 
		// btnMake
		// 
		btnMake->Location = Point(432, 8);
		btnMake->Size = System::Drawing::Size( 80, 23 );
		btnMake->Text = S"Make File";
		btnMake->Click += new EventHandler( this, btnMake_Click );
		
		// 
		// lblAddEntry
		// 
		lblAddEntry->Location = Point(8, 32);
		lblAddEntry->Size = System::Drawing::Size(80, 24);
		lblAddEntry->Text = S"Add New Entry";
		lblAddEntry->Visible = false;
		
		// 
		// lblAddName
		// 
		lblAddName->Location = Point(120, 32);
		lblAddName->Size = System::Drawing::Size(40, 23);
		lblAddName->Text = S"Name:";
		lblAddName->Visible = false;
		
		// 
		// txtName
		// 
		txtName->Location = Point(168, 32);
		txtName->Visible = false;
		
		// 
		// lblAddValue
		// 
		lblAddValue->Location = Point(280, 32);
		lblAddValue->Size = System::Drawing::Size(40, 23);
		lblAddValue->Text = S"Value:";
		lblAddValue->Visible = false;
		
		// 
		// txtValue
		// 
		txtValue->Location = Point(320, 32);
		txtValue->Visible = false;
		
		// 
		// btnAdd
		// 
		btnAdd->Location = Point(432, 32);
		btnAdd->Size = System::Drawing::Size( 80, 23 );
		btnAdd->Text = S"Add Entry";
		btnAdd->Click += new EventHandler( this, btnAdd_Click );
		btnAdd->Visible = false;
		
		// 
		// btnSave
		// 
		btnSave->Location = Point(512, 32);
		btnSave->Size = System::Drawing::Size( 80, 23 );
		btnSave->Text = S"Save File";
		btnSave->Click += new EventHandler( this, btnSave_Click );
		btnSave->Visible = false;
		
		// 
		// txtFindName
		// 
		txtFindName->Location = Point(168, 56);
		txtFindName->Visible = false;
		
		// 
		// lblFindName
		// 
		lblFindName->Location = Point(120, 56);
		lblFindName->Size = System::Drawing::Size(40, 23);
		lblFindName->Text = S"Name:";
		lblFindName->Visible = false;
		
		// 
		// lblFindEntry
		// 
		lblFindEntry->Location = Point(8, 56);
		lblFindEntry->Size = System::Drawing::Size(56, 24);
		lblFindEntry->Text = S"Find Entry";
		lblFindEntry->Visible = false;
		
		// 
		// btnFind
		// 
		btnFind->Location = Point(432, 56);
		btnFind->Size = System::Drawing::Size( 80, 23 );
		btnFind->Text = S"Find Entry";
		btnFind->Click += new EventHandler( this, btnFind_Click );
		btnFind->Visible = false;
		
		// 
		// btnClear
		// 
		btnClear->Location = Point(512, 80);
		btnClear->Size = System::Drawing::Size( 80, 23 );
		btnClear->Text = S"Clear";
		btnClear->Click += new EventHandler( this, btnClear_Click );
		btnClear->Visible = false;
		
		// 
		// btnView
		// 
		btnView->Location = Point(432, 80);
		btnView->Size = System::Drawing::Size( 80, 23 );
		btnView->Text = S"View Entries";
		btnView->Click += new EventHandler( this, btnView_Click );
		btnView->Visible = false;
		
		// 
		// lblMessage
		// 
		lblMessage->Location = Point(8, 120);
		lblMessage->Size = System::Drawing::Size(584, 40);
		lblMessage->Text = S"Enter a Resource Filename";
		
		// 
		// lbOutput
		// 
		lbOutput->Location = Point(8, 168);
		lbOutput->Size = System::Drawing::Size(269, 82);
		lbOutput->Visible = false;
		
		//
		// imgDemo
		//
		imgDemo->Location = Point( 312, 176 );
		imgDemo->Size = System::Drawing::Size( 280, 72 );

		//
		// this
		//
		AutoScaleBaseSize = System::Drawing::Size(5, 13);
		ClientSize = System::Drawing::Size(600, 277);
		Controls->AddRange( formControls );
		
		Text = S"Create Resources Sample";
		ResumeLayout(false);
		SuspendLayout();
	}

	void ResourcesForm::Dispose( bool disposing ) {
		if( disposing && component != NULL ) {
			component->Dispose();
		}
	
		Form::Dispose( disposing );
	}


	String* ResourcesForm::FindEntry( String* entry ) {
		return rm->GetString( entry );
	}

	String* ResourcesForm::MakeResourceFile( String* name ) {

		String* strRetVal = S"";
		try {
			rw = new ResourceWriter( String::Concat( name, S".resources" ) );
			rm = ResourceManager::CreateFileBasedResourceManager( name, S".", NULL );
		}
		catch (Exception* e) {
			MessageBox::Show( e->Message );
			strRetVal = String::Concat( S"There was an error creating the resource file", e->Message );
		}

		return strRetVal;
	}

	// The ASPX implementation of ReadResources is:
	//
	//String* ResourcesForm::ReadResources( String* name ) [] {
	//	String* temp = S"";
	//
	//	ResourceReader* rr = new ResourceReader( String::Concat( name, S".resources" ) );
	//
	//	IDictionaryEnumerator* resourceElement;
	//	resourceElement = rr->GetEnumerator();
	//
	//	while( !resourceElement->MoveNext() ) {
	//		temp = String::Concat( temp, resourceElement->Key, S":   ", resourceElement->Value, S"<br>" );
	//	}
	//
	//	rr->Close();
	//
	//	if( temp->Empty )
	//		return S"No entries are found in the resource file";
	//	else
	//		return String::Concat( S"<pre>", temp, S"</pre>" );
	//
	//}
	String* ResourcesForm::ReadResources( String* name ) [] {
		ArrayList* pResources = new ArrayList;
		ResourceReader* rr = new ResourceReader( String::Concat( name, S".resources" ) );
	
		IDictionaryEnumerator* resourceElement;
		resourceElement = rr->GetEnumerator();
	
		while( resourceElement->MoveNext() ) {
			pResources->Add( String::Concat( resourceElement->Key, S":   ", resourceElement->Value ) );
		}
	
		rr->Close();

		if( pResources->Count == 0 ) {
			pResources->Add( S"No entries are found in the resource file" );
		}
		
		return static_cast<String* __gc[]>(pResources->ToArray());
	}


	void ResourcesForm::btnFind_Click( Object* S, EventArgs* E ) {

		if (txtFindName->Text->Trim()->Equals( S"" ) ) {
			lblMessage->Text = S"Please ensure you enter a search value";
			lblMessage->ForeColor = Color::Red;
			lbOutput->Items->Clear();		// The ASPX implementation implements this line as lblOutput->Text = S""
		}
		else {
			String* temp = S"";

			temp = ResourcesForm::FindEntry(txtFindName->Text->Trim());

			try {
				//
				// The ASPX implementation implements the following line as
				// Bitmap* b = new Bitmap(temp);
				// imgDemo->Image->ImageUrl = temp;
				//
				imgDemo->Image = new Bitmap(temp);
				imgDemo->Visible = true;
			}
			catch (Exception*) {
				imgDemo->Visible = false;
			}

			lbOutput->Items->Clear();
			lbOutput->Visible = true;

			if (temp != S"") {
				//
				// The ASXP implementation implements this block as
				// lblOutput->Text = String::Concat(
				//	S"The following entry for the name '", txtFindName->Text->Trim(), S"' was found:<p>", temp );
				//
				lbOutput->Items->Add( String::Concat( S"The following entry for the name '", txtFindName->Text->Trim(), S"' was found:" ) );
				lbOutput->Items->Add( temp );
			}
			else {
				//
				// The ASXP implementation implements this block as
				// lblOutput->Text = String::Concat( S"No entry for the name '", txtFindName->Text->Trim(), S"' was found!" );
				//
				lbOutput->Items->Add( String::Concat( S"No entry for the name '", txtFindName->Text->Trim(), S"' was found!" ) );
			}

			lblMessage->Text = S"";
		}
	}

	void ResourcesForm::btnSave_Click( Object* S, EventArgs* E ) {
		rw->Generate();
		rw->Close();

		btnFind->Visible = true;
		btnView->Visible = true;
		lblFindEntry->Visible = true;
		lblFindName->Visible = true;
		txtFindName->Visible = true;

		lblAddName->Enabled = false;
		txtName->Enabled = false;
		lblAddValue->Enabled = false;
		txtValue->Enabled = false;
		btnAdd->Enabled = false;
		lblAddEntry->Enabled = false;
		btnSave->Enabled = false;
		btnClear->Visible = true;
		lbOutput->Items->Clear();  // The ASPX implementation implements this line as lblOutput->Text = S"";
		lblMessage->Text = S"Enter a value to find, or click the View button";

		//call the view event, just to populate the lbOutput
		btnView_Click(NULL, NULL);
	}

	void ResourcesForm::btnView_Click( Object* S, EventArgs* E ) {
		// The ASPX implementation implements the following three lines as:
		// lblOutput->Text = String::Concat( S"The following entries are in the resources file:<p>",
		// ResourcesForm::ReadResources(txtResFile->Text->Trim());

		lbOutput->Items->Clear();
		lbOutput->Visible = true;
		lbOutput->Items->Add( S"The following entries are in the resources file:" );
		lbOutput->Items->AddRange( ResourcesForm::ReadResources(txtResFile->Text->Trim()) );
		lblMessage->Text = S"";
		imgDemo->Visible = false;
	}

	void ResourcesForm::btnClear_Click( Object* S, EventArgs* E ) {
		btnClear->Visible = false;
		lbOutput->Visible = false;
		lblMessage->ForeColor = Color::Black;
		lblMessage->Text = S"Enter a Resource Filename";
		lbOutput->Items->Clear();	// Implemented as lblOutput->Text = S""; in the ASPX version.

		imgDemo->Visible = false;

		btnFind->Visible = false;
		btnView->Visible = false;
		lblFindEntry->Visible = false;
		lblFindName->Visible = false;
		txtFindName->Visible = false;

		lblAddName->Visible = false;
		txtName->Visible = false;
		lblAddValue->Visible = false;
		txtValue->Visible = false;
		btnAdd->Visible = false;
		lblAddEntry->Visible = false;
		btnSave->Visible = false;

		File::Delete(txtResFile->Text->Trim());

		btnMake->Enabled = true;
		txtResFile->Text = S"";
		txtResFile->Enabled = true;
	}

	void ResourcesForm::btnAdd_Click( Object* S, EventArgs* E ) {

		if (txtName->Text->Trim()->Equals( S"" ) || txtValue->Text->Trim()->Equals( "" ) ) {
			lblMessage->Text = S"Please ensure you enter a name, and a value";
			lblMessage->ForeColor = Color::Red;
			lbOutput->Items->Clear();	// Implemented as lblOutput->Text = S""; in the ASPX version.
		}
		else {
			try {
				lblMessage->Text = S"";

				ResourcesForm::rw->AddResource(txtName->Text->Trim(), txtValue->Text->Trim());
				lblMessage->Text = S"New String entry added successfully";
				lblMessage->ForeColor = Color::Black;
				lbOutput->Items->Clear();	// Implemented as lblOutput->Text = S""; in the ASPX version.
				btnSave->Enabled=true;
			}
			catch (Exception* e) {
				lblMessage->Text = String::Concat( S"The following error occurred adding the entry to the file:", e->Message );
				lblMessage->ForeColor = Color::Red;
				lbOutput->Items->Clear();	// Implemented as lblOutput->Text = S""; in the ASPX version.
			}
		}
	}

	void ResourcesForm::btnMake_Click( Object* S, EventArgs* E ) {
		if (txtResFile->Text->Trim() == S"") {
			lblMessage->ForeColor = Color::Red;
			lblMessage->Text = S"Please ensure you enter a filename";
			return;
		}

		String* temp;

		temp = ResourcesForm::MakeResourceFile(txtResFile->Text->Trim());

		if (!temp->Equals( S"" )) {
			lblMessage->ForeColor = Color::Red;
			lblMessage->Text = temp;
			return;
		}

		lblAddName->Visible = true;
		txtName->Visible = true;
		lblAddValue->Visible = true;
		txtValue->Visible = true;
		btnAdd->Visible = true;
		lblAddEntry->Visible = true;
		btnSave->Visible = true;

		lblAddName->Enabled = true;
		txtName->Enabled = true;
		lblAddValue->Enabled = true;
		txtValue->Enabled = true;
		btnAdd->Enabled = true;
		lblAddEntry->Enabled = true;
		btnSave->Enabled = false;

		txtName->Text = S"";
		txtValue->Text = S"";
		lbOutput->Items->Clear();	// Implemented as lblOutput->Text = S""; in the ASPX version.

		btnMake->Enabled = false;
		txtResFile->Enabled = false;

		lblMessage->ForeColor = Color::Black;
		lblMessage->Text = S"Enter a name-value pair to add to the file. When finished, click Save";
	}

	void ResourcesForm::lblAbout_LinkClicked( Object* S, LinkLabelLinkClickedEventArgs* E ) {
		MessageBox::Show( S"The following example demonstrates reading and writing resource files through code. This demonstration uses objects from the Resources namespace ResourceManager, ResourceWriter, and ResourceReader. In this sample, you can specify name and value pairs to add to an arbitrary resource file, which you can subsequently retrieve particular entries from, and parse all entries using the ResourceReader.\nIn this demonstration, you can enter the fully qualified path to an image file for the value, and when you click Find Entry, the image will be displayed on the page. This is a small demonstration of how you can quickly display stored graphics back to the user. Do not confuse this particular demonstration with actually saving objects into a resources file, which is also useful, but not part of this demonstration.", S"About This Sample", MessageBoxButtons::OK, MessageBoxIcon::Information );
	}
}