namespace TlbGen
{
    using System;
    using System.IO;
    using System.Runtime.InteropServices;

    /// <summary>
    ///    Wrap the strongname api's in mscorsn.dll
    /// </summary>
    internal class StrongName
    {
		// Hash and sign a manifest.
		[DllImport("mscoree.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern uint StrongNameErrorInfo();

		[DllImport("mscoree.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern bool StrongNameSignatureGeneration(
										string assemblyPath,					// [in] valid path to the PE file for the assembly
	                                    string keyContainer,				    // [in] desired key container name
	                                    int /*ref byte[]*/ pbKeyBlob,			// [in] public/private key blob (optional)
	                                    int	/*ulong */ cbKeyBlob,
	                                    int /*out byte[]*/ ppbSignatureBlob,	// [out] signature blob
	                                    int /*out ulong */ pcbSignatureBlob);


		[DllImport("mscoree.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern bool StrongNameKeyDelete(string container);				// [in] delete this key container


		// Import key pair into a key container.
		[DllImport("mscoree.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern bool StrongNameKeyInstall(string KeyContainer,			// [in] desired key container name, must be a non-empty string
												byte[] pbKeyBlob,      // [in] public/private key pair blob
												ulong cbKeyBlob);

		[DllImport("kernel32.dll", CharSet=System.Runtime.InteropServices.CharSet.Auto)]
		static extern uint GetCurrentProcessId();

		// Re-sign a previously signed assembly with a key pair from a file or a key
		// container.
		public static void ResignAssembly(string assembly, bool container, string keyfile)
		{
			string	keycontainer = "";
			if(keyfile != null && keyfile != "")
			{
				// Only sign it if the user gave you a key
				if(container)
				{
					keycontainer = keyfile;	
				}
				else
				{
					// a keyfile was provided
				    keycontainer = "TlbGen" + StrongName.GetCurrentProcessId().ToString();
					StrongNameKeyDelete(keycontainer);
					byte[] buffer;
					ulong  length;
					FileStream fs = new FileStream(keyfile, FileMode.OpenOrCreate, FileAccess.Read);
					BinaryReader r = new BinaryReader(fs);          // create a Char reader
					buffer = new byte[(int)r.BaseStream.Length];
					r.BaseStream.Seek(0,SeekOrigin.Begin);
					r.Read(buffer,0,(int)r.BaseStream.Length);
					length = (ulong)r.BaseStream.Length;
					r.Close();
					fs.Close();
				    if (!StrongNameKeyInstall(keycontainer, buffer, length))
					{
				        throw new Exception("Failed to install key pair");
				    }
				}

				// Recompute the signature in the assembly file.
				if (!StrongNameSignatureGeneration(assembly, keycontainer, 0, 0, 0, 0))
				{
					switch (StrongNameErrorInfo())
					{
					case 13:
						throw new Exception("Unable to sign the assembly, it was not originally signed or delay signed");
					default:
						throw new Exception("Failed to sign the assembly " + assembly  + " Error code: " + StrongNameErrorInfo().ToString());
					}
				}

				if (container)
					StrongNameKeyDelete(keycontainer);
			}
			return;
		}
	}
}
