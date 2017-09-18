/*
 * Microsoft .Net CountDown
 * Copyright (c) Microsoft Corporation  All rights reserved.
 *
 * This file contains UI components for Microsoft .NET CountDown.
 * This file declares the classes
 *	- CounterTextBox
 *	- StartStopButton
 * This file declares the exception
 *	- NonPositiveNumberException
 * This file declares the event
 *	- StartStopEvent (in StartStopButton)
 *
 */

/* This module does not declare an assembly.
 * As a consequence, it must be referenced by another assembly to
 * be usable. This module does not have an entrypoint
 */


/********************************************/
/*       Information about this module      */
/********************************************/

/* The module declaration. compiles into a dll*/
.module CountDownComponents.dll

/* Assembly references */
.assembly extern mscorlib {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}

.assembly extern System.Windows.Forms {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}

.assembly extern System.Drawing {
  .publickeytoken = (b0 3f 5f 7f 11 d5 0a 3a)
  .ver 1:0:3300:0
}

/* Files referenced by the module, all DLLs need to appear here. */
.file CountDown.exe
.file Counter.dll

/* Module references. */
.module extern CountDown.exe
.module extern Counter.dll


/********************************************/
/*          Class: CounterTextBox           */
/********************************************/

/* Implements the text box that shows the seconds. Accepts values
 * from the user. Validates entered values.
 * The CounterTextBox is an ICountDisplay. */
.class private auto autochar CounterTextBox extends [System.Windows.Forms]System.Windows.Forms.TextBox implements [.module Counter.dll]ICountDisplay {

	/* Nested class. Declares the NegativeNumberException */
	.class nested assembly NonPositiveNumberException extends [mscorlib]System.Exception {

		/* constructor */
		.method public rtspecialname specialname void .ctor() cil managed {
			.maxstack 1

			ldarg.0				// load this pointer
			// call super constructor
			call	instance void [mscorlib]System.Exception::.ctor()
			ret
		}
	} // end of exception NegativeNumberException

	/* The instance fields */
	.field private class [.module CountDown.exe]CountDownForm parent
	
	/* constructor */
	.method famorassem rtspecialname specialname hidebysig instance void .ctor(class [.module CountDown.exe]CountDownForm parent) cil managed {
		.maxstack 2
		ldarg.0			// load this pointer
		// call super constructor
		call	instance void [System.Windows.Forms]System.Windows.Forms.TextBox::.ctor()

		// set parent field
		ldarg.0
		ldarg	parent
		stfld	class [.module CountDown.exe]CountDownForm CounterTextBox::parent

		// initialize
		ldarg.0
		callvirt instance void CounterTextBox::Initialize()

		// add the text box to the form
		ldarg	parent
		call	instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Form::get_Controls()
		ldarg.0
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)

		ret
	}

	/* Initializes this text box */
	.method virtual newslot private hidebysig instance void Initialize() cil managed {
		.maxstack 3
		.locals init (value class [System.Drawing]System.Drawing.Size size,
			      value class [System.Drawing]System.Drawing.Point point)

		// set position
		ldloca	point
		initobj	value class [System.Drawing]System.Drawing.Point
		ldloca	point
		ldc.i4	75	// x
		ldc.i4	100	// y
		call	instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		ldarg.0
		ldloc	point
		call	instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_Location(value class [System.Drawing]System.Drawing.Point)

		// set anchor
		ldarg.0
		ldc.i4	3	// Top | Bottom
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_Anchor(value class [System.Windows.Forms]System.Windows.Forms.AnchorStyles)

		// set the size of the text box
		ldloca	size
		initobj	value class [System.Drawing]System.Drawing.Size
		ldloca	size
		ldc.i4	115	// width
		ldc.i4	20	// height
		call	instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		ldarg.0
		ldloc	size
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_Size(value class [System.Drawing]System.Drawing.Size)

		// set the text of the text box, should be set to a different value by counter
		ldarg.0
		ldstr	"0"
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_Text(class System.String)

		ret
	}

	/* Sets the value of the count to be displayed  */
	.method virtual newslot public hidebysig instance void SetCount(int32 count) cil managed {
		.maxstack 2
		ldarg.0
		ldarg	count
		// convert count to string
		call	class System.String [mscorlib]System.Convert::ToString(int32)
		// set the display
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.TextBox::set_Text(class System.String)
		ret
	}

	/* Retrieves the value currently displayed.
	 * This includes entries made by the user.
	 * Validates the number displayed. If the number is invalid request CountDownForm to display
	 * an appropriate error message
	 */
	.method virtual newslot public hidebysig instance int32 GetCount() cil managed {
		.maxstack 4
		// local rvalue contains the value to return
		// rvalue is initialized to zero
		.locals	init (int32 rvalue,
			      value class [.module CountDown.exe]ErrorCodes errorCode)

		// initialize error code
		ldc.i4.0		// no_error
		stloc	errorCode	// store into enumeration

		// two catch clauses, need two try declarations
		.try {
		.try {
			ldarg.0
			callvirt instance class System.String CounterTextBox::get_Text()
			// string representing displayed value on stack
			// try to convert into integer
			call int32 [mscorlib]System.Convert::ToInt32(class [mscorlib]System.String)
			// integer on stack
			stloc	rvalue
			// leave the try and continue with processing
			leave	is_integer
		} catch [mscorlib]System.FormatException {
			// entered value is not an integer
			// pop the exception object
			pop

			ldc.i4.1	// format_error
			stloc	errorCode

			leave	done	// leave the catch
		}} catch [mscorlib]System.OverflowException {
			// entered value is number but does not fit into int32
			// pop the exception object
			pop

			ldc.i4.2	// overflow_error
			stloc	errorCode

			leave	done	// leave the catch
		}
is_integer:
		.try {
			// check whether value is positive
			ldloc	rvalue
			ldc.i4.0
			bgt	in_range
			// not positive, throw an exception
			newobj	instance void CounterTextBox/NonPositiveNumberException::.ctor()
			throw
in_range:
			// value is positive, leave the try
			leave	done
		} catch CounterTextBox/NonPositiveNumberException {
			// catch exception thrown in try block
			// number is not positive
			// pop the exception object
			pop

			ldc.i4.3	// nonpositive_error
			stloc	errorCode

			leave	done	// leave the catch
		}
done:
		// set the error text
		ldarg.0
		ldfld	class [.module CountDown.exe]CountDownForm CounterTextBox::parent
		ldloc	errorCode
		callvirt instance void [.module CountDown.exe]CountDownForm::ShowErrorText(value class [.module CountDown.exe]ErrorCodes)

		// return with rvalue
		ldloc	rvalue
		ret
	}
} // end of class CounterTextBox


