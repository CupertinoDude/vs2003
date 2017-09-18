/*
 * Microsoft .Net CountDown
 * Copyright (c) Microsoft Corporation  All rights reserved.
 *
 * This is the main file of the assembly.
 * It defines the assembly and contains the entrypoint.
 * This file declares the classes
 *	- CountDown
 *	- DountDownForm
 * This files declares the enumeration
 *	- ErrorCodes
 *
 */

/********************************************/
/*       Information about the assembly     */
/********************************************/

/* Reference mscorlib first */
.assembly extern mscorlib {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  // may also add hash value and version
  .ver 1:0:3300:0
}

/* The assembly declaration. */
.assembly CountDown {
	.hash algorithm 32772	// selected algorithm is SHA1
	.ver 1:0:0:0		// version 1.0
	// may also add public key
}

/* Further assembly references. */
.assembly extern System.Windows.Forms {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}

.assembly extern System.Drawing {
  .publickeytoken = (b0 3f 5f 7f 11 d5 0a 3a)
  .ver 1:0:3300:0
}

.assembly extern System {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}


/* Files referenced by the assembly, all DLLs need to appear here.
   All references by modules need to be listed here, too. */
.file CountDownComponents.dll
.file Counter.dll
.file CountDownSecondsLabel.netmodule
.file CountDownErrorLabel.netmodule


/********************************************/
/*       Information about this module      */
/********************************************/

/* The module declaration. */
.module CountDown.exe

/* The module references.
   All these modules become part of this assembly. */
.module extern CountDownComponents.dll
.module extern Counter.dll
.module extern CountDownSecondsLabel.netmodule
.module extern CountDownErrorLabel.netmodule


/********************************************/
/*            Class: CountDown              */
/********************************************/

/* This is the main class of the application. It contains
 * the entrypoint. */
.class public auto autochar CountDown extends [mscorlib]System.Object {

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor() cil managed {
		.maxstack 1
		ldarg.0		// load this pointer
		// call super constructor
		call	instance void [mscorlib]System.Object::.ctor()
		ret
	}

	/* entrypoint to the application
	 * (can have any name)
	 */
	.method public static hidebysig int32 Main() cil managed {
		.entrypoint
		.maxstack	1
		.zeroinit				// initialize all locals
		// declare locals
		.locals (class CountDownForm countDownForm)
		.custom instance void [mscorlib]System.STAThreadAttribute::.ctor()
		// instantiate CountDownForm
		newobj	instance void CountDownForm::.ctor()
		stloc	countDownForm			// store instance
		ldloc	countDownForm			// load form onto stack
		// start the Form on a new thread
		call	void [System.Windows.Forms]System.Windows.Forms.Application::Run(class [System.Windows.Forms]System.Windows.Forms.Form)
		ldc.i4.0			// successful return
		ret
	}
} // end of class CountDown


/********************************************/
/*          Class: CountDownForm            */
/********************************************/

/* Represents the form displayed on the screen. Contains and manages all the controls
 * of the application */
