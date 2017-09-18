#using <mscorlib.dll>


#include "windows.h"
#include <stdio.h>

#if !defined(BVT)
	#define MARSHALER_GUID S"34E6B1BA-CFD5-4ea3-B0C8-D16DF05C2C4B"
#else
	#define MARSHALER_GUID S"F3E7CD56-612E-49e7-823D-DB33D081EEA3"
#endif

namespace	Marshaler
{
	#ifdef _WIN64
	#define TOINTPTR(x) ((IntPtr)(INT64)(x))
	#define FROMINTPTR(x) ((void*)(x).ToInt64())
	#else
	#define TOINTPTR(x) ((IntPtr)(INT32)(x))
	#define FROMINTPTR(x) ((void*)(x).ToInt32())
	#endif

	using namespace System;
	using namespace System::Reflection;
	using namespace System::Runtime::InteropServices;
	using namespace Microsoft::Win32;

	[DllImport("rpcrt4.dll", EntryPoint="CreateProxyFromTypeInfo", CallingConvention=CallingConvention::StdCall)]
	HRESULT CreateProxyFromTypeInfo(ITypeInfo* pTypeInfo, IUnknown* pUnkOuter, REFIID riid, IRpcProxyBuffer** ppProxy, void** ppv);
	
	[DllImport("rpcrt4.dll", EntryPoint="CreateStubFromTypeInfo", CallingConvention=CallingConvention::StdCall)]
	HRESULT CreateStubFromTypeInfo(ITypeInfo* pTypeInfo, REFIID riid, IUnknown* pUnkServer, IRpcStubBuffer** ppStub);

	/*IPSFactoryBuffer - interface definition for IPSFactoryBuffer - called by oleaut to perform marshaling.
	 *must be implement on a classfactory for a Marshaling class.
	*/
	[
	 ComImport,
	 InterfaceType(ComInterfaceType::InterfaceIsIUnknown),
	 Guid("D5F569D0-593B-101A-B569-08002B2DBF7A")
	]
	__gc __interface IPSFactoryBuffer
	{
		[PreserveSig]
		HRESULT CreateProxy(IUnknown* pUnkOuter, REFIID riid, IRpcProxyBuffer** ppProxy, void** ppv);
		[PreserveSig]
		HRESULT CreateStub(REFIID riid, IUnknown* pUnkServer, IRpcStubBuffer** ppStub);
	};

	/*
	 * Implementation of the ProxyStubMarshaler class factory
	 *
	 *
	*/
	[Guid(MARSHALER_GUID)]
	__gc
	class ProxyStubMarshaler : public IPSFactoryBuffer
	{
	private:
		ProxyStubMarshaler()
		{
			InterlockedIncrement(&s_nFactories);
		}
	protected:
		~ProxyStubMarshaler()
		{
			InterlockedDecrement(&s_nFactories);
		}

		/* Given a native IID go and fetch a ITypeInfo.
		 * Get the managed type and assembly from the registry
		*/
		ITypeInfo*	GetITypeInfoForIID(const IID& riid)
		{
			try
			{
				// Get the assembly name and class from the registry
				Guid iid(riid.Data1, riid.Data2, riid.Data3, riid.Data4[0], riid.Data4[1], riid.Data4[2], riid.Data4[3],
						 riid.Data4[4], riid.Data4[5], riid.Data4[6], riid.Data4[7]);

				RegistryKey* rk = Registry::ClassesRoot->OpenSubKey(String::Concat("Interface\\{", iid.ToString(), "}"), true);
				String* asm_name = dynamic_cast<String*>(rk->GetValue(S"Assembly"));
				String* codebase = dynamic_cast<String*>(rk->GetValue(S"Codebase"));
				String* type_name = dynamic_cast<String*>(rk->GetValue(S"TypeName"));
				rk->Close();
				// We have finished with the registry

				ITypeLib* tl = NULL;
				ITypeInfo* ti = NULL;

				// Load the assembly so that we can fetch it's typelibrary
				Assembly* a = NULL;
				try
				{
					a = Assembly::Load(asm_name, NULL);
				}
				catch(Exception*)
				{
					// If Assembly::Load fails then try to Load from the codebase
					a = Assembly::LoadFrom(codebase);
				}
				Type* t = a->GetType(type_name);
				if (t != NULL)
				{
					ti = (ITypeInfo*)FROMINTPTR(Marshal::GetITypeInfoForType(t));
					if (ti)
					{
						UINT	index;
						ITypeLib* tl = NULL;
						ti->GetContainingTypeLib(&tl, &index);

						//If the interface is the ClassInterface we know this because GetITypeInfo for Type returns the CoClass
						//we should get the correct interface from the typeLibrary.
						::TYPEATTR* attr;
						ti->GetTypeAttr(&attr);
						if (attr->typekind == ::TKIND_COCLASS)
						{
							ti->Release();							// out with the old
							tl->GetTypeInfoOfGuid(riid, &ti);		// in with the new
						}
						tl->Release();
						ti->ReleaseTypeAttr(attr);
						return ti;
					}
				}
				return NULL;
			}
			catch(Exception*)
			{
				return NULL;
			}
			return NULL;
		}


