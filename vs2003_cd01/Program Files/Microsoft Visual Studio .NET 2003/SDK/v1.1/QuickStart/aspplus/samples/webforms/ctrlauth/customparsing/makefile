!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SUB_DIRS = CS JS VB

#--------------------------------------------------
all :
  rem Sample $(MAKEDIR)
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i all

clean :
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i clean
#--------------------------------------------------

