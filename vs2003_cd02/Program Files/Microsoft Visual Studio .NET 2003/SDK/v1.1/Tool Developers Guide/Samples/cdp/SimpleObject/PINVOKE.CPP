#include "windows.h"

typedef void (__cdecl *DELEGATE)();

DELEGATE g_pDelegate;

void __cdecl SetDelegate(DELEGATE pDelegate)
{
	g_pDelegate = pDelegate;
}

void __cdecl CallDelegate()
{
	g_pDelegate();
}

void __cdecl CdeclCall(int p0)
{
	return;
}

void __stdcall StdCall(int p0)
{
	return;
}

class Class {
public:
	void ThisCall(int p0);
};

void Class::ThisCall(int p0)
{ 
	return; 
}










