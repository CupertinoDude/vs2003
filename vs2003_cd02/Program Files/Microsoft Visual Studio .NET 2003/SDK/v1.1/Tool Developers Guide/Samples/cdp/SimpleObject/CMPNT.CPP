//
// Cmpnt.cpp
//

#include <objbase.h>
#include <winnt.h>
#include <windows.h>

#include "Error.h"
#include "MIDL\Iface.h"      // Interface declarations
#include "Registry.h"   // Registry helper functions
#include "stdio.h"

///////////////////////////////////////////////////////////
//
// Global variables
//
static HMODULE g_hModule = NULL;   // DLL module handle
static long g_cComponents = 0;     // Count of active components
static long g_cServerLocks = 0;    // Count of locks

// Friendly name of component
const char g_szFriendlyName[] = "Customer Debug Probe COM Object";

// Version-independent ProgID
const char g_szVerIndProgID[] = "CDPObj.1";

// ProgID
const char g_szProgID[] = "CDPObj.1.1";

typedef void (__cdecl *DELEGATE)();

void UniversalMarshaler();

///////////////////////////////////////////////////////////
//
// Component 
//
class CDPObject : 
	public ICDPTests, 
	public IMarshal,
	public IFoo,
	public IUniversalMarshaler
{
public:
	//
	// IUnknown
	//
	virtual STDMETHODIMP QueryInterface(const IID& iid, void** ppv);
	virtual ULONG __stdcall AddRef();
	virtual ULONG __stdcall Release();

	//
	// Interface IFoo
	//
	virtual HRESULT STDMETHODCALLTYPE Foo() { return S_OK; }

	//
	// Interface ICDPTests
	//
    virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_AllowQIOfBrokenIMarshal( 
        /* [retval][out] */ BOOL *pRetVal);

    virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_AllowQIOfBrokenIMarshal( 
        /* [in] */ BOOL NewVal);
    
    virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_FailAllQIs(
        /* [retval][out] */ BOOL *pRetVal);
    
    virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_FailAllQIs(
        /* [in] */ BOOL NewVal);

	//
	// IMarshal
	//
    virtual HRESULT STDMETHODCALLTYPE GetUnmarshalClass( 
        /* [in] */ REFIID riid,
        /* [unique][in] */ void *pv,
        /* [in] */ DWORD dwDestContext,
        /* [unique][in] */ void *pvDestContext,
        /* [in] */ DWORD mshlflags,
        /* [out] */ CLSID *pCid);
    
    virtual HRESULT STDMETHODCALLTYPE GetMarshalSizeMax( 
        /* [in] */ REFIID riid,
        /* [unique][in] */ void *pv,
        /* [in] */ DWORD dwDestContext,
        /* [unique][in] */ void *pvDestContext,
        /* [in] */ DWORD mshlflags,
        /* [out] */ DWORD *pSize);
    
    virtual HRESULT STDMETHODCALLTYPE MarshalInterface( 
        /* [unique][in] */ IStream *pStm,
        /* [in] */ REFIID riid,
        /* [unique][in] */ void *pv,
        /* [in] */ DWORD dwDestContext,
        /* [unique][in] */ void *pvDestContext,
        /* [in] */ DWORD mshlflags);
    
    virtual HRESULT STDMETHODCALLTYPE UnmarshalInterface( 
        /* [unique][in] */ IStream *pStm,
        /* [in] */ REFIID riid,
        /* [out] */ void **ppv);
    
    virtual HRESULT STDMETHODCALLTYPE ReleaseMarshalData( 
        /* [unique][in] */ IStream *pStm);
    
    virtual HRESULT STDMETHODCALLTYPE DisconnectObject( 
        /* [in] */ DWORD dwReserved);

	//
	// Constructor / Destructor
	//
	CDPObject();
	~CDPObject();

private:
//	typedef void (__cdecl *Marshal)();

	// Reference count
	void* m_universalMarshalerVtbl[100];
	DWORD m_aptId;
	long m_cRef;
	DWORD m_bFailAllQIs;
	DWORD m_bAllowQIOfBrokenIMarshal;
};
typedef void (*ThreadStart)(void);
CDPObject::CDPObject() : 
		m_cRef(1), 
		m_bFailAllQIs(FALSE),
		m_bAllowQIOfBrokenIMarshal(FALSE)
{ 
	void** vtbl = *(void***)static_cast<IUniversalMarshaler*>(this);
	m_universalMarshalerVtbl[0] = vtbl[0];	// QI
	m_universalMarshalerVtbl[1] = vtbl[1];	// AddRef
	m_universalMarshalerVtbl[2] = vtbl[2];	// Release
	for (int i = 3; i < sizeof(m_universalMarshalerVtbl)/sizeof(m_universalMarshalerVtbl[0]); i ++)
	{
		m_universalMarshalerVtbl[i] = (void**)UniversalMarshaler;
	}
	*(void**)static_cast<IUniversalMarshaler*>(this) = m_universalMarshalerVtbl;

	m_aptId = GetCurrentThreadId();
	//printf("Created by %d\n", GetCurrentThreadId());
	InterlockedIncrement(&g_cComponents); 
}

