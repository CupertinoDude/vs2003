/*
 * Microsoft .Net CountDown
 * Copyright (c) Microsoft Corporation  All rights reserved.
 *
 * This file defines the counter functionality for Microsoft .NET CountDown.
 * This file declares the classes
 *	- Count
 *	- Counter
 *	- BeepingCounter
 *	- User32
 * This file declares the interfaces
 *	- ICountDisplay
 *	- IStartStopEventSource
 * This file declares the delegates
 *	- StartStopEventHandler
 *	- TimeUpEventHandler
 * This file declares the event
 *	- TimeUpEvent (in Counter)
 *
 */

/* This module does not declare an assembly.
 * As a consequence, it must be referenced by another assembly to
 * be usable. This module does not have an entrypoint
 */

/********************************************/
/*       Information about this module      */
/********************************************/

/* Module declaration, compiles into a dll. */
.module CountDownComponents.dll

/* The assembly references. */
.assembly extern mscorlib {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}

.assembly extern System {
  .publickeytoken = (b7 7a 5c 56 19 34 e0 89)
  .ver 1:0:3300:0
}

/********************************************/
/*     Global Data embedded in PEFile       */
/********************************************/

// the default value of the counter
.data COUNTER_DEFAULT = int32(10)	// 10 seconds


/********************************************/
/*         Interface: ICountDisplay         */
/********************************************/

/* Implementer is able to display a count value */
.class interface abstract public auto autochar ICountDisplay {
	.method virtual abstract public hidebysig instance void SetCount(int32 count) cil managed {}
	.method virtual abstract public hidebysig instance int32 GetCount() cil managed {}
} // end of interface ICountDisplay


/********************************************/
/*    Interface: IStartStopEventSource      */
/********************************************/

/* Implementer defines a StartSopEvent */
.class interface abstract auto autochar public IStartStopEventSource {
	.method virtual abstract public hidebysig instance void add_StartStopEvent(class StartStopEventHandler) cil managed {}
	.method virtual abstract public hidebysig instance void remove_StartStopEvent(class StartStopEventHandler) cil managed {}
} // end of interface IStartStopEventSource


/********************************************/
/*              Class: Count                */
/********************************************/

/* Represents a count value. Defines a Count property.
 * Interacts with an ICountDisplay to display the value.
 * It is not appropriate for Count to be a value type because
 * instances of it are shared between classes.
 */
.class public auto autochar Count extends [mscorlib]System.Object {

	/* Instance fields */
	.field private int32 count
	.field static family int32 counterDefault at COUNTER_DEFAULT // defined at global data
	.field family class ICountDisplay display

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor(class ICountDisplay display) cil managed {
		// make super call
		ldarg.0
		call	instance void [mscorlib]System.Object::.ctor()

		// set display
		ldarg.0
		ldarg	display
		stfld	class ICountDisplay Count::display

		// initialize count with counterDefault from global data
		// must come after diplay is set
		ldarg.0
		ldsfld	int32 Count::counterDefault
		callvirt instance void Count::set_Count(int32)

		ret
	}

	/*** Property Count ***/

	/* Declaration of property */
	.property int32 Count() {
		.get instance int32 get_Count()
		.set instance void set_Count(int32)
		.other instance void refresh_Count()
	}

	/* Getter of Count property */
	.method virtual newslot public hidebysig instance int32 get_Count() cil managed {
		ldarg.0
		ldfld	int32 Count::count
		ret
	}

	/* Setter of Count property */
	.method virtual newslot public hidebysig instance void set_Count(int32 newCount) synchronized cil managed {
		ldarg.0
		ldarg	newCount
		stfld	int32 Count::count
		ldarg.0
		ldfld	class ICountDisplay Count::display
		ldarg	newCount
		callvirt instance void ICountDisplay::SetCount(int32)
		ret
	}

	/* Other method of Count property.
	 * Updates the count value reading the value at the display.
	 * This way user entered values are considered. */
	.method virtual newslot public hidebysig instance void refresh_Count() synchronized cil managed {
		ldarg.0
		dup
		ldfld	class ICountDisplay Count::display
		callvirt instance int32 ICountDisplay::GetCount()
		stfld	int32 Count::count
		ret
	}

	/*** End of property Count ***/

} // end of class Count


/********************************************/
/*             Class: Counter               */
/********************************************/

