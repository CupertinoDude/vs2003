namespace TlbGen
{
    using System;
	using System.IO;
    using System.Runtime.InteropServices;

    /// <summary>
    ///    Summary description for Resource.
    /// </summary>
    public class Resource
    {
		[DllImport("kernel32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern uint BeginUpdateResource([MarshalAs(UnmanagedType.LPTStr)]string pFileName, 
												bool bDeleteExistingResources);

		[DllImport("kernel32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto, SetLastError=false)]
		static extern bool UpdateResource(uint hUpdate,  
										  [MarshalAs(UnmanagedType.LPTStr)]string lpType,
										  IntPtr lpName,
										  ushort wLanguage, 
										  [MarshalAs(UnmanagedType.LPArray)]byte[] lpData,
										  int cbData);
		[DllImport("kernel32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto, SetLastError=false)]
		static extern bool EndUpdateResource(uint hUpdate,
											 bool fDiscard);

		[DllImport("kernel32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto, SetLastError=false)]
		static extern int GetLastError();

		public static bool	AddTypeLibrary(string assembly, string typelib)
		{
			bool reply = false;

			// First Load the typelibrary and construct the resource data
			try
			{
				byte[] buffer;
				FileStream fs = new FileStream(typelib, FileMode.Open, FileAccess.Read);
				BinaryReader r = new BinaryReader(fs);          // create a Char reader
				buffer = new byte[(int)r.BaseStream.Length];
				r.BaseStream.Seek(0,SeekOrigin.Begin);
				r.Read(buffer,0,(int)r.BaseStream.Length);
				r.Close();

				// Next Load the assembly - add the resource
				uint hUpdate = BeginUpdateResource(assembly, false);
				bool added = UpdateResource(hUpdate, "TYPELIB", (IntPtr)1, 0x0409, buffer, buffer.Length);
				bool complete = EndUpdateResource(hUpdate, false);
				if (!complete)
				{
					int error = GetLastError();
					Console.WriteLine(error);
				}

				if(added && complete)
					reply = true;
			}
			catch(Exception e)
			{
				System.Console.WriteLine("An error occured embedding the Type library:\n" + e.ToString());
			}
			return reply;
		}
	}
}
