#pragma once

//
// ReadWriteResourcesForm.h  -  Defines the interface to the class ResourcesForm
//

#using <mscorlib.dll>
#using <system.dll>
#using <system.drawing.dll>
#using <system.windows.forms.dll>

using namespace System;
using namespace System::IO;
using namespace System::Collections;
using namespace System::Resources;
using namespace System::Drawing;
using namespace System::Windows::Forms;


namespace ResourcesSamples {

	public __gc class ResourcesForm : public Form {
	public:

		ResourcesForm();

	private:

		TextBox*	txtResFile;
		TextBox*	txtName;
		TextBox*	txtValue;
		TextBox*	txtFindName;

		Button*		btnMake;
		Button*		btnAdd;
		Button*		btnSave;
		Button*		btnFind;
		Button*		btnView;
		Button*		btnClear;

		Label*		lblResFile;
		Label*		lblAddEntry;
		Label*		lblAddName;
		Label*		lblAddValue;
		Label*		lblFindEntry;
		Label*		lblFindName;
		Label*		lblMessage;

		// The ASPX implementation defines lbOutput as a Label class.
		// lblOutput on the ASPX page can hold a variable amount of lines
		// of text.  Hence we choose a ListBox since we need to emulate the
		// scrollable properties of a web page.
		ListBox*	lbOutput;		

		// This ASPX implementation does not define a LinkLabel object.  This
		// object is used to display information about the sample.
		LinkLabel*	lblAbout;

		// The ASPX implementation defines imgDemo as a
		// System::Web::UI::WebControls::Image class.
		PictureBox*		imgDemo;
		System::ComponentModel::Container* component;

		static ResourceWriter* rw;

		//
		// Form's component initialization routine
		//
		void InitializeComponent();

		//
		// Resource manipulation routines.
		//
		static String* FindEntry( String* entry );
		static String* MakeResourceFile( String* name );
		
		// The ASPX implementation defines ReadResources to return a String*.
		// This implementation returns a String*[] to facilitate the population
		// of lbOutput.
		static String* ReadResources( String* name ) [];



	protected:

		static ResourceManager* rm;

		//
		// Form's clean-up routine.
		//
		void Dispose( bool disposing );

		//
		// Button Find's OnClick Event Handler
		//
        void btnFind_Click( Object* S, EventArgs* E );

		//
		// Button Save's OnClick Event Handler
		//
		void btnSave_Click( Object* S, EventArgs* E );

		//
		// Button View's OnClick Event Handler
		//
		void btnView_Click( Object* S, EventArgs* E );

		//
		// Button Clear's OnClick Event Handler
		//
		void btnClear_Click( Object* S, EventArgs* E );

		//
		// Button Add's OnClick Event Handler
		//
		void btnAdd_Click( Object* S, EventArgs* E );

		//
		// Button Make's OnClick Event Handler
		//
		void btnMake_Click( Object* S, EventArgs* E );

		//
		// LinkLabel About's OnClick Event Handler
		//
		void lblAbout_LinkClicked( Object* S, LinkLabelLinkClickedEventArgs* E );
	};
}