/* Represents a counter. Uses a Count object and decrements its value until zero is reached.
 * Stops when the count has reached zero. Fires a TimeUpEvent when count has reached zero.
 * Defines the TimeUpEvent */
.class public auto autochar Counter extends [mscorlib]System.Object {

	/* Instance fields */
	.field private class [System]System.Timers.Timer timer
	.field private class [System]System.Timers.ElapsedEventHandler timerEventHandler
	.field family class Count count
	.field private class IStartStopEventSource startStopEventSource
	.field private class StartStopEventHandler startStopEventHandler
	.field private class TimeUpEventHandler timeUpEventHandler

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor(class IStartStopEventSource startStopEventSource, class Count count) cil managed {
		// call super constructor
		ldarg.0
		call	instance void [mscorlib]System.Object::.ctor()

		// set startStopEventSource
		ldarg.0
		ldarg	startStopEventSource
		stfld	class IStartStopEventSource Counter::startStopEventSource

		// set count
		ldarg.0
		ldarg	count
		stfld	class Count Counter::count

		// setup the time
		ldarg.0
		callvirt instance void Counter::SetupTimer()

		// listen to the StartStopEvent
		ldarg.0
		callvirt instance void Counter::SetupStartStopEvent()
		ret
	}

	/* finalizer */
	.method virtual family hidebysig instance void Finalize() cil managed {
		.maxstack 3

		// remove the StartStop event
		ldarg.0
		ldfld	class IStartStopEventSource Counter::startStopEventSource
		ldarg.0
		ldfld	class StartStopEventHandler Counter::startStopEventHandler
		callvirt instance void IStartStopEventSource::remove_StartStopEvent(class StartStopEventHandler)

		// remove the timer event
		ldarg.0
		ldfld	class [System]System.Timers.Timer Counter::timer
		ldarg.0
		ldfld	class [System]System.Timers.ElapsedEventHandler Counter::timerEventHandler
		call	instance void [System]System.Timers.Timer::remove_Elapsed(class [System]System.Timers.ElapsedEventHandler)

		ret
	}

	/* setup the timer and start listening to the OnTick event */
	.method virtual newslot famorassem hidebysig instance void SetupTimer() cil managed {
		.maxstack 3

		// setup the timer
		ldarg.0
		ldc.r8	1000
		newobj	instance void [System]System.Timers.Timer::.ctor(float64)
		stfld	class [System]System.Timers.Timer Counter::timer

		// set auto reset property of timer
		ldarg.0
		ldfld	class [System]System.Timers.Timer Counter::timer
		ldc.i4.1
		call	instance void [System]System.Timers.Timer::set_AutoReset(bool)

		// load method pointer to event handler and create delegate
		ldarg.0
		dup	// duplicate top of stack
		dup	// duplicate top of stack again
		ldvirtftn instance void Counter::OnTick(class System.Object, class [System]System.Timers.ElapsedEventArgs)
		newobj	instance void [System]System.Timers.ElapsedEventHandler::.ctor(class System.Object, native int)
		stfld	class [System]System.Timers.ElapsedEventHandler Counter::timerEventHandler

		// start listening OnTick event
		ldarg.0
		ldfld	class [System]System.Timers.Timer Counter::timer
		ldarg.0
		ldfld	class [System]System.Timers.ElapsedEventHandler Counter::timerEventHandler
		call	instance void [System]System.Timers.Timer::add_Elapsed(class [System]System.Timers.ElapsedEventHandler)

		ret
	}

	/* start listening to the StartStopEvent
	 * fired when user wants to start or stop the counter */
	.method virtual newslot famorassem hidebysig instance instance void SetupStartStopEvent() cil managed {
		.maxstack 3

		// load method pointer to event handler and create delegate
		ldarg.0
		dup	// duplicate top of stack
		ldftn	instance void Counter::OnStartStop(int32)
		newobj	instance void StartStopEventHandler::.ctor(class System.Object, native int)
		stfld	class StartStopEventHandler Counter::startStopEventHandler

		// start listening to StartStopEvent
		ldarg.0
		ldfld	class IStartStopEventSource Counter::startStopEventSource
		ldarg.0
		ldfld	class StartStopEventHandler Counter::startStopEventHandler
		callvirt instance void IStartStopEventSource::add_StartStopEvent(class StartStopEventHandler)

		ret
	}

	/* Event handler for the StartStopEvent 
	 * action = 0, stop counter
	 * action = 1, start counter */
	.method public hidebysig instance void OnStartStop(int32 action) cil managed {
		ldarg	action
		brtrue	start
		// stop the counter
		ldarg.0
		call	instance void Counter::Stop()
		br	done
start:
		// start the counter
		ldarg.0
		call	instance void Counter::Start()
done:
		ret
	}

	/* starts the counter */
	.method private hidebysig instance void Start() cil managed {
		// refresh
		ldarg.0
		ldfld	class Count Counter::count
		callvirt instance void Count::refresh_Count()

		// check if > 0
		// 0 indicates some error
		ldarg.0
		ldfld	class Count Counter::count
		callvirt instance int32 Count::get_Count()
		ldc.i4.0
		ble		do_not_start

		// start the timer
		ldarg.0
		ldfld	class [System]System.Timers.Timer Counter::timer
		call	instance void [System]System.Timers.Timer::Start()
		br	done

do_not_start:
		// fire the TimeUpEvent to make sure all listeners are in stop state
		ldarg.0
		callvirt instance void Counter::fire_TimeUpEvent()
done:
		ret
	}

	/* stops the counter */
	.method private hidebysig instance void Stop() cil managed {
		// stop the timer
		ldarg.0
		ldfld	class [System]System.Timers.Timer Counter::timer
		call	instance void [System]System.Timers.Timer::Stop()
		ret
	}

	/* Event handler for the Tick event.
	 * Subclasses may override event handler. */
	.method virtual newslot family hidebysig instance void OnTick(class System.Object, class [System]System.Timers.ElapsedEventArgs) cil managed {
		.maxstack 3
		// subtract one from counter
		ldarg.0
		ldfld	class Count Counter::count
		dup
		callvirt instance int32 Count::get_Count()
		ldc.i4.1
		sub
		callvirt instance void Count::set_Count(int32)

		// check whether to stop
		ldarg.0
		ldfld	class Count Counter::count
		callvirt instance int32 Count::get_Count()
		ldc.i4.0
		ble	time_up

		br	done
time_up:
		// stop timer
		ldarg.0
		call	instance void Counter::Stop()
		ldarg.0
		callvirt instance void Counter::fire_TimeUpEvent()
done:
		ret
	}

	/*** Definition of the TimeUp event ***/

	// Event is implemented using delegate TimeUpEventHandler

	/* Declaration of the event */
	.event TimeUpEventHandler TimeUpEvent {
		.addon instance void add_TimeUp(class TimeUpEventHandler 'handler')
		.removeon instance void remove_TimeUp(class TimeUpEventHandler 'handler')
		.fire instance void fire_TimeUpEvent()
	}

	/* add a listener */
	.method virtual newslot public specialname hidebysig instance void add_TimeUp(class TimeUpEventHandler 'handler') cil managed {
		.maxstack 4
		ldarg.0
		dup
		ldfld	class TimeUpEventHandler Counter::timeUpEventHandler
		ldarg	'handler'
		call	class[mscorlib]System.Delegate [mscorlib]System.Delegate::Combine(class [mscorlib]System.Delegate, class [mscorlib]System.Delegate)
		castclass TimeUpEventHandler
		stfld	class TimeUpEventHandler Counter::timeUpEventHandler
		ret
	}

	/* remove a listener */
	.method virtual newslot public specialname hidebysig instance void remove_TimeUp(class TimeUpEventHandler 'handler') cil managed {
		.maxstack 4
		ldarg.0
		dup
		ldfld	class TimeUpEventHandler Counter::timeUpEventHandler
		ldarg	'handler'
		call	class[mscorlib]System.Delegate [mscorlib]System.Delegate::Remove(class [mscorlib]System.Delegate, class [mscorlib]System.Delegate)
		castclass TimeUpEventHandler
		stfld	class TimeUpEventHandler Counter::timeUpEventHandler
		ret
	}

	/* fire the event */
	.method virtual newslot family specialname hidebysig instance void fire_TimeUpEvent() cil managed {
		.maxstack 3
		ldarg.0
		ldfld	class TimeUpEventHandler Counter::timeUpEventHandler
		callvirt instance void TimeUpEventHandler::Invoke()
		ret
	}

	/*** End of the definition of the TimeUp event ***/

} // end of class Counter


