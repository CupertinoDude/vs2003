
TARGETS = LoanLib.dll
CLEANUP = *.dll
#--------------------------------------------------
all : $(TARGETS)

clean :
  if exist *.dll del *.dll

#--------------------------------------------------

LoanLib.dll :
	tlbimp ../../LoanLib/LoanLib.dll /out:$*.dll