CDPObject::~CDPObject() 
{ 
	InterlockedDecrement(&g_cComponents); 
}

HRESULT __stdcall CDPObject::QueryInterface(const IID& iid, void** ppv)
{   
	if (m_bFailAllQIs)
	{
		goto ErrExit;
	}
	else if (iid == IID_IUnknown)
	{
		*ppv = static_cast<ICDPTests*>(this); 
	}
	else if (iid == IID_IFoo)
	{
		*ppv = static_cast<IFoo*>(this); 
	}
	else if (iid == IID_ICDPTests)
	{
		*ppv = static_cast<ICDPTests*>(this);
	}
	else if (iid == IID_IUniversalMarshaler)
	{
		*ppv = static_cast<IUniversalMarshaler*>(this);
	}
	else if (iid == IID_IMarshal && m_bAllowQIOfBrokenIMarshal)
	{
		*ppv = static_cast<IMarshal*>(this);
	}
	else
	{
		goto ErrExit;
	}
	reinterpret_cast<IUnknown*>(*ppv)->AddRef();
	return S_OK;

ErrExit:
	*ppv = NULL;
	return E_NOINTERFACE;
}

ULONG __stdcall CDPObject::AddRef()
{
	return InterlockedIncrement(&m_cRef);
}

ULONG __stdcall CDPObject::Release() 
{
	long ret = InterlockedDecrement(&m_cRef);
	//printf("Release %d\n", m_cRef);
	if (ret == 0)
	{
		delete this;
		return 0;
	}
	return m_cRef;
}



//
// Interface CDPTests
//
void __declspec ( naked ) UniversalMarshaler()
{
	__asm 
	{
		push    ecx
	    mov     eax, esp
		add     eax, 4				; // eax points to ret address
		mov		ecx, [eax]			; // store ret address in ecx
dig:
		add     eax, 4				; // move to next parameter
		cmp     [eax], 0x600DF00D	; // is it the last parameter?
		jne		dig					; // if it's not, dig to next parameter
		mov     [eax], ecx			; // overwrite last parameter with ret address
		pop		ecx					; // restore ecx
		mov     esp, eax			; // esp points to return address
		xor     eax, eax			; // set eax to S_OK
		ret
	}

	// Start
}

// Interface CDPTests
//
HRESULT STDMETHODCALLTYPE CDPObject::get_AllowQIOfBrokenIMarshal(BOOL *pRetVal)
{
	HRESULT hr = S_OK;
	IfNullParamGo(pRetVal);

	*pRetVal = m_bAllowQIOfBrokenIMarshal;

ErrExit:
	return hr;
}

HRESULT STDMETHODCALLTYPE CDPObject::put_AllowQIOfBrokenIMarshal(BOOL NewVal)
{
	m_bAllowQIOfBrokenIMarshal = NewVal;
	return S_OK;
}

HRESULT STDMETHODCALLTYPE CDPObject::get_FailAllQIs (BOOL *pRetVal)
{
	HRESULT hr = S_OK;
	IfNullParamGo(pRetVal);

	*pRetVal = m_bFailAllQIs;

ErrExit:
	return hr;
}

HRESULT STDMETHODCALLTYPE CDPObject::put_FailAllQIs(BOOL NewVal)
{
	m_bFailAllQIs = NewVal;
	return S_OK;
}

//
// IMarshal
//
HRESULT STDMETHODCALLTYPE CDPObject::GetUnmarshalClass( 
    /* [in] */ REFIID riid,
    /* [unique][in] */ void *pv,
    /* [in] */ DWORD dwDestContext,
    /* [unique][in] */ void *pvDestContext,
    /* [in] */ DWORD mshlflags,
    /* [out] */ CLSID *pCid)
{
	return E_NOTIMPL;
}

HRESULT STDMETHODCALLTYPE CDPObject::GetMarshalSizeMax( 
    /* [in] */ REFIID riid,
    /* [unique][in] */ void *pv,
    /* [in] */ DWORD dwDestContext,
    /* [unique][in] */ void *pvDestContext,
    /* [in] */ DWORD mshlflags,
    /* [out] */ DWORD *pSize)
{
	return E_NOTIMPL;
}

HRESULT STDMETHODCALLTYPE CDPObject::MarshalInterface( 
    /* [unique][in] */ IStream *pStm,
    /* [in] */ REFIID riid,
    /* [unique][in] */ void *pv,
    /* [in] */ DWORD dwDestContext,
    /* [unique][in] */ void *pvDestContext,
    /* [in] */ DWORD mshlflags)
{
	return E_NOTIMPL;
}