/********************************************/
/*          Class: StartStopButton          */
/********************************************/

/* Represents the start stop button. The button starts or stops the counter.
 * The button displays the appropriate label and changes state if the counter stops.
 * Declares the StartStopEvent.
 * The StartStopButton is an ISartStopEventSource. */
.class private auto autochar StartStopButton extends [System.Windows.Forms]System.Windows.Forms.Button implements [.module Counter.dll]IStartStopEventSource {

	/* The instance fields */
	.field private class [mscorlib]System.EventHandler onClickEventHandler
	.field private class [.module Counter.dll]TimeUpEventHandler timeUpEventHandler
	.field private class [.module Counter.dll]StartStopEventHandler startStopEventHandler
	.field private bool state	// 0 = counter stopped, 1 = counter started

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor(class [System.Windows.Forms]System.Windows.Forms.Form parent) cil managed {
		.maxstack 2

		ldarg.0			// load this pointer
		// call super constructor
		call	instance void [System.Windows.Forms]System.Windows.Forms.Button::.ctor()

		// intialize state
		ldarg.0
		ldc.i4.0	// counter stopped
		stfld	bool StartStopButton::state

		// initialize the button
		ldarg.0
		callvirt instance void StartStopButton::Initialize()

		// add the button to the form
		ldarg	parent
		call	instance class [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection [System.Windows.Forms]System.Windows.Forms.Form::get_Controls()
		ldarg.0
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Control/ControlCollection::Add(class [System.Windows.Forms]System.Windows.Forms.Control)

		// setup Click event
		ldarg.0
		call	instance void StartStopButton::AddToClick()

		ret
	}

	/* finalizer */
	.method virtual family hidebysig instance void Finalize() cil managed {
		.maxstack 3

		// remove the OnClick event
		ldarg.0
		dup
		ldfld	class [mscorlib]System.EventHandler StartStopButton::onClickEventHandler
		call	instance void [System.Windows.Forms]System.Windows.Forms.Button::remove_Click(class [mscorlib]System.EventHandler)

		ret
	}

	/* Initializes this button */
	.method virtual newslot private hidebysig instance void Initialize() cil managed {
		.maxstack 3
		.locals init (value class [System.Drawing]System.Drawing.Size size,
			      value class [System.Drawing]System.Drawing.Point point)

		// set position
		ldloca	point
		initobj	value class [System.Drawing]System.Drawing.Point
		ldloca	point
		ldc.i4	100	// x
		ldc.i4	200	// y
		call	instance void [System.Drawing]System.Drawing.Point::.ctor(int32, int32)
		ldarg.0
		ldloc	point
		call	instance void [System.Windows.Forms]System.Windows.Forms.Button::set_Location(value class [System.Drawing]System.Drawing.Point)

		// set anchor
		ldarg.0
		ldc.i4	15 	// Top | Bottom | Left | Right
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_Anchor(value class [System.Windows.Forms]System.Windows.Forms.AnchorStyles)

		// set the size of the button
		ldloca	size
		initobj	value class [System.Drawing]System.Drawing.Size
		ldloca	size
		ldc.i4	200	// width
		ldc.i4	50	// height
		call	instance void [System.Drawing]System.Drawing.Size::.ctor(int32, int32)
		ldarg.0
		ldloc	size
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_Size(value class [System.Drawing]System.Drawing.Size)

		// set the color
		ldarg.0
		call	value class [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Gold()
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_BackColor(value class [System.Drawing]System.Drawing.Color)

		// set the text color
		ldarg.0
		call	value class [System.Drawing]System.Drawing.Color [System.Drawing]System.Drawing.Color::get_Navy()
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_ForeColor(value class [System.Drawing]System.Drawing.Color)

		// set the font height
		ldarg.0
		ldstr	"Arial"
		ldc.r4	20
		newobj	instance void [System.Drawing]System.Drawing.Font::.ctor(class System.String, float32)
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_Font(class [System.Drawing]System.Drawing.Font)

		// set the text of the button
		ldarg.0
		ldstr	"Start"
		callvirt instance void [System.Windows.Forms]System.Windows.Forms.Button::set_Text(class System.String)

		ret
	}

	/* Sets the state of the button and updates the label
	 * 0 = counter stopped
	 * 1 = counter started */
	.method virtual newslot famorassem hidebysig instance void SetState(int32 newState) cil managed {
		// set the state
		ldarg.0
		ldarg	newState
		stfld	bool StartStopButton::state

		// set the label
		ldarg	newState
		ldc.i4.0
		beq		stop_state
		// state is counter started, set label to "Stop"
		ldarg.0
		ldstr	"Stop"
		callvirt instance void StartStopButton::set_Text(class System.String)
		br		done
stop_state:
		// state is counter stopped, set label to "Start"
		ldarg.0
		ldstr	"Start"
		callvirt instance void StartStopButton::set_Text(class System.String)
done:
		ret
	}

	/* adds this button to the Click event */
	.method public hidebysig instance void AddToClick() cil managed {
		.maxstack 3

		// load method pointer to handler and create a delegate for it
		ldarg.0
		dup	// duplicate top of stack
		dup	// need three versions of this
		ldvirtftn instance void StartStopButton::OnClick(class System.Object, class [mscorlib]System.EventArgs)
		newobj	instance void [mscorlib]System.EventHandler::.ctor(class System.Object, native int)
		stfld	class [mscorlib]System.EventHandler StartStopButton::onClickEventHandler

		// load delegate and pass to event source
		ldarg.0
		dup
		ldfld	class [mscorlib]System.EventHandler StartStopButton::onClickEventHandler
		call	instance void [System.Windows.Forms]System.Windows.Forms.Button::add_Click(class [mscorlib]System.EventHandler)
		ret
	}
	
	/* Event handler for Click events.
	 * Click events are fired for this component when the user presses the button
	 * Declaration follows EventHandler delegate */
	.method virtual newslot public hidebysig instance void OnClick(class System.Object, class [mscorlib]System.EventArgs) cil managed {
		.maxstack 3

		// fire the start stop event, counter must be started or stopped
		ldarg.0
		callvirt instance void StartStopButton::fire_StartStopEvent()
		ret
	}

	/* Adds this button to the TimeUp event.
	 * called by CountDownForm. */
	.method public hidebysig instance void AddToTimeUp(class [.module Counter.dll]Counter counter) cil managed {
		.maxstack 3

		// load pointer to handler and create a delegate for it
		ldarg.0
		dup	// duplicate top of stack
		ldftn	instance void StartStopButton::OnTimeUp()
		newobj	instance void [.module Counter.dll]TimeUpEventHandler::.ctor(class System.Object, native int)
		stfld	class [.module Counter.dll]TimeUpEventHandler StartStopButton::timeUpEventHandler
		ldarg	counter

		// load delegate and pass to event source
		ldarg.0
		ldfld	class [.module Counter.dll]TimeUpEventHandler StartStopButton::timeUpEventHandler
		call	instance void [.module Counter.dll]Counter::add_TimeUp(class [.module Counter.dll]TimeUpEventHandler)
		ret
	}
	
	/* Event handler for time up events.
	 * The TimeUp event signals that the counter has stopped.
	 * The state of the button needs to be updated. */
	.method virtual newslot famorassem hidebysig instance void OnTimeUp() cil managed {
		// timer stopped, so set state to timer stopped
		ldarg.0
		ldc.i4.0
		callvirt instance void StartStopButton::SetState(int32)
		ret
	}

	/*** Definition of the StartStopEvent ***/

	// Event is implemented using delegate StartStopEventHandler from Counter.dll

	/* Declaration of the StartStopEvent */
	.event [.module Counter.dll]StartStopEventHandler StartStopEvent {
		.addon instance void add_StartStopEvent(class [.module Counter.dll]StartStopEventHandler 'handler')
		.removeon instance void remove_StartStopEvent(class [.module Counter.dll]StartStopEventHandler 'handler')
		.fire instance void fire_StartStopEvent()
	}

	/* Add a listener to the StartStopEvent */
	.method virtual newslot public specialname hidebysig instance void add_StartStopEvent(class [.module Counter.dll]StartStopEventHandler 'handler') cil managed {
		.maxstack 4
		// combine with the multicast delegate
		ldarg.0
		dup
		ldfld	class [.module Counter.dll]StartStopEventHandler StartStopButton::startStopEventHandler
		ldarg	'handler'
		call	class[mscorlib]System.Delegate [mscorlib]System.Delegate::Combine(class [mscorlib]System.Delegate, class [mscorlib]System.Delegate)
		castclass [.module Counter.dll]StartStopEventHandler
		stfld	class [.module Counter.dll]StartStopEventHandler StartStopButton::startStopEventHandler
		ret
	}

	/* Remove a listener from the StartStopEvent */
	.method virtual newslot public specialname hidebysig instance void remove_StartStopEvent(class [.module Counter.dll]StartStopEventHandler 'handler') cil managed {
		.maxstack 4
		// remove from the multicast delegate
		ldarg.0
		dup
		ldfld	class [.module Counter.dll]StartStopEventHandler StartStopButton::startStopEventHandler
		ldarg	'handler'
		call	class[mscorlib]System.Delegate [mscorlib]System.Delegate::Remove(class [mscorlib]System.Delegate, class [mscorlib]System.Delegate)
		castclass [.module Counter.dll]StartStopEventHandler
		stfld	class [.module Counter.dll]StartStopEventHandler StartStopButton::startStopEventHandler
		ret
	}

	/* Fire the StartStopEvent */
	.method virtual newslot family specialname hidebysig instance void fire_StartStopEvent() cil managed {
		.maxstack 3
		// if state is counter stopped, fire start argument
		// if state is counter started, fire stop argument
		ldarg.0
		ldfld	bool StartStopButton::state
		brtrue	stop_it
		ldarg.0
		ldc.i4.1	// start counter
		callvirt instance void StartStopButton::SetState(int32)
		br	continue
stop_it:
		ldarg.0
		ldc.i4.0	// stop counter
		callvirt instance void StartStopButton::SetState(int32)
continue:
		// invoke the mutlicast delegate
		ldarg.0
		ldfld	class [.module Counter.dll]StartStopEventHandler StartStopButton::startStopEventHandler
		ldarg.0
		ldfld	bool StartStopButton::state
		callvirt instance void [.module Counter.dll]StartStopEventHandler::Invoke(int32)
		ret
	}

	/*** End of the definition of the StartStopEvent ***/

} // end of class StartStopButton
