using System;
using System.Threading;
using System.Runtime.InteropServices;

namespace DisconnectedContext
{
	public class Test
	{
		public static void Entry(bool enabled)
		{
			StaApartment apt = null;

			try
			{
				apt = new StaApartment(typeof(CDPTests));

				if (enabled)
				{
					apt.Exit();
				}

				// If enabled the object will be returned, else a proxy will be returned
				IFoo foo = (IFoo)apt.Object;

				// Either way, this call should succeed
				foo.Foo();

			}
			catch(Exception e)
			{
				System.Console.WriteLine("Exception caught in DisconnectedContext test: " + e);
			}
			finally
			{
				if (apt != null)
				{
					// MARGINAL: The finalizer thread should call Release via RPC to the apartment thread.
					// When the apartment thread is dead the finalizer is forced to call release itself.
					// This should fire off the probe but currently does not. We will revisit this in the
					// next version.
					apt.ClearObject();
					System.GC.Collect();
					System.GC.WaitForPendingFinalizers();

					apt.Exit();
				}
			}
		}
	}
}