/********************************************/
/*          Class: BeepingCounter           */
/********************************************/

/* Modifies the behavior of the counter to beep every seconds and play final time up sound
 * Uses Windows DLL user32 to create the beeps. */
.class public auto autochar BeepingCounter extends Counter {

	/* constructor */
	.method public rtspecialname specialname hidebysig instance void .ctor(class IStartStopEventSource startStopEventSource, class Count count) cil managed {
		// call super constructor
		ldarg.0
		ldarg	startStopEventSource
		ldarg	count
		call	instance void Counter::.ctor(class IStartStopEventSource, class Count)
		ret
	}

	/* Overrides Counter::OnTick.
	 * Creates beeps when the tick is handled */
	.method virtual family hidebysig instance void OnTick(class System.Object objectArg, class [System]System.Timers.ElapsedEventArgs eventArgs) cil managed {
		// super call
		ldarg.0
		ldarg	objectArg
		ldarg	eventArgs
		call	instance void Counter::OnTick(class System.Object, class [System]System.Timers.ElapsedEventArgs)

		// check whether time is up and create appropriate beep
		ldarg.0
		dup		// for beep call
		ldfld	class Count Counter::count
		callvirt instance int32 Count::get_Count()
		ldc.i4.0
		ble		final_beep
		// normal beep
		ldc.i4.0
		br		beep_it
final_beep:
		// final beep
		ldc.i4.1
beep_it:
		// call the beep method
		callvirt instance void BeepingCounter::Beep(bool)
		ret
	}

	/* Uses User32 to create a beep. May be overriden by subclasses to
	 * have better beeps.
	 * finalBeep = 0, counter is still counting
	 * finalBeep = 1, counter is done, final beep */
	.method virtual newslot private hidebysig instance void Beep(bool finalBeep) cil managed {
		ldarg	finalBeep
		brtrue	'final'
		ldc.i4.0	// load value for normal beep
		br	continue
'final':
		ldc.i4	48	// load value for final beep
continue:
		call	int8 User32::MessageBeep(unsigned int32)
		pop
		ret
	}
} // end of class BeepingCounter