HRESULT STDMETHODCALLTYPE CDPObject::UnmarshalInterface( 
    /* [unique][in] */ IStream *pStm,
    /* [in] */ REFIID riid,
    /* [out] */ void **ppv)
{
	return E_NOTIMPL;
}

HRESULT STDMETHODCALLTYPE CDPObject::ReleaseMarshalData( 
    /* [unique][in] */ IStream *pStm)
{
	return E_NOTIMPL;
}

HRESULT STDMETHODCALLTYPE CDPObject::DisconnectObject( 
    /* [in] */ DWORD dwReserved)
{
	return E_NOTIMPL;
}
///////////////////////////////////////////////////////////
//
// Class factory
//
class CFactory : public IClassFactory
{
public:
	// IUnknown
	virtual HRESULT __stdcall QueryInterface(const IID& iid, void** ppv);         
	virtual ULONG   __stdcall AddRef();
	virtual ULONG   __stdcall Release();

	// Interface IClassFactory
	virtual HRESULT __stdcall CreateInstance(IUnknown* pUnknownOuter,
	                                         const IID& iid,
	                                         void** ppv);
	virtual HRESULT __stdcall LockServer(BOOL bLock); 

	// Constructor
	CFactory() : m_cRef(1) {}

	// Destructor
	~CFactory() {;}

private:
	long m_cRef;
};
HRESULT __stdcall CFactory::QueryInterface(const IID& iid, void** ppv)
{    
	if ((iid == IID_IUnknown) || (iid == IID_IClassFactory))
	{
		*ppv = static_cast<IClassFactory*>(this); 
	}
	else
	{
		*ppv = NULL;
		return E_NOINTERFACE;
	}
	reinterpret_cast<IUnknown*>(*ppv)->AddRef();
	return S_OK;
}

ULONG __stdcall CFactory::AddRef()
{
	return InterlockedIncrement(&m_cRef);
}

ULONG __stdcall CFactory::Release() 
{
	if (InterlockedDecrement(&m_cRef) == 0)
	{
		delete this;
		return 0;
	}
	return m_cRef;
}

HRESULT __stdcall CFactory::CreateInstance(IUnknown* pUnknownOuter, const IID& iid, void** ppv) 
{
	// Cannot aggregate.
	if (pUnknownOuter != NULL)
	{
		return CLASS_E_NOAGGREGATION;
	}

	// Create component.
	CDPObject* pA = new CDPObject;
	if (pA == NULL)
	{
		return E_OUTOFMEMORY;
	}

	// Get the requested interface.
	HRESULT hr = pA->QueryInterface(iid, ppv);

	// Release the IUnknown pointer.
	// (If QueryInterface failed, component will delete itself.)
	pA->Release();
	return hr;
}

HRESULT __stdcall CFactory::LockServer(BOOL bLock) 
{
	if (bLock)
	{
		InterlockedIncrement(&g_cServerLocks); 
	}
	else
	{
		InterlockedDecrement(&g_cServerLocks);
	}
	return S_OK;
}


///////////////////////////////////////////////////////////
//
// Exported functions
//
STDAPI DllCanUnloadNow()
{
	if ((g_cComponents == 0) && (g_cServerLocks == 0))
	{
		return S_OK;
	}
	else
	{
		return S_FALSE;
	}
}

STDAPI DllGetClassObject(const CLSID& clsid, const IID& iid, void** ppv)
{
	// Can we create this component?
	if (clsid != CLSID_CDPObject)
	{
		return CLASS_E_CLASSNOTAVAILABLE;
	}

	// Create class factory.
	CFactory* pFactory = new CFactory;  // Reference count set to 1
	                                     // in constructor
	if (pFactory == NULL)
	{
		return E_OUTOFMEMORY;
	}

	// Get requested interface.
	HRESULT hr = pFactory->QueryInterface(iid, ppv);
	pFactory->Release();

	return hr;
}

STDAPI DllRegisterServer()
{
	return RegisterServer(g_hModule, 
	                      CLSID_CDPObject,
	                      g_szFriendlyName,
	                      g_szVerIndProgID,
	                      g_szProgID);
}


STDAPI DllUnregisterServer()
{
	return UnregisterServer(CLSID_CDPObject,
	                        g_szVerIndProgID,
	                        g_szProgID);
}

///////////////////////////////////////////////////////////
//
// DLL module information
//
BOOL APIENTRY DllMain(HANDLE hModule, DWORD dwReason, void* lpReserved)
{
	if (dwReason == DLL_PROCESS_ATTACH)
	{
		g_hModule = (HMODULE)hModule;
	}
	return TRUE;
}
