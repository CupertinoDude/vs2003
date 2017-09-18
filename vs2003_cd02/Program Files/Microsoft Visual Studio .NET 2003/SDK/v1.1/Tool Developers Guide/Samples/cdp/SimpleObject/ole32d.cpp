#include <windows.h>
#include <objbase.h>
//#include <ole.h>

STDAPI CoInitializeD(
	IN LPVOID pvReserved)
{
	return CoInitialize(pvReserved);
}

STDAPI  CoInitializeExD(
	IN LPVOID pvReserved, 
	IN DWORD dwCoInit)
{
	return CoInitializeEx(pvReserved, dwCoInit);
}

STDAPI_(void) CoUninitializeD(void)
{
	CoUninitialize();
}

STDAPI CoCreateInstanceD(
	IN REFCLSID rclsid, 
	IN LPUNKNOWN pUnkOuter,
    IN DWORD dwClsContext, 
	IN REFIID riid, 
	OUT LPVOID FAR* ppv)
{
	HRESULT hr = CoCreateInstance(
		rclsid, pUnkOuter, dwClsContext, riid, ppv);
	return hr;
}

