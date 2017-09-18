using System;
using System.Collections;
using System.IO;
using System.Security.Permissions;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Runtime.Remoting;
using System.Security.Policy;

namespace TlbGen
{
	[ComImport,
	 GuidAttribute("00020406-0000-0000-C000-000000000046"),
	 InterfaceTypeAttribute(ComInterfaceType.InterfaceIsIUnknown),
	 ComVisible(false)
	]
	public interface UCOMICreateITypeLib
	{
	    void CreateTypeInfo();
	    void SetName();
	    void SetVersion();
	    void SetGuid();
	    void SetDocString();
	    void SetHelpFileName();
	    void SetHelpContext();
	    void SetLcid();
	    void SetLibFlags();
	    void SaveAllChanges();
	}



	public	class TypelibExporter : MarshalByRefObject, ITypeLibExporterNotifySink, ITypeLibExporterNameProvider
	{
		static internal ArrayList m_TypeLibs = new ArrayList();
		string 	m_namesfile;
		bool	m_verbose;

		void ITypeLibExporterNotifySink.ReportEvent(ExporterEventKind EventKind, int EventCode, String EventMsg)
		{
			if(m_verbose)
				Console.WriteLine(EventMsg);
		}

		public ArrayList TypeLibs
		{
			get
			{
				return m_TypeLibs;
			}
		}

		Object ITypeLibExporterNotifySink.ResolveRef(Assembly asm)
		{
			UCOMITypeLib rslt = null;
			// Export the typelib for the module.
			if(m_verbose)
				Console.WriteLine("Exporting typelibrary for : " + asm.ToString());
	        rslt = ExportAssembly(asm);
			if(m_verbose)
				Console.WriteLine("Finished export for : " + asm.ToString());
			return rslt;
		}

		public UCOMITypeLib ExportAssembly(Assembly asm)
		{
			UCOMITypeLib Tlb = null;
			if (asm != null)
			{
				try
				{
					string tlbname = asm.GetName().Name + ".tlb";
					ITypeLibConverter TLBConv = new TypeLibConverter();
					Tlb = (UCOMITypeLib)TLBConv.ConvertAssemblyToTypeLib(asm, tlbname, 0, this);
					try
					{
					    UCOMICreateITypeLib CreateTlb = (UCOMICreateITypeLib)Tlb;
					    CreateTlb.SaveAllChanges();
						m_TypeLibs.Add(tlbname);
					}
					catch (COMException e)
					{
					    throw new ApplicationException("Error saving the typeLib : " + e.ErrorCode.ToString("x"));
					}
				}
				catch (Exception e)
				{
				    throw new ApplicationException("Error Converting assembly" + e);
				}
			}
			return Tlb;
		}
		public UCOMITypeLib ExportAssembly(string assemblyfile, string namesfile, bool verbose)
		{
			m_verbose = verbose;
			m_namesfile = namesfile;
			return ExportAssembly(Assembly.LoadFrom(assemblyfile));
		}

	    string[] ITypeLibExporterNameProvider.GetNames()
	    {
	        if (m_namesfile == null) return new string[0];

			string  str;                        // An input line.
			ArrayList lst = new ArrayList();	// The output array.

	        // Open the input file.
	        FileStream fs = new FileStream(m_namesfile, FileMode.Open, FileAccess.Read);
	        StreamReader r = new StreamReader(fs);

	        // Read each line.
	        while ((str=r.ReadLine()) != null)
	        {
	            // Eliminate comments
	            int cKeep = str.IndexOf('#');
	            if (cKeep >= 0)
    	            str = str.Substring(0, cKeep);

	        	// Trim whitespace and don't consider blank lines
	            str = str.Trim();
	            if (str.Length == 0) continue;

				lst.Add(str);
	        }
	        r.Close();

 			String[] rslt = new String[lst.Count];
 			Array.Copy(lst.ToArray(), rslt, lst.Count);
			return rslt;
	    }
	}

	public	class TlbExp
	{
		static private	ArrayList m_TypeLibs = new ArrayList();
		static public ArrayList TypeLibs
		{
			get
			{
				return m_TypeLibs;
			}
		}
		static public	int ExportFrom(string assemblyfile, string namesfile, bool verbose)
		{
			string adname = "TlbGen : " + Guid.NewGuid().ToString();
			Evidence si = null;
            AppDomain ad = AppDomain.CreateDomain(adname, si);
			TypelibExporter t = (TypelibExporter)ad.CreateInstanceAndUnwrap(Assembly.GetAssembly(typeof(TlbGen.TypelibExporter)).FullName, typeof(TlbGen.TypelibExporter).FullName);
			t.ExportAssembly(assemblyfile, namesfile, verbose);

			// Note:	Static members are not shared between appdomains
			// so we must copy them back from the other appdomain
			foreach(string s in t.TypeLibs)
			{
				m_TypeLibs.Add(s);
			}
			AppDomain.Unload(ad);
			return TlbExp.m_TypeLibs.Count;
		}

	}
}