.class private auto autochar CountDownForm extends [System.Windows.Forms]System.Windows.Forms.Form {

	/* the instance fields */
	.field private class [.module CountDownSecondsLabel.netmodule]SecondsLabel secondsLabel
	.field private class [.module CountDownComponents.dll]CounterTextBox counterBox
	.field private class [.module CountDownComponents.dll]StartStopButton button
	.field private class [.module CountDownErrorLabel.netmodule]ErrorLabel errorLabel
	.field private class [.module Counter.dll]Counter counter
	.field private class System.String[] errorStrings

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor() cil managed {
		.maxstack 3
		.locals init (class [.module Counter.dll]Count count)

		// call super constructor
		ldarg.0
		call	instance void [System.Windows.Forms]System.Windows.Forms.Form::.ctor()

		// initialize error strings
		ldarg.0
		callvirt instance void CountDownForm::InitializeErrorStrings()

		// setup form
		ldarg.0
		callvirt instance void CountDownForm::Initialize()

		// create the button and store in an instance variable
		ldarg.0
		dup
		newobj	instance void [.module CountDownComponents.dll]StartStopButton::.ctor(class [System.Windows.Forms]System.Windows.Forms.Form)
		stfld	class [.module CountDownComponents.dll]StartStopButton CountDownForm::button

		// create the text label and store in an instance variable, the label initializes itself
		ldarg.0
		dup
		newobj	instance void [.module CountDownSecondsLabel.netmodule]SecondsLabel::.ctor(class [System.Windows.Forms]System.Windows.Forms.Form)
		stfld	class [.module CountDownSecondsLabel.netmodule]SecondsLabel CountDownForm::secondsLabel

		// create the time box and store in an instance variable
		ldarg.0
		dup
		newobj	instance void [.module CountDownComponents.dll]CounterTextBox::.ctor(class CountDownForm)
		stfld	class [.module CountDownComponents.dll]CounterTextBox CountDownForm::counterBox

		// create the count object
		ldarg.0
		ldfld	class [.module CountDownComponents.dll]CounterTextBox CountDownForm::counterBox
		newobj	instance void [.module Counter.dll]Count::.ctor(class [.module Counter.dll]ICountDisplay)
		stloc	count

		// create the counter
		ldarg.0
		dup
		ldfld	class [.module CountDownComponents.dll]StartStopButton CountDownForm::button
		ldloc	count
		newobj	instance void [.module Counter.dll]BeepingCounter::.ctor(class [.module Counter.dll]IStartStopEventSource, class [.module Counter.dll]Count)
		stfld	class [.module Counter.dll]Counter CountDownForm::counter

		// add button to the time up event
		ldarg.0
		ldfld	class [.module CountDownComponents.dll]StartStopButton CountDownForm::button
		ldarg.0
		ldfld	class [.module Counter.dll]Counter CountDownForm::counter
		call	instance void [.module CountDownComponents.dll]StartStopButton::AddToTimeUp(class [.module Counter.dll]Counter)

		// create the error label and store in an instance variable
		ldarg.0
		dup
		newobj	instance void [.module CountDownErrorLabel.netmodule]ErrorLabel::.ctor(class [System.Windows.Forms]System.Windows.Forms.Form)
		stfld	class [.module CountDownErrorLabel.netmodule]ErrorLabel CountDownForm::errorLabel

		ret
	}

	/* Initializes the form by setting the title, size,
	   and background color */
	.method virtual newslot family hidebysig instance void Initialize() cil managed {
		.maxstack 3
		.locals init (value class [System.Drawing]System.Drawing.Size size)

		// set the title
		ldarg.0				// load this pointer
		ldstr	"CountDown"		// load window title onto stack
		// call the setter of the property
		callvirt instance void CountDownForm::set_Text(class System.String)

		// set the size
		ldloca	size
		initobj	value class [System.Drawing]System.Drawing.Size
		ldloca	size
		ldc.i4	425	// width
		ldc.i4	300	// height
		call	instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		ldarg.0
		ldloc	size
		callvirt instance void CountDownForm::set_Size(value class [System.Drawing]System.Drawing.Size)

		// set the background
		ldarg.0
		call	value class [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_CadetBlue()
		callvirt instance void CountDownForm::set_BackColor(value class [System.Drawing]System.Drawing.Color)

		ret
	}

	/* Initializes the error strings displayed in case of errors. */
	.method virtual newslot family hidebysig instance void InitializeErrorStrings() cil managed {
		// create the array
		ldarg.0
		ldc.i4.4	// number of error strings + 1
		newarr	class System.String
		stfld	class System.String[] CountDownForm::errorStrings

		ldarg.0
		ldfld	class System.String[] CountDownForm::errorStrings
		ldc.i4.0
		ldstr	"" // the empty string, used to display no error
		stelem.ref

		// add the first error string to the array
		ldarg.0
		ldfld	class System.String[] CountDownForm::errorStrings
		ldc.i4.1
		ldstr	"Please enter an integer!"
		stelem.ref

		// add the next error string to the array
		ldarg.0
		ldfld	class System.String[] CountDownForm::errorStrings
		ldc.i4.2
		ldstr	"Number is out of range!"
		stelem.ref

		// add the next error string to the array
		ldarg.0
		ldfld	class System.String[] CountDownForm::errorStrings
		ldc.i4.3
		ldstr	"Number must be positive!"
		stelem.ref

		ret
	}

	/* Displays the error string according to the passed in error code.
	   Error code must be one of the values declared by the enumeration. */
	.method virtual newslot famorassem hidebysig instance void ShowErrorText(value class ErrorCodes errorCode) synchronized cil managed {
		// load the appropriate error string
		ldarg.0
		ldfld	class [.module CountDownErrorLabel.netmodule]ErrorLabel CountDownForm::errorLabel
		ldarg.0
		ldfld	class System.String[] CountDownForm::errorStrings
		ldarg	errorCode	// load the value of the enumeration
		ldelem.ref
		// error string on stack, display
		callvirt instance void class [.module CountDownErrorLabel.netmodule]ErrorLabel::set_Text(class System.String)
		ret
	}
} // end of class CountDownForm


/********************************************/
/*         Enumeration: ErrorCodes          */
/********************************************/

/* This enumeration defines the valid error codes
 * Must be sealed, since value type. */
.class value sealed serializable auto autochar public ErrorCodes extends [mscorlib]System.Enum {
	// the field of the enumeration, underlying type is unsigned int8
	.field public specialname rtspecialname unsigned int8 value__

	// Metadata fields documenting the legal values of the enumeration and
	// giving them names.
	// This fields are accessible only with reflection.
	.field public static literal value class ErrorCodes no_error = int8(0)
	.field public static literal value class ErrorCodes format_error = int8(1)
	.field public static literal value class ErrorCodes overflow_error = int8(2)
	.field public static literal value class ErrorCodes nonpositive_error = int8(3)
} // end of enumeration ErrorCodes
