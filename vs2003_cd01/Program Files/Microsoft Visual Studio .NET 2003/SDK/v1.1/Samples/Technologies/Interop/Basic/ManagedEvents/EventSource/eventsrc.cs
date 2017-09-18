// Copyright
// Microsoft Corporation
// All rights reserved

using System;
using System.Runtime.InteropServices;

[assembly:ClassInterface(ClassInterfaceType.AutoDual)]

namespace EventSource
{

	public delegate void ClickDelegate(int x, int y);
	public delegate void ResizeDelegate();
	public delegate void PulseDelegate();

    [GuidAttribute("1A585C4D-3371-48dc-AF8A-AFFECC1B0967") ]
	[InterfaceTypeAttribute(ComInterfaceType.InterfaceIsIDispatch)]
	public interface ButtonEvents
	{
		void Click(int x, int y);
		void Resize();
		void Pulse();
	}

	//This is necessary
	[ComSourceInterfaces("EventSource.ButtonEvents, EventSrc")]
	public class Button
	{
		public event ClickDelegate Click;
		public event ResizeDelegate Resize;
		public event PulseDelegate Pulse;
		
		public Button()
		{

		}

		public void CauseClickEvent(int x, int y)
		{ 
			Click(x, y);
		}

		public void CauseResizeEvent()
		{ 
			Resize();
		}

		public void CausePulse()
		{
			Pulse();
		}

	}

}


