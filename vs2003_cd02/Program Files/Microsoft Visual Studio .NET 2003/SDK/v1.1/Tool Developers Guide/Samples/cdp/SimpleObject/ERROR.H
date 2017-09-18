#ifndef __ERROR_H__
#define __ERROR_H__

#define IfFailGoto(EXPR, LABEL) \
do { hr = (EXPR); if(FAILED(hr)) { goto LABEL; } } while (0)

#define IfFailWin32Goto(EXPR, LABEL) \
do { hr = (EXPR); if(hr != ERROR_SUCCESS) { hr = HRESULT_FROM_WIN32(hr); goto LABEL; } } while (0)

#define IfNullParamGoto(EXPR, LABEL) \
do { if (NULL == EXPR) { hr = E_INVALIDARG; goto LABEL; } } while (0)

#define IfOutOfMemGoto(EXPR, LABEL) \
do { if (NULL == EXPR) { hr = E_OUTOFMEMORY; goto LABEL; } } while (0)

#define IfBadInterfaceGoto(PV, IID, LABEL) \
do { void *__pv = NULL; IUnknown* __pUnk = reinterpret_cast<IUnknown*>(PV); \
	__pUnk->QueryInterface(IID, &__pv); __pUnk->Release(); \
	if (__pv != PV) { hr = E_UNEXPECTED; goto LABEL; } } while (0)


#define IfFailGo(EXPR) IfFailGoto(EXPR, ErrExit)

#define IfFailWin32(EXPR) IfFailGoto(EXPR, ErrExit)

#define IfNullParamGo(EXPR) IfNullParamGoto(EXPR, ErrExit)

#define IfOutOfMemGo(EXPR) IfOutOfMemGoto(EXPR, ErrExit)

#define IfBadInterfaceGo(PV, IID) IfBadInterfaceGoto(PV, IID, ErrExit)

#endif