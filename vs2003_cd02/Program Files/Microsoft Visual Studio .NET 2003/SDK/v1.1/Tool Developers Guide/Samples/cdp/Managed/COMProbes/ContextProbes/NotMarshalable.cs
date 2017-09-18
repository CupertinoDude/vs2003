using System;
using System.Threading;
using System.Runtime.InteropServices;

namespace NotMarshalable
{
	public class Test
	{
		public static void AllowQIOfBrokenIMarshal(ComApartment This)
		{
			((ICDPTests)This.Object).AllowQIOfBrokenIMarshal = true;
		}

		public static void Entry(bool enabled)
		{
			StaApartment apt = null;

			try
			{
				apt = new StaApartment(typeof(CDPTests));

				if (enabled)
				{
					apt.InvokeInApt(new StaApartment.Callback(Test.AllowQIOfBrokenIMarshal));
				}

				IFoo foo = apt.Object as IFoo;

				foo.Foo();
			}
			catch(Exception e)
			{
				System.Console.WriteLine("Exception caught in NotMarshalable test: " + e);
			}
			finally
			{
				if (apt != null)
					apt.Exit();
			}
		}
	}
}
