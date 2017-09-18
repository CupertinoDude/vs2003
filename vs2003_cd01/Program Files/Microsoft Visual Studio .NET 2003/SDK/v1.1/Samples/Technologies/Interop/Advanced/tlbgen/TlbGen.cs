using System;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace TlbGen
{
	class TypeLibraryGenerator : ProgramBase
	{
		const	string	exe = ".exe";
		const	string	dll = ".dll";

		static TypeLibraryGenerator()
		{
			name	= "TlbGen";
			description = "Typelibrary embedding utility";
			syntax	= name + "[Options] Assembly file [Options]";
			where	= "Assembly file\t\tFile containing the assembly generate a typelibrary from";
			options = new Option[]	{
					  new Option ("/keyfile:keyfile",	"","\tFile containing strong name key pair.", true),
					  new Option ("/keycontainer:keyfile",	"","Key container holding strong name key pair.", true),
					  new Option ("/out:filename","","\tOutput filename - defaults to AssemblyFilename.", true),
					  new Option ("/names:filename","","\tFile specifying the capitalization of names to appear in the typelibrary.", true),
					 };
		}

		private enum REGKIND
		{
			REGKIND_DEFAULT         = 0,
			REGKIND_REGISTER        = 1,
			REGKIND_NONE            = 2
		}

		[DllImport("oleaut32.dll", CharSet = CharSet.Unicode, PreserveSig = false)]
		private static extern void LoadTypeLibEx(string strTypeLibName, REGKIND regKind, out UCOMITypeLib TypeLib);

		static void CopyFile(string from, string to)
		{
			byte[] buffer;
			int length;
			FileStream fs = new FileStream(from, FileMode.Open, FileAccess.Read);
			BinaryReader r = new BinaryReader(fs);          // create a Char reader
			buffer = new byte[(int)r.BaseStream.Length];
			r.BaseStream.Seek(0,SeekOrigin.Begin);
			length = (int)r.BaseStream.Length;
			r.Read(buffer,0,length);
			r.Close();
			fs.Close();
			fs = new FileStream(to, FileMode.Create, FileAccess.Write);
			BinaryWriter w = new BinaryWriter(fs);          // create a Char reader
			w.Write(buffer,0,length);
			w.Close();
			fs.Close();
		}

		static void	EmbedTypelib(string InAssembly, string outfile, string namesfile, bool keycontainer, string keyfile, bool verbose, bool silent)
		{
			string target = InAssembly;
			if (outfile != null)
			{
				InAssembly.ToLower(CultureInfo.InvariantCulture);
				outfile.ToLower(CultureInfo.InvariantCulture);
				if (outfile != InAssembly)
				{
					target = outfile;
					CopyFile(InAssembly, outfile);
				}
			}
			int generatedlib = TlbExp.ExportFrom(InAssembly, namesfile, verbose);
			if (generatedlib > 0)
			{
				string typelib = "";
				typelib =(string)TlbExp.TypeLibs[generatedlib - 1];

				if (Resource.AddTypeLibrary(target, typelib))
					StrongName.ResignAssembly(target, keycontainer, keyfile);
				foreach(string tlb in TlbExp.TypeLibs)
					File.Delete(tlb);

				// Attempt to Load the typelibrary - to ensure that it was successfully embedded
				bool bLoaded = true;
				try
				{
					UCOMITypeLib tlb = null;
					LoadTypeLibEx(target, REGKIND.REGKIND_NONE, out tlb);
					if (tlb == null)			// No Typelib must be an error then
						bLoaded = false;
				}
				catch (Exception)
				{
					bLoaded = false;
				}

				if (bLoaded)
				{
					if(!silent)
						Console.WriteLine("Successfully generated and embedded the type library to " + target);
				}
				else
					throw new Exception("Unable to embed the type library in " + target + " is it write protected?");
			}
		}


		static int	Main(string[] args)
		{
			int		exitcode = 0;
			string	assemblyfile = null;
			bool	keycontainer = false;
			string	keyfile = null;
			string	outfile = null;
			string	namesfile = null;
			bool	silent = false;
			bool 	verbose = false;

			OperatingSystem os = Environment.OSVersion;
			if ( os.Platform != PlatformID.Win32NT)
			{
				if (!silent) PrintLogo();
				WriteErrorMsg("This tool only operates on the Windows NT or higher Operating Systems.");
				exitcode = 0;
				goto done;
			}

			try
			{
				Setting[] switches = GetSwitches(args);

				foreach(Setting sw in switches)
				{
					if (sw.option == null)
					{
						if (assemblyfile != null)
						{
							// We already have an assembly
							if (!silent) PrintLogo();
							WriteErrorMsg("Only one assembly can be converted at a time.");
							exitcode = 1;
							goto done;
						}
						else
						{
							// We are cool with this
							assemblyfile = sw.value;
						}
					}
					else
					{
						if (CompareString(sw.option.value, "/keyfile")==0)
						{
							keyfile = sw.value;
							keycontainer = false;
						}
						else if (CompareString(sw.option.value, "/keycontainer")==0)
						{
							keyfile = sw.value;
							keycontainer = true;
						}
						else if (CompareString(sw.option.value, "/out")==0)
						{
							outfile = sw.value;
						}
						else if (CompareString(sw.option.value, "/names")==0)
						{
							namesfile = sw.value;
						}
						else if (CompareString(sw.option.value, "/verbose")==0)
						{
							if(silent | verbose)
							{
								if (!silent) PrintLogo();
								WriteErrorMsg("Silent and verbose are mutually exclusive switches and can only be specified once.");
								exitcode = 1;
								goto done;
							}
							verbose = true;
						}
						else if (CompareString(sw.option.value, "/silent")==0)
						{
							if(verbose | silent)
							{
								if (!silent) PrintLogo();
								WriteErrorMsg("Silent and verbose are mutually exclusive switches and can only be specified once.");
								exitcode = 1;
								goto done;
							}
							silent = true;
						}
						else if (CompareString(sw.option.value, "/?")==0)
						{
							if (!silent) PrintLogo();
							PrintUsage();
							exitcode = 0;
							goto done;
						}
					}
				}

				if (!silent) PrintLogo();
				if (assemblyfile == null)
				{
					WriteErrorMsg("No Assembly file specified");
					exitcode = 1;
					goto done;
				}

				EmbedTypelib(assemblyfile, outfile, namesfile, keycontainer, keyfile, verbose, silent);
			}
			catch(Exception e)
			{
				Console.WriteLine("TlbGen : " + e.Message);
				return 1;
			}
		done:
			return exitcode;
		}
	}
}
