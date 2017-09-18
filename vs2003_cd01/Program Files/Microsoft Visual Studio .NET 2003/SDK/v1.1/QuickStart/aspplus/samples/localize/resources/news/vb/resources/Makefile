!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS= articles.resources \
  articles.de.resources \
  articles.en-us.resources \
  articles.ja.resources
CLEANUP = *.resources
#--------------------------------------------------
_IMPORTS=

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
articles.resources: articles.en-us.txt
  resgen articles.en-us.txt articles.resources

clean :
  @for %i in ( $(CLEANUP) ) do @del %i
#--------------------------------------------------
