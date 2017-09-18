!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#------------------------------------------------------------------
#The master rules for building .NET QuickStart Sample applications
# NETSAMPLEPATH Env Variable must be defined

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#------------------------------------------------------------------
SUB_DIRS = QSTools TocSwitch

all :
  rem Sample $(MAKEDIR)
  copy UrlMaker.ascx ..\aspplus\util
  copy UrlMaker.ascx ..\winforms\util
  copy UrlMaker.ascx ..\howto\util

  copy srcref.ascx ..\aspplus\util
  copy srcref.ascx ..\winforms\util
  copy srcref.ascx ..\howto\util
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i all

clean :
  if exist ..\aspplus\util\UrlMaker.ascx del ..\aspplus\util\UrlMaker.ascx
  if exist ..\winforms\util\UrlMaker.ascx del ..\winforms\util\UrlMaker.ascx
  if exist ..\howto\util\UrlMaker.ascx del ..\howto\util\UrlMaker.ascx

  if exist ..\aspplus\util\SrcRef.ascx del ..\aspplus\util\SrcRef.ascx
  if exist ..\winforms\util\SrcRef.ascx del ..\winforms\util\SrcRef.ascx
  if exist ..\howto\util\SrcRef.ascx del ..\howto\util\SrcRef.ascx
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i clean