/********************************************/
/*              Class: User32               */
/********************************************/

/* Uses PInvoke to call functionality in user32.dll.
 * (change to "user.dll" if Windows9x is used).
 * Class is abstract such that no instances can be created. All methods are static.
 * Class is sealed to prevent subtyping */
.class abstract sealed public auto autochar User32 extends [mscorlib]System.Object {

	/* declaration of the method MessageBeep in user32.dll */
	.method public hidebysig static pinvokeimpl("user32.dll" cdecl) int8 MessageBeep(unsigned int32) cil managed preservesig {}
}


/********************************************/
/*     Delegate: StartStopEventHandler      */
/********************************************/

/* Defines delegate for StartStopEvent */
.class private sealed auto autochar StartStopEventHandler extends [mscorlib]System.MulticastDelegate {

	.method public specialname rtspecialname hidebysig instance void .ctor(class System.Object myobject, native int 'method') runtime managed {}

	.method virtual newslot public hidebysig instance void Invoke(int32 action) runtime managed {}

	.method virtual newslot public hidebysig instance class ['mscorlib']System.IAsyncResult BeginInvoke(int32 action,
			class ['mscorlib']System.AsyncCallback callback, class System.Object myobject) runtime managed {}

	.method virtual newslot  public hidebysig instance void EndInvoke(class ['mscorlib']System.IAsyncResult result) runtime managed {}
} // end of delegate StartStopEventHandler


/********************************************/
/*          Delegate: TimeUpHandler         */
/********************************************/

/* Defines delegate for TimeUpEvent */
.class private sealed auto autochar TimeUpEventHandler extends [mscorlib]System.MulticastDelegate {

	.method public specialname rtspecialname hidebysig instance void .ctor(class System.Object myobject, native int 'method') runtime managed {}

	.method virtual newslot public hidebysig instance void Invoke() runtime managed {}

	.method virtual newslot public newslot hidebysig instance class ['mscorlib']System.IAsyncResult BeginInvoke(
			class ['mscorlib']System.AsyncCallback callback, class System.Object myobject) runtime managed {}

	.method virtual newslot public hidebysig instance void EndInvoke(class ['mscorlib']System.IAsyncResult result) runtime managed {}
} // end of delegate TimeUpEventHandler