	public:
		static LONG s_nFactories = 0;

		[PreserveSig]
		HRESULT CreateProxy(IUnknown* pUnkOuter, REFIID riid, IRpcProxyBuffer** ppProxy, void** ppv)
		{
			unsigned hr = E_NOINTERFACE;
			ITypeInfo* it = GetITypeInfoForIID(riid);
			if (it != NULL)
			{
				hr = CreateProxyFromTypeInfo(it, pUnkOuter, riid, ppProxy, ppv);
				it->Release();
			}
			return hr;
		}

		[PreserveSig]
		HRESULT CreateStub(REFIID riid, IUnknown* pUnkServer, IRpcStubBuffer** ppStub)
		{
			HRESULT hr = E_NOINTERFACE;
			ITypeInfo* it = GetITypeInfoForIID(riid);
			if (it != NULL)
			{
				hr = CreateStubFromTypeInfo(it, riid, pUnkServer, ppStub);
				it->Release();
			}
			return hr;
		}

		static ProxyStubMarshaler* Factory()
		{
			return new ProxyStubMarshaler();
		}
	};
}

namespace CRT
{
	using namespace Marshaler;
	using namespace System::Runtime::InteropServices;

	STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID * ppv)
	{
		unsigned hr = CLASS_E_CLASSNOTAVAILABLE;

		try
		{
			Object* m = ProxyStubMarshaler::Factory();
			IntPtr ipUnk = Marshal::GetIUnknownForObject(m);
			IUnknown* pClass = (IUnknown*)FROMINTPTR(ipUnk);
			hr = pClass->QueryInterface(riid, ppv);
			pClass->Release();
		}
		catch(Exception*)
		{
			return CLASS_E_CLASSNOTAVAILABLE ;
		}
		return hr;
	}

	STDAPI DllCanUnloadNow()
	{
		return (ProxyStubMarshaler::s_nFactories > 0) ? S_FALSE : S_OK;
	}

	////////////////////////////////////////////////////////////////////////////
	// DllRegisterServer - Adds entries to the system registry

	#define	DOCSTRING "Marshaler.ProxyStubMarshaler"
	//extern "C" unsigned __declspec(dllexport)
	STDAPI DllRegisterServer(void)
	{
		try
		{
            // Create the HKEY_CLASS_ROOT\CLSID\<CLSID> key.
			String * clsid = String::Concat(S"{", MARSHALER_GUID, S"}");
            RegistryKey* ClsIdKey = Registry::ClassesRoot->OpenSubKey("CLSID", true)->CreateSubKey(clsid);
            ClsIdKey->SetValue("", S"CLR marshaler");

            // Create the HKEY_CLASS_ROOT\CLSID\<CLSID>\InprocServer32 key.
            RegistryKey* InProcServerKey = ClsIdKey->CreateSubKey("InprocServer32");
            InProcServerKey->SetValue("", Assembly::GetExecutingAssembly()->Location);
            InProcServerKey->Close();
			return S_OK;
		}
		catch(Exception* e)
		{
			char buffer[1024];
			sprintf(buffer, "Error : %s\n", e->ToString());
			MessageBox(0, buffer, "Error registering Marshaler.dll", 0);
		}
		return E_FAIL;
	}

	////////////////////////////////////////////////////////////////////////////
	// DllUnregisterServer - Removes entries from the system registry
	//extern "C" unsigned __declspec(dllexport)
	STDAPI DllUnregisterServer(void)
	{
		try
		{
            // Create the HKEY_CLASS_ROOT\CLSID\<CLSID> key.
			String * clsid = String::Concat(S"{", MARSHALER_GUID, S"}");
            RegistryKey* ClsIdKey = Registry::ClassesRoot->OpenSubKey("CLSID", true);
            ClsIdKey->DeleteSubKey(String::Concat(clsid, "\\InprocServer32"));
            ClsIdKey->DeleteSubKey(clsid);
            ClsIdKey->Close();
			return S_OK;
		}
		catch(Exception* e)
		{
			char buffer[1024];
			sprintf(buffer, "Error : %s\n", e->ToString());
			MessageBox(0, buffer, "Error registering Marshaler.dll", 0);
		}
		return E_FAIL;
	}
}


